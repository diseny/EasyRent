package es.uji.ei1027.easyrent.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import es.uji.ei1027.easyrent.domain.Credentials;
import es.uji.ei1027.easyrent.domain.Period;
import es.uji.ei1027.easyrent.domain.Property;

@Repository
public class PeriodDao {

	private JdbcTemplate jdbcTemplate;
    
	@Autowired
	public void setDataSource(DataSource dataSource) {
	        this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	private static final class PeriodMapper implements RowMapper<Period> {

	    public Period mapRow(ResultSet rs, int rowNum) throws SQLException { 
	    	Period period = new Period();
	    	period.setPropertyId(rs.getInt("property_id"));
	    	period.setPeriodId(rs.getInt("period_id"));
	    	period.setStart(rs.getString("start_date"));
	    	period.setFinish(rs.getString("finish_date"));
	    	return period;
	    }
	}
	
	public void addPeriod(Period period){
		String []start = period.getStart().split("/");
		String []finish = period.getFinish().split("/");
		this.jdbcTemplate.update("INSERT INTO Period(property_id, period_id, start_date, finish_date) VALUES(?, ?, ?, ?);", period.getPropertyId(), period.getPeriodId(), new java.sql.Date(Integer.parseInt(start[2])-1900,Integer.parseInt(start[1])-1,Integer.parseInt(start[0])),new java.sql.Date(Integer.parseInt(finish[2])-1900,Integer.parseInt(finish[1])-1,Integer.parseInt(finish[0])));
	}

	public List<Integer> getPropertiesIdPeriod(String start, String finish) {
		String query = "SELECT DISTINCT property_id FROM Period WHERE start_date<='" + start + "' AND finish_date>='" + finish + "';";
		return this.jdbcTemplate.queryForList(query, Integer.class);
	}
	
	public List<Period> getPeriods(int id){
		String query= "SELECT * from Period WHERE property_id =" + id + ";";
		return this.jdbcTemplate.query(query,  new PeriodMapper());
	}
	
	public Period getPeriod(int propertyId, int periodId){
		String query= "SELECT * from Period WHERE property_id=" + propertyId + " AND period_id=" + periodId + ";";
		return this.jdbcTemplate.queryForObject(query,  new PeriodMapper());
	}
	
	public void addPeriod(Property property) throws PSQLException{
		String query = " INSERT INTO period(property_id ,period_id,start_date,finish_date) VALUES(" + property.getId() + "," + property.getPeriodId() + ",'" + property.getStart() + "','" + property.getFinish()+ "');";
		this.jdbcTemplate.update(query);
	}
	
	public void deletePeriod(int propertyId, int periodId){
		String query = "DELETE FROM Period WHERE property_id=" + propertyId + " AND period_id=" + periodId + ";";
		this.jdbcTemplate.update(query);
	}
	
}

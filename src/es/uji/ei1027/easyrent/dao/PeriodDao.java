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

import es.uji.ei1027.easyrent.domain.AddPeriod;
import es.uji.ei1027.easyrent.domain.AddProperty;
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
	    	period.setPeriodId(rs.getInt("property_id"));
	    	period.setStart(rs.getDate("start_date"));
	    	period.setFinish(rs.getDate("finish_date"));
	    	return period;
	    }
	}

	public List<Integer> getPropertiesIdPeriod(String start, String finish) {
		String query = "SELECT DISTINCT property_id FROM Period WHERE start_date<='" + start + "' AND finish_date>='" + finish + "';";
		return this.jdbcTemplate.queryForList(query, Integer.class);
	}
	
	public List<Period> getPeriods(int id){
		String query= "SELECT * from Period WHERE property_id ="+id +";";
		return this.jdbcTemplate.query(query,  new PeriodMapper());
	}
	public void addPeriod(AddProperty property) throws PSQLException{
		
		String query= " INSERT INTO period(property_id ,period_id,start_date,finish_date) VALUES("+property.getPropertyId()+","+property.getPeriodId()+",'"+ property.getStart()+"','"+property.getFinish()+"');";
		this.jdbcTemplate.update(query);
		
	}
}

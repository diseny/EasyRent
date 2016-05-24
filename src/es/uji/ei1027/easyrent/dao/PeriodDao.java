package es.uji.ei1027.easyrent.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import es.uji.ei1027.easyrent.domain.Period;

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
	    	period.setPropertyID(rs.getInt("property_id"));
	    	period.setPeriodID(rs.getInt("property_id"));
	    	period.setStart(rs.getDate("start_date"));
	    	period.setFinish(rs.getDate("finish_date"));
	    	return period;
	    }
	}

	public List<Integer> getPropertiesIdPeriod(String start, String finish) {
		String query = "SELECT DISTINCT property_id FROM Period WHERE start_date<='" + start + "' AND finish_date>='" + finish + "';";
		return this.jdbcTemplate.queryForList(query, Integer.class);
	}
	
}

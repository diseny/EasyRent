package es.uji.ei1027.easyrent.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import es.uji.ei1027.easyrent.domain.Property;
import es.uji.ei1027.easyrent.domain.Service;

@Repository
public class ServiceDao {

	private JdbcTemplate jdbcTemplate;
    
	@Autowired
	public void setDataSource(DataSource dataSource) {
	        this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	private static final class ServiceMapper implements RowMapper<Service> {

	    public Service mapRow(ResultSet rs, int rowNum) throws SQLException { 
	    	Service service = new Service();
	    	service.setID(rs.getInt("id"));
	    	service.setName(rs.getString("name"));
	    	return service;
	    }
	}

	public List<Service> getServices() {
		String query = "SELECT * FROM Service;";
		return this.jdbcTemplate.query(query, new ServiceMapper());
	}
	
}

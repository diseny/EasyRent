package es.uji.ei1027.easyrent.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import es.uji.ei1027.easyrent.domain.ServiceProperty;

@Repository
public class ServicePropertyDao {

	private JdbcTemplate jdbcTemplate;
    
	@Autowired
	public void setDataSource(DataSource dataSource) {
	        this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	private static final class ServicePropertyMapper implements RowMapper<ServiceProperty> {

	    public ServiceProperty mapRow(ResultSet rs, int rowNum) throws SQLException { 
	    	ServiceProperty serviceProperty = new ServiceProperty();
	    	serviceProperty.setPropertyId(rs.getInt("property_id"));
	    	serviceProperty.setServiceId(rs.getInt("service_id"));
	    	return serviceProperty;
	    }
	}

	public List<ServiceProperty> getServicesProperties() {
		String query = "SELECT * FROM ServiceProperty;";
		return this.jdbcTemplate.query(query, new ServicePropertyMapper());
	}
	
}

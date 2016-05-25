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

import es.uji.ei1027.easyrent.domain.Tenant;

@Repository
public class TenantDao {

	private JdbcTemplate jdbcTemplate;
    
	@Autowired
	public void setDataSource(DataSource dataSource) {
	        this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	private static final class TenantMapper implements RowMapper<Tenant> {

	    public Tenant mapRow(ResultSet rs, int rowNum) throws SQLException { 
	    	Tenant tenant = new Tenant();
	    	tenant.setUsername(rs.getString("username"));
	    	tenant.setNationalId(rs.getString("national_id"));
	    	tenant.setName(rs.getString("name"));
	    	tenant.setSurname(rs.getString("surname"));
	    	tenant.setEmail(rs.getString("email"));
	    	tenant.setPostalAddress(rs.getString("postal_address"));
	    	tenant.setRegistrationDate(rs.getString("registration_date"));
	    	tenant.setPhoneNumber(rs.getString("phone_number"));
	    	return tenant;
	    }
	}

	public List<Tenant> getTenants() {
		 return this.jdbcTemplate.query("SELECT * FROM Tenant;", new TenantMapper());
	}	 
		
	public Tenant getTenant(String username){
		return this.jdbcTemplate.queryForObject("SELECT * FROM Tenant WHERE username=?;",  new Object[] {username}, new TenantMapper());
	}
	
	public void addTenant(Tenant tenant) throws PSQLException{
		String []fecha = tenant.getRegistrationDate().split("-");
		this.jdbcTemplate.update("INSERT INTO Tenant(username, national_id, name, surname, email, postal_address, registration_date, phone_number) VALUES(?, ?, ?, ?, ?, ?, ?, ?);", tenant.getUsername(), tenant.getNationalId(), tenant.getName(), tenant.getSurname(), tenant.getEmail(), tenant.getPostalAddress(), new java.sql.Date(Integer.parseInt(fecha[0])-1900,Integer.parseInt(fecha[1])-1,Integer.parseInt(fecha[2])), tenant.getPhoneNumber());
	}
		
	public void updateTenant(Tenant tenant) {
		String []fecha = tenant.getRegistrationDate().split("-");
		this.jdbcTemplate.update("UPDATE Tenant SET national_id = ?, name = ?, surname = ?, email = ?, postal_address = ?, registration_date = ?, phone_number = ? WHERE username = ?;", tenant.getNationalId(), tenant.getName(), tenant.getSurname(), tenant.getEmail(), tenant.getPostalAddress(), new java.sql.Date(Integer.parseInt(fecha[0])-1900,Integer.parseInt(fecha[1])-1,Integer.parseInt(fecha[2])), tenant.getPhoneNumber(), tenant.getUsername());
	}
		
	public void deleteTenant(Tenant tenant) {
		this.jdbcTemplate.update("DELETE FROM Tenant WHERE username=?;", tenant.getUsername());
	}
	
}

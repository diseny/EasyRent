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

import es.uji.ei1027.easyrent.domain.Administrator;

@Repository
public class AdministratorDao {

	private JdbcTemplate jdbcTemplate;
    
	@Autowired
	public void setDataSource(DataSource dataSource) {
	        this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	private static final class AdministratorMapper implements RowMapper<Administrator> {

	    public Administrator mapRow(ResultSet rs, int rowNum) throws SQLException { 
	    	Administrator administrator = new Administrator();
	    	administrator.setUsername(rs.getString("username"));
	    	administrator.setNationalId(rs.getString("national_id"));
	    	administrator.setName(rs.getString("name"));
	    	administrator.setSurname(rs.getString("surname"));
	    	administrator.setEmail(rs.getString("email"));
	    	administrator.setPostalAddress(rs.getString("postal_address"));
	    	administrator.setRegistrationDate(rs.getString("registration_date"));
	    	administrator.setPhoneNumber(rs.getString("phone_number"));
	    	administrator.setIsActive(rs.getBoolean("is_active"));
	    	return administrator;
	    }
	}

	public List<Administrator> getAdministrators() {
		 return this.jdbcTemplate.query("SELECT * FROM Administrator;", new AdministratorMapper());
	}	 
		
	public Administrator getAdministrator(String username) {
		return this.jdbcTemplate.queryForObject("SELECT * FROM Administrator WHERE username=?;",  new Object[] {username}, new AdministratorMapper());
	}
	
	public void addAdministrator(Administrator administrator) throws PSQLException{
		String []fecha = administrator.getRegistrationDate().split("-");
		this.jdbcTemplate.update("INSERT INTO Administrator(username, national_id, name, surname, email, postal_address, registration_date, phone_number, is_active) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?);", administrator.getUsername(), administrator.getNationalId(), administrator.getName(), administrator.getSurname(), administrator.getEmail(), administrator.getPostalAddress(), new java.sql.Date(Integer.parseInt(fecha[0])-1900,Integer.parseInt(fecha[1])-1,Integer.parseInt(fecha[2])), administrator.getPhoneNumber(), administrator.getIsActive());
	}
		
	public void updateAdministrator(Administrator administrator) {
		String []fecha = administrator.getRegistrationDate().split("-");
		this.jdbcTemplate.update("UPDATE Administrator SET national_id = ?, name = ?, surname = ?, email = ?, postal_address = ?, registration_date = ?, phone_number = ?, is_active = ? WHERE username = ?;", administrator.getNationalId(), administrator.getName(), administrator.getSurname(), administrator.getEmail(), administrator.getPostalAddress(), new java.sql.Date(Integer.parseInt(fecha[0])-1900,Integer.parseInt(fecha[1])-1,Integer.parseInt(fecha[2])), administrator.getPhoneNumber(), administrator.getIsActive(), administrator.getUsername());
	}
		
	public void deleteAdministrator(Administrator administrator) {
		this.jdbcTemplate.update("DELETE FROM Administrator WHERE username=?;", administrator.getUsername());
	}
	
}

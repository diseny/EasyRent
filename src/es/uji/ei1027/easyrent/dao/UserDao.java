package es.uji.ei1027.easyrent.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.jasypt.util.password.BasicPasswordEncryptor;
import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import es.uji.ei1027.easyrent.domain.Credentials;
import es.uji.ei1027.easyrent.domain.User;

@Repository
public class UserDao {

	private JdbcTemplate jdbcTemplate;
	private List<Credentials> list;
    
	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	private static final class CredentialsMapper implements RowMapper<Credentials> {

	    public Credentials mapRow(ResultSet rs, int rowNum) throws SQLException { 
	    	Credentials credentials = new Credentials();
			credentials.setUsername(rs.getString("username"));
			credentials.setPassword(rs.getString("pwd"));
			credentials.setRole(rs.getString("role"));
	    	return credentials;
	    }
	}
	
	public List<Credentials> getCredentials() {
		 return this.jdbcTemplate.query("SELECT * FROM Credentials;", new CredentialsMapper());
	}
	
	public Credentials loadUserByUsername(String username, String password){
		list = this.jdbcTemplate.query("SELECT * FROM Credentials;", new CredentialsMapper());
		Credentials user = null;
		for(Credentials c: list){
			if(c.getUsername().equals(username)){
				user = c;
				break;
			}
		}
		if (user == null)
			return null;
		if (password.equals(user.getPassword())) {
			return user; 
		}
		else {
			return null;
		}
	}
	
	public void addCredentials(User user) throws PSQLException{
		this.jdbcTemplate.update("INSERT INTO Credentials(username, pwd, role) VALUES(?, ?, ?);", user.getUsername(), user.getPassword(), user.getRole());
	}
	
	public void addAdministrator(User user) throws PSQLException{
		String []fecha = user.getRegistrationDate().split("-");
		this.jdbcTemplate.update("INSERT INTO Administrator(username, national_id, name, surname, email, postal_address, registration_date, phone_number, is_active) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?);", user.getUsername(), user.getNationalId(), user.getName(), user.getSurname(), user.getEmail(), user.getPostalAddress(), new java.sql.Date(Integer.parseInt(fecha[0])-1900,Integer.parseInt(fecha[1])-1,Integer.parseInt(fecha[2])), user.getPhoneNumber(), user.getIsActive());
	}
	
	public void addOwner(User user) throws PSQLException{
		String []fecha = user.getRegistrationDate().split("-");
		this.jdbcTemplate.update("INSERT INTO Owner(username, national_id, name, surname, email, postal_address, registration_date, phone_number, is_active) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?);", user.getUsername(), user.getNationalId(), user.getName(), user.getSurname(), user.getEmail(), user.getPostalAddress(), new java.sql.Date(Integer.parseInt(fecha[0])-1900,Integer.parseInt(fecha[1])-1,Integer.parseInt(fecha[2])), user.getPhoneNumber(), user.getIsActive());
	}
	
	public void addTenant(User user) throws PSQLException{
		String []fecha = user.getRegistrationDate().split("-");
		this.jdbcTemplate.update("INSERT INTO Tenant(username, national_id, name, surname, email, postal_address, registration_date, phone_number, is_active) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?);", user.getUsername(), user.getNationalId(), user.getName(), user.getSurname(), user.getEmail(), user.getPostalAddress(), new java.sql.Date(Integer.parseInt(fecha[0])-1900,Integer.parseInt(fecha[1])-1,Integer.parseInt(fecha[2])), user.getPhoneNumber(), user.getIsActive());
	}

}
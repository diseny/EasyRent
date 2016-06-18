package es.uji.ei1027.easyrent.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.jasypt.util.password.BasicPasswordEncryptor;
import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import es.uji.ei1027.easyrent.domain.Credentials;
import es.uji.ei1027.easyrent.domain.User;
import es.uji.ei1027.easyrent.domain.UserSession;

@Repository
public class UserDao {

	private JdbcTemplate jdbcTemplate;
    
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
			credentials.setIsActive(rs.getBoolean("is_active"));
	    	return credentials;
	    }
	}
	
	private static final class UserMapper implements RowMapper<User> {

	    public User mapRow(ResultSet rs, int rowNum) throws SQLException { 
	    	User user = new User();
			user.setUsername(rs.getString("username"));
			user.setName(rs.getString("name"));
			user.setSurname(rs.getString("surname"));
			user.setEmail(rs.getString("email"));
			user.setPhoneNumber(rs.getString("phone_number"));
			return user;
	    }
	}
	
	public List<Credentials> getCredentials() {
		 return this.jdbcTemplate.query("SELECT * FROM Credentials;", new CredentialsMapper());
	}
	
	public Credentials getCredentials(String username) {
		String query = "SELECT * FROM Credentials WHERE username='" + username + "';";
		return this.jdbcTemplate.queryForObject(query, new CredentialsMapper());
	}
	
	public Credentials loadUserByUsername(String username, String password){
		Credentials	credentials = this.jdbcTemplate.queryForObject("SELECT * FROM Credentials WHERE username=?;",  new Object[] {username}, new CredentialsMapper());
		BasicPasswordEncryptor passwordEncryptor = new BasicPasswordEncryptor(); 
		if (passwordEncryptor.checkPassword(password, credentials.getPassword())) {
			return credentials;
		}
		return null;
	}
	
	public void addCredentials(User user) throws PSQLException{
		this.jdbcTemplate.update("INSERT INTO Credentials(username, pwd, role, is_active) VALUES(?, ?, ?, ?);", user.getUsername(), user.getPassword(), user.getRole(), user.getIsActive());
	}
	
	public void addAdministrator(User user) throws PSQLException{
		String []fecha = user.getRegistrationDate().split("-");
		this.jdbcTemplate.update("INSERT INTO Administrator(username, national_id, name, surname, email, postal_address, registration_date, phone_number) VALUES(?, ?, ?, ?, ?, ?, ?, ?);", user.getUsername(), user.getNationalId(), user.getName(), user.getSurname(), user.getEmail(), user.getPostalAddress(), new java.sql.Date(Integer.parseInt(fecha[0])-1900,Integer.parseInt(fecha[1])-1,Integer.parseInt(fecha[2])), user.getPhoneNumber());
	}
	
	public void addOwner(User user) throws PSQLException{
		String []fecha = user.getRegistrationDate().split("-");
		this.jdbcTemplate.update("INSERT INTO Owner(username, national_id, name, surname, email, postal_address, registration_date, phone_number) VALUES(?, ?, ?, ?, ?, ?, ?, ?);", user.getUsername(), user.getNationalId(), user.getName(), user.getSurname(), user.getEmail(), user.getPostalAddress(), new java.sql.Date(Integer.parseInt(fecha[0])-1900,Integer.parseInt(fecha[1])-1,Integer.parseInt(fecha[2])), user.getPhoneNumber());
	}
	
	public void addTenant(User user) throws PSQLException{
		String []fecha = user.getRegistrationDate().split("-");
		this.jdbcTemplate.update("INSERT INTO Tenant(username, national_id, name, surname, email, postal_address, registration_date, phone_number) VALUES(?, ?, ?, ?, ?, ?, ?, ?);", user.getUsername(), user.getNationalId(), user.getName(), user.getSurname(), user.getEmail(), user.getPostalAddress(), new java.sql.Date(Integer.parseInt(fecha[0])-1900,Integer.parseInt(fecha[1])-1,Integer.parseInt(fecha[2])), user.getPhoneNumber());
	}

	public void updateCredentials(User user) throws PSQLException{
		this.jdbcTemplate.update("UPDATE Credentials SET pwd = ?, role = ?, is_active = ? WHERE username = ?;", user.getPassword(), user.getRole(), user.getIsActive(), user.getUsername());
	}
	
	public void administratorUpdateCredentials(Credentials user) throws PSQLException{
		this.jdbcTemplate.update("UPDATE Credentials SET pwd = ?, role = ?, is_active = ? WHERE username = ?;", user.getPassword(), user.getRole(), user.getIsActive(), user.getUsername());
	}
	
	public void updateAdministrator(User user) throws PSQLException{
		String []fecha = user.getRegistrationDate().split("-");
		this.jdbcTemplate.update("UPDATE Administrator SET national_id = ?, name = ?, surname = ?, email = ?, postal_address = ?, registration_date = ?, phone_number = ? WHERE username = ?;", user.getNationalId(), user.getName(), user.getSurname(), user.getEmail(), user.getPostalAddress(), new java.sql.Date(Integer.parseInt(fecha[0])-1900,Integer.parseInt(fecha[1])-1,Integer.parseInt(fecha[2])), user.getPhoneNumber(), user.getIsActive(), user.getUsername());
	}
	
	public void updateOwner(User user) throws PSQLException{
		String []fecha = user.getRegistrationDate().split("-");
		this.jdbcTemplate.update("UPDATE Owner SET national_id = ?, name = ?, surname = ?, email = ?, postal_address = ?, registration_date = ?, phone_number = ? WHERE username = ?;", user.getNationalId(), user.getName(), user.getSurname(), user.getEmail(), user.getPostalAddress(), new java.sql.Date(Integer.parseInt(fecha[0])-1900,Integer.parseInt(fecha[1])-1,Integer.parseInt(fecha[2])), user.getPhoneNumber(), user.getUsername());
	}
	
	public void updateTenant(User user) throws PSQLException{
		String []fecha = user.getRegistrationDate().split("-");
		this.jdbcTemplate.update("UPDATE Tenant SET national_id = ?, name = ?, surname = ?, email = ?, postal_address = ?, registration_date = ?, phone_number = ? WHERE username = ?;", user.getNationalId(), user.getName(), user.getSurname(), user.getEmail(), user.getPostalAddress(), new java.sql.Date(Integer.parseInt(fecha[0])-1900,Integer.parseInt(fecha[1])-1,Integer.parseInt(fecha[2])), user.getPhoneNumber(), user.getUsername());
	}
	
	public User getOwner(String username){
		String query = "SELECT * FROM Owner WHERE username='" + username + "';";
		return this.jdbcTemplate.queryForObject(query, new UserMapper());
	}
	
	public User getTenant(String username){
		String query = "SELECT * FROM Tenant WHERE username='" + username + "';";
		return this.jdbcTemplate.queryForObject(query, new UserMapper());
	}
	
}
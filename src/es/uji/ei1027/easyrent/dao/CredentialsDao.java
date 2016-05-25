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

import es.uji.ei1027.easyrent.domain.Credentials;
import es.uji.ei1027.easyrent.domain.User;

@Repository
public class CredentialsDao {

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

	public List<Credentials> getCredentials() {
		 return this.jdbcTemplate.query("SELECT * FROM Credentials;", new CredentialsMapper());
	}	 
		
	public Credentials getCredentials(String username) {
		return this.jdbcTemplate.queryForObject("SELECT * FROM Credentials WHERE username=?;",  new Object[] {username}, new CredentialsMapper());
	}
	
	public void addCredentials(Credentials credentials) throws PSQLException{
		this.jdbcTemplate.update("INSERT INTO Credentials(username, pwd, role, is_active) VALUES(?, ?, ?, ?);", credentials.getUsername(), credentials.getPassword(), credentials.getRole(), credentials.getIsActive());
	}
		
	public void updateCredentials(User credentials) {
		this.jdbcTemplate.update("UPDATE Credentials SET pwd = ?, role = ?, is_active = ? WHERE username = ?;", credentials.getPassword(), credentials.getRole(), credentials.getIsActive(), credentials.getUsername());
	}
		
	public void deleteCredentials(Credentials credentials) {
		this.jdbcTemplate.update("DELETE FROM Credentials WHERE username=?;", credentials.getUsername());
	}
	
}

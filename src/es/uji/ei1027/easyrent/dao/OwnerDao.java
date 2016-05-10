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

import es.uji.ei1027.easyrent.domain.Owner;

@Repository
public class OwnerDao {

	private JdbcTemplate jdbcTemplate;
    
	@Autowired
	public void setDataSource(DataSource dataSource) {
	        this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	private static final class OwnerMapper implements RowMapper<Owner> {

	    public Owner mapRow(ResultSet rs, int rowNum) throws SQLException { 
	    	Owner owner = new Owner();
	    	owner.setUsername(rs.getString("username"));
	    	owner.setNationalId(rs.getString("national_id"));
	    	owner.setName(rs.getString("name"));
	    	owner.setSurname(rs.getString("surname"));
	    	owner.setEmail(rs.getString("email"));
	    	owner.setPostalAddress(rs.getString("postal_address"));
	    	owner.setRegistrationDate(rs.getString("registration_date"));
	    	owner.setPhoneNumber(rs.getString("phone_number"));
	    	owner.setIsActive(rs.getBoolean("is_active"));
	    	return owner;
	    }
	}

	public List<Owner> getOwners() {
		 return this.jdbcTemplate.query("SELECT * FROM Owner;", new OwnerMapper());
	}	 
		
	public Owner getOwner(String username) {
		return this.jdbcTemplate.queryForObject("SELECT * FROM Owner WHERE username=?;",  new Object[] {username}, new OwnerMapper());
	}
	
	public void addOwner(Owner owner) throws PSQLException{
		String []fecha = owner.getRegistrationDate().split("-");
		this.jdbcTemplate.update("INSERT INTO owner(username, national_id, name, surname, email, postal_address, registration_date, phone_number, is_active) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?);", owner.getUsername(), owner.getNationalId(), owner.getName(), owner.getSurname(), owner.getEmail(), owner.getPostalAddress(), new java.sql.Date(Integer.parseInt(fecha[0])-1900,Integer.parseInt(fecha[1])-1,Integer.parseInt(fecha[2])), owner.getPhoneNumber(), owner.getIsActive());
	}
		
	public void updateOwner(Owner owner) {
		String []fecha = owner.getRegistrationDate().split("-");
		this.jdbcTemplate.update("UPDATE Owner SET national_id = ?, name = ?, surname = ?, email = ?, postal_address = ?, registration_date = ?, phone_number = ?, is_active = ? WHERE username = ?;", owner.getNationalId(), owner.getName(), owner.getSurname(), owner.getEmail(), owner.getPostalAddress(), new java.sql.Date(Integer.parseInt(fecha[0])-1900,Integer.parseInt(fecha[1])-1,Integer.parseInt(fecha[2])), owner.getPhoneNumber(), owner.getIsActive(), owner.getUsername());
	}
		
	public void deleteOwner(Owner owner) {
		this.jdbcTemplate.update("DELETE FROM Owner WHERE username=?;", owner.getUsername());
	}
	
}

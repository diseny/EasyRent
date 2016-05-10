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

@Repository
public class PropertyDao {

	private JdbcTemplate jdbcTemplate;
    
	@Autowired
	public void setDataSource(DataSource dataSource) {
	        this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	private static final class PropertyMapper implements RowMapper<Property> {

	    public Property mapRow(ResultSet rs, int rowNum) throws SQLException { 
	    	Property property = new Property();
	    	property.setId(rs.getInt("id"));
	    	property.setOwnerUsername(rs.getString("owner_username"));
	    	property.setTitle(rs.getString("title"));
	    	property.setDescription(rs.getString("description"));
	    	property.setCapacity(rs.getInt("capacity"));
	    	property.setNumRooms(rs.getInt("num_rooms"));
	    	property.setNumBathrooms(rs.getInt("num_bathrooms"));
	    	property.setNumBeds(rs.getInt("num_beds"));
	    	property.setSquareMeters(rs.getInt("square_meters"));
	    	property.setStreet(rs.getString("street"));
	    	property.setNumber(rs.getInt("number"));
	    	property.setFloor(rs.getString("floor"));
	    	property.setCity(rs.getString("city"));
	    	property.setDailyPrice(rs.getInt("daily_price"));
	    	property.setIsActive(rs.getBoolean("is_active"));
	    	return property;
	    }
	}

	public List<Property> getProperties() {
		 return this.jdbcTemplate.query("SELECT * FROM Property;", new PropertyMapper());
	}	
	
	public Property getProperty(int id) {
		return this.jdbcTemplate.queryForObject("SELECT * FROM Property WHERE id=?;",  new Object[] {id}, new PropertyMapper());
	}
	
	public void addProperty(Property property) throws PSQLException{
		this.jdbcTemplate.update("INSERT INTO Property(id, owner_username, title, description, capacity, num_rooms, num_bathrooms, num_beds, square_meters, street, number, floor, city, daily_price, is_active) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);", property.getId(), property.getOwnerUsername(), property.getTitle(), property.getDescription(), property.getCapacity(), property.getNumRooms(), property.getNumBathrooms(), property.getNumBeds(), property.getSquareMeters(), property.getStreet(), property.getNumber(), property.getFloor(), property.getCity(), property.getDailyPrice(), property.isActive());
	}
		
	public void updateProperty(Property property) {
		this.jdbcTemplate.update("UPDATE Property SET owner_username = ?, title = ?, description = ?, capacity = ?, num_rooms = ?, num_bathrooms = ?, num_beds = ?, square_meters = ?, street = ?, number = ?, floor = ?, city = ?, daily_price = ?, is_active = ? WHERE id = ?;", property.getOwnerUsername(), property.getTitle(), property.getDescription(), property.getCapacity(), property.getNumRooms(), property.getNumBathrooms(), property.getNumBeds(), property.getSquareMeters(), property.getStreet(), property.getNumber(), property.getFloor(), property.getCity(), property.getDailyPrice(), property.isActive(), property.getId());
	}
		
	public void deleteProperty(Property property) {
		this.jdbcTemplate.update("DELETE FROM Property WHERE id=?;", property.getId());
	}
	
}

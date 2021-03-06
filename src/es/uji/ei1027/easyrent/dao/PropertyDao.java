package es.uji.ei1027.easyrent.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

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
	    	property.setValidated(rs.getString("validated"));
	    	return property;
	    }
	}
	
	public List<Property> getProperties() {
		 return this.jdbcTemplate.query("SELECT * FROM Property;", new PropertyMapper());
	}
	
	public Property getProperty(int id) {
		return this.jdbcTemplate.queryForObject("SELECT * FROM Property WHERE id=?;", new Object[] {id}, new PropertyMapper());
	}
	
	public List<Property> getPropertyOwner(String owner) {
		String query = "SELECT * FROM Property WHERE owner_username='" + owner + "';";
		return this.jdbcTemplate.query(query, new PropertyMapper());
	}
	
	public List<Integer> getIdsPropertyOwner(String owner) {
		String query = "SELECT id FROM Property WHERE owner_username='" + owner + "';";
		return this.jdbcTemplate.queryForList(query, Integer.class);
	}
	
	public List<Property> getPropertyFilter(List<String> filters) {
		String query;
		String order = filters.get(filters.size()-1);
		String dateFilter = "";
		filters.remove(filters.size()-1);
		if(!filters.isEmpty() && filters.get(0).contains("id IN")){
			dateFilter = " " + filters.get(0);
			filters.remove(0);
		}
		if(filters.size()>0){
			if(dateFilter.equals("")){
				query = "SELECT * FROM Property WHERE is_active='t' AND ";
			}
			else{
				query = "SELECT * FROM Property WHERE is_active='t' AND " + dateFilter + " AND";
			}
			if(filters.size()==1){
				query = query + " is_active='t' AND " + filters.get(0) + " " + order + ";";
			} else {
				for(int i = 0; i<filters.size()-1; i++){
					query = query + " " + filters.get(i) + " AND";
				}
				query = query + " is_active='t' AND " + filters.get(filters.size()-1) + " " + order + ";";
			}
		} 
		else {
			if(dateFilter.equals("")){
				query = "SELECT * FROM Property WHERE is_active='t' " + order + ";";
			}
			else{
				query = "SELECT * FROM Property WHERE is_active='t' AND " + dateFilter + " " + order + ";";
			}
		}
		return this.jdbcTemplate.query(query, new PropertyMapper());
	}
	
	public void addProperty(Property property) throws PSQLException{
		this.jdbcTemplate.update("INSERT INTO Property(id, owner_username, title, description, capacity, num_rooms, num_bathrooms, num_beds, square_meters, street, number, floor, city, daily_price, is_active, validated) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);", property.getId(), property.getOwnerUsername(), property.getTitle(), property.getDescription(), property.getCapacity(), property.getNumRooms(), property.getNumBathrooms(), property.getNumBeds(), property.getSquareMeters(), property.getStreet(), property.getNumber(), property.getFloor(), property.getCity(), property.getDailyPrice(), property.getIsActive(), property.getValidated());
	}
		
	public void updateProperty(Property property) {
		String query = "UPDATE property SET owner_username ='"+property.getOwnerUsername() +"' ,title ='"+property.getTitle()+"', description ='"+ property.getDescription()+"', capacity = "+property.getCapacity()+", num_rooms ="+property.getNumRooms()+", num_bathrooms = "+property.getNumBathrooms()+", num_beds ="+property.getNumBeds()+", square_meters = "+property.getSquareMeters()+", street ='"+property.getStreet() +"', number = "+property.getNumber()+", floor ='"+property.getFloor()+"' , city = '"+property.getCity()+"', daily_price = "+property.getDailyPrice()+", is_active ="+property.getIsActive()+", validated ='"+property.getValidated()+"' WHERE id = "+property.getId()+";";
		System.out.println(query);
		this.jdbcTemplate.update(query);

	}
		
	public void deleteProperty(Property property) {
		this.jdbcTemplate.update("DELETE FROM Property WHERE id=?;", property.getId());
	}
	
	public Integer generateTrackingNumber(){
		return this.jdbcTemplate.queryForObject("SELECT MAX(tracking_number) FROM Reservation;", Integer.class);
	}
	
}

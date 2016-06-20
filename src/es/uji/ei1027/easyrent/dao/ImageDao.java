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
import es.uji.ei1027.easyrent.domain.Image;

@Repository
public class ImageDao {

	private JdbcTemplate jdbcTemplate;
    
	@Autowired
	public void setDataSource(DataSource dataSource) {
	        this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	private static final class ImageMapper implements RowMapper<Image> {

	    public Image mapRow(ResultSet rs, int rowNum) throws SQLException { 
	    	Image image = new Image();
	    	image.setID(rs.getInt("id"));
	    	image.setCaption(rs.getString("caption"));
	    	image.setHref(rs.getString("href"));
	    	return image;
	    }
	}

	public List<Image> getImages() {
		 return this.jdbcTemplate.query("SELECT * FROM Image;", new ImageMapper());
	}
	
	public List<Image> getImagesProperty(int id) {
		String query = "SELECT * FROM Image WHERE id=" + id + ";"; 
		return this.jdbcTemplate.query(query, new ImageMapper());
	}
	
	public void addImage(Property property) throws PSQLException{
		this.jdbcTemplate.update("INSERT INTO image(id, caption, href) VALUES(?, ?, ?);", property.getId(), property.getCaption(),property.getHref());
	}
	
	public void deleteImage(int propertyId, String caption){
		String query = "DELETE FROM Image WHERE id=" + propertyId + " AND caption='" + caption + "';";
		this.jdbcTemplate.update(query);
	}
	
}

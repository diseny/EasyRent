package es.uji.ei1027.easyrent.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

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
	
}

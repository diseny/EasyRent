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

import es.uji.ei1027.easyrent.domain.Punctuation;

@Repository
public class PunctuationDao {

	private JdbcTemplate jdbcTemplate;
    
	@Autowired
	public void setDataSource(DataSource dataSource) {
	        this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	private static final class PunctuationMapper implements RowMapper<Punctuation> {

	    public Punctuation mapRow(ResultSet rs, int rowNum) throws SQLException { 
	    	Punctuation punctuation = new Punctuation();
	    	punctuation.setUsername(rs.getString("tenant_username"));
	    	punctuation.setPropertyId(rs.getInt("property_id"));
	    	punctuation.setPunctuation(rs.getInt("punctuation"));
	    	punctuation.setComments(rs.getString("comments"));
	    	return punctuation;
	    }
	}

	public List<Punctuation> getPunctuations(int propertyId) {
		String query = "SELECT * FROM Punctuation WHERE property_id=" + propertyId + ";"; 
		return this.jdbcTemplate.query(query, new PunctuationMapper());
	}
	
	public Float getPunctuationAverage(int propertyId) {
		String query = "SELECT AVG(punctuation) FROM Punctuation WHERE property_id=" + propertyId + ";"; 
		return this.jdbcTemplate.queryForObject(query, Float.class);
	}
	
}

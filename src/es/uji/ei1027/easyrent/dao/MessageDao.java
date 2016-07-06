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

import es.uji.ei1027.easyrent.domain.Message;

@Repository
public class MessageDao {

	private JdbcTemplate jdbcTemplate;
    
	@Autowired
	public void setDataSource(DataSource dataSource) {
	        this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	private static final class MessageMapper implements RowMapper<Message> {

	    public Message mapRow(ResultSet rs, int rowNum) throws SQLException { 
	    	Message message = new Message();
	    	message.setId(rs.getInt("id"));
	    	message.setTransmitter(rs.getString("transmitter"));
	    	message.setReceiver(rs.getString("receiver"));
	    	message.setAnswered(rs.getBoolean("answered"));
	    	message.setMessage(rs.getString("content"));
	    	return message;
	    }
	}
	
	public List<Message> getReceivedMessages(String username) {
		String query = "SELECT * FROM Message WHERE receiver ='" + username + "';"; 
		return this.jdbcTemplate.query(query, new MessageMapper());
	}
	
	public List<Message> getSentMessages(String username) {
		String query = "SELECT * FROM Message WHERE transmitter='" + username + "';"; 
		return this.jdbcTemplate.query(query, new MessageMapper());
	}
	
	public Message getMessage(int id) {
		String query = "SELECT * FROM Message WHERE id=" + id + ";"; 
		return this.jdbcTemplate.queryForObject(query, new MessageMapper());
	}
	
	public void addMessage(Message message) throws PSQLException{
		this.jdbcTemplate.update("INSERT INTO Message(id, transmitter, receiver, answered, content) VALUES(?, ?, ?, ?, ?);", message.getId(), message.getTransmitter(), message.getReceiver(), message.getAnswered(), message.getMessage());
	}
		
	public void updateMessage(Message message) {
		this.jdbcTemplate.update("UPDATE Message SET transmitter = ?, receiver = ?, answered = ?, content = ? WHERE id = ?;", message.getTransmitter(), message.getReceiver(), message.getAnswered(), message.getMessage(), message.getId());
	}
		
	public Integer generateId(){
		return this.jdbcTemplate.queryForObject("SELECT MAX(id) FROM Message;", Integer.class);
	}
	
}

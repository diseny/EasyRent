package es.uji.ei1027.easyrent.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.postgresql.util.PSQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import es.uji.ei1027.easyrent.domain.Credentials;
import es.uji.ei1027.easyrent.domain.Period;
import es.uji.ei1027.easyrent.domain.Reservation;
import es.uji.ei1027.easyrent.domain.User;

@Repository
public class ReservationDao {

	private JdbcTemplate jdbcTemplate;
    
	@Autowired
	public void setDataSource(DataSource dataSource) {
	        this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	private static final class ReservationMapper implements RowMapper<Reservation> {

	    public Reservation mapRow(ResultSet rs, int rowNum) throws SQLException { 
	    	Reservation reservation = new Reservation();
	    	reservation.setTrackingNumber(rs.getInt("tracking_number"));
	    	reservation.setUserNameTenant(rs.getString("user_name_tenant"));
	    	reservation.setIdProperty(rs.getInt("id_property"));
	    	reservation.setApplicationTimestamp(rs.getString("application_timestamp"));
	    	reservation.setConfirmationTimestamp(rs.getString("confirmation_timestamp"));
	    	reservation.setNumPeople(rs.getInt("num_people"));
	    	reservation.setStartDate(rs.getString("start_date"));
	    	reservation.setFinishDate(rs.getString("finish_date"));
	    	reservation.setTotalAmount(rs.getInt("total_amount"));
	    	reservation.setStatus(rs.getString("status"));
	    	return reservation;
	    }
	}

	public List<Reservation> getReservations() {
		return this.jdbcTemplate.query("SELECT * FROM Reservation;", new ReservationMapper());
	}
	
	public List<Reservation> getReservationsTenant(String tenant) {
		String query = "SELECT * FROM Reservation WHERE user_name_tenant='" + tenant + "';";
		return this.jdbcTemplate.query(query, new ReservationMapper());
	}
	
	public List<Reservation> getReservationsProperty(int id){
		String query= "SELECT * from Reservation WHERE id_property ="+id +";";
		return this.jdbcTemplate.query(query, new ReservationMapper());
	}
	
	public Reservation getReservation(int id){
		String query= "SELECT * from Reservation WHERE tracking_number=" + id + ";";
		return this.jdbcTemplate.queryForObject(query, new ReservationMapper());
	}
	
	public void addReservation(Reservation reservation) throws PSQLException{
		String []applicationTimestamp = reservation.getApplicationTimestamp().split("-");
		String []startDate = reservation.getStartDate().split("-");
		String []finishDate = reservation.getFinishDate().split("-");
		this.jdbcTemplate.update("INSERT INTO Reservation(tracking_number, user_name_tenant, id_property, application_timestamp, confirmation_timestamp, num_people, start_date, finish_date, total_amount, status) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);", reservation.getTrackingNumber(), reservation.getUserNameTenant(), reservation.getIdProperty(), new java.sql.Date(Integer.parseInt(applicationTimestamp[0])-1900,Integer.parseInt(applicationTimestamp[1])-1,Integer.parseInt(applicationTimestamp[2])), reservation.getConfirmationTimestamp(), reservation.getNumPeople(), new java.sql.Date(Integer.parseInt(startDate[0])-1900,Integer.parseInt(startDate[1])-1,Integer.parseInt(startDate[2])), new java.sql.Date(Integer.parseInt(finishDate[0])-1900,Integer.parseInt(finishDate[1])-1,Integer.parseInt(finishDate[2])), reservation.getTotalAmount(), reservation.getStatus());
	}
	
	public Integer generateTrackingNumber(){
		return this.jdbcTemplate.queryForObject("SELECT MAX(tracking_number) FROM Reservation;", Integer.class);
	}
	
	public void accept(Reservation reservation) throws PSQLException{
		String query = "UPDATE Reservation SET status = 'accepted', confirmation_timestamp=' " + reservation.getConfirmationTimestamp() + "' WHERE tracking_number=" + reservation.getTrackingNumber() + ";";
		this.jdbcTemplate.update(query);
	}
	
	public void reject(Reservation reservation) throws PSQLException{
		String query = "UPDATE Reservation SET status = 'rejected', confirmation_timestamp=' " + reservation.getConfirmationTimestamp() + "' WHERE tracking_number=" + reservation.getTrackingNumber() + ";";
		this.jdbcTemplate.update(query);
	}
	
}

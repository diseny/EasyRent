package es.uji.ei1027.easyrent.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import es.uji.ei1027.easyrent.domain.Period;
import es.uji.ei1027.easyrent.domain.Reservation;

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
	public List<Reservation> getReservations(int id){
		String query= "SELECT * from Reservation WHERE id_property ="+id +";";
		return this.jdbcTemplate.query(query, new ReservationMapper());
	}
}

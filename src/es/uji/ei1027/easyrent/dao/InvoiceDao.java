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

import es.uji.ei1027.easyrent.domain.Invoice;

@Repository
public class InvoiceDao {
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public void setDataSource(DataSource dataSource) {
	        this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	private static final class InvoiceMapper implements RowMapper<Invoice> {

	    public Invoice mapRow(ResultSet rs, int rowNum) throws SQLException { 
	    			
			Invoice invoice = new Invoice();
			invoice.setTrackingNumber(rs.getInt("tracking_number"));
			invoice.setInvoiceNumber(rs.getInt("invoice_number"));
			invoice.setInvoiceDate(rs.getString("invoice_date"));
			invoice.setVat(rs.getDouble("vat"));
	    	return invoice;
	    }
	}

	public List<Invoice> getInvoices() {
		 return this.jdbcTemplate.query("SELECT * FROM Invoice;", new InvoiceMapper());
	}	 
		
	public Invoice getInvoice(int trackingNumber) {
		return this.jdbcTemplate.queryForObject("SELECT * FROM Invoice WHERE tracking_number='" + trackingNumber + "';", new InvoiceMapper());
	}
	
	public void addInvoice(Invoice invoice) throws PSQLException{
		String []fecha = invoice.getInvoiceDate().split("-");
		this.jdbcTemplate.update("INSERT INTO Invoice(tracking_number, invoice_number, invoice_date, vat) VALUES(?, ?, ?, ?);", invoice.getTrackingNumber(), invoice.getInvoiceNumber(), new java.sql.Date(Integer.parseInt(fecha[0])-1900,Integer.parseInt(fecha[1])-1,Integer.parseInt(fecha[2])), invoice.getVat());
	}
		
	public void updateInvoice(Invoice invoice) {
			this.jdbcTemplate.update("UPDATE Invoice SET invoice_date = ?, vat = ? WHERE tracking_number = ? AND invoice_number = ?", invoice.getInvoiceDate(), invoice.getVat());
	}	
		
	public void deleteInvoice(Invoice invoice) {
		this.jdbcTemplate.update("DELETE FROM Invoice WHERE tracking_number=? AND invoice_number=? ;", invoice.getTrackingNumber(), invoice.getInvoiceNumber() );
	}
}


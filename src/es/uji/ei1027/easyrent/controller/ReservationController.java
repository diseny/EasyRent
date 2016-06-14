package es.uji.ei1027.easyrent.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import es.uji.ei1027.easyrent.dao.InvoiceDao;
import es.uji.ei1027.easyrent.dao.ReservationDao;
import es.uji.ei1027.easyrent.domain.Invoice;
import es.uji.ei1027.easyrent.domain.Reservation;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	
	private ReservationDao reservationDao; 
	private InvoiceDao invoiceDao;
	final private float vat = 21;
	
	@Autowired
	public void setReservationDao(ReservationDao reservationDao) {
		this.reservationDao = reservationDao;
	}

	@Autowired
	public void setInvoiceDao(InvoiceDao invoiceDao) {
		this.invoiceDao = invoiceDao;
	}
	
	@RequestMapping(value="/accept/{tracking_number}")
	public String accept(@PathVariable int tracking_number) {
		try{
			Reservation reservation = reservationDao.getReservation(tracking_number);
			reservation.setConfirmationTimestamp(new java.sql.Date(new java.util.Date().getTime()).toString());
			reservationDao.accept(reservation);
			Invoice invoice = new Invoice();
			invoice.setTrackingNumber(tracking_number);
			invoice.setInvoiceNumber(tracking_number);
			invoice.setVat(vat);
			invoice.setInvoiceDate(new java.sql.Date(new java.util.Date().getTime()).toString());
			invoiceDao.addInvoice(invoice);
		}catch(Exception e){
			return "redirect:../../user/profile.html";
		}
		return "redirect:../../user/profile.html";
	 }
	
	@RequestMapping(value="/reject/{tracking_number}")
	public String reject(@PathVariable int tracking_number) {
		try{
			Reservation reservation = reservationDao.getReservation(tracking_number);
			reservation.setConfirmationTimestamp(new java.sql.Date(new java.util.Date().getTime()).toString());
			reservationDao.reject(reservation);
		}catch(Exception e){
			return "redirect:../../user/profile.html";
		}
		return "redirect:../../user/profile.html";
	 }

}

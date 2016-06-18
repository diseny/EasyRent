package es.uji.ei1027.easyrent.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import es.uji.ei1027.easyrent.dao.InvoiceDao;
import es.uji.ei1027.easyrent.dao.ReservationDao;
import es.uji.ei1027.easyrent.domain.Invoice;
import es.uji.ei1027.easyrent.domain.PopUpMessage;
import es.uji.ei1027.easyrent.domain.Reservation;
import es.uji.ei1027.easyrent.domain.User;

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
	public String accept(@PathVariable int tracking_number, HttpSession session, Model model) {
		User user = (User)session.getAttribute("user");
		Reservation reservation = reservationDao.getReservation(tracking_number);
		if (user == null) 
		{ 
			model.addAttribute("user", new User()); 
			session.setAttribute("nextURL", "user/profile.html");
			return "login";
		}
		else if(!user.getRole().equals("Owner") || !user.getUsername().equals(reservation.getOwnerUsername())){
			return "redirect:../../user/profile.html";
		}
		try{
			reservation.setConfirmationTimestamp(new java.sql.Date(new java.util.Date().getTime()).toString());
			reservationDao.accept(reservation);
			Invoice invoice = new Invoice();
			invoice.setTrackingNumber(tracking_number);
			invoice.setInvoiceNumber(tracking_number);
			invoice.setVat(vat);
			invoice.setInvoiceDate(new java.sql.Date(new java.util.Date().getTime()).toString());
			invoiceDao.addInvoice(invoice);
		}catch(Exception e){
		}
		PopUpMessage message = new PopUpMessage();
		message.setTitle("Hecho");
	    message.setMessage("Has aceptado la reserva del usuario " + user.getUsername() + " .");
	    session.setAttribute("message", message);
		return "redirect:../../user/profile.html";
	 }
	
	@RequestMapping(value="/reject/{tracking_number}")
	public String reject(@PathVariable int tracking_number, HttpSession session, Model model) {
		User user = (User)session.getAttribute("user");
		Reservation reservation = reservationDao.getReservation(tracking_number);
		if (user == null) 
		{ 
			model.addAttribute("user", new User()); 
			session.setAttribute("nextURL", "user/profile.html");
			return "login";
		}
		else if(!user.getRole().equals("Owner") || !user.getUsername().equals(reservation.getOwnerUsername())){
			return "redirect:../../user/profile.html";
		}
		try{
			reservation.setConfirmationTimestamp(new java.sql.Date(new java.util.Date().getTime()).toString());
			reservationDao.reject(reservation);
		}catch(Exception e){
		}
		PopUpMessage message = new PopUpMessage();
		message.setTitle("Hecho");
	    message.setMessage("Has rechazado la reserva del usuario " + user.getUsername() + " .");
	    session.setAttribute("message", message);
		return "redirect:../../user/profile.html";
	 }

}

package es.uji.ei1027.easyrent.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import es.uji.ei1027.easyrent.dao.InvoiceDao;
import es.uji.ei1027.easyrent.dao.PropertyDao;
import es.uji.ei1027.easyrent.dao.PunctuationDao;
import es.uji.ei1027.easyrent.dao.ReservationDao;
import es.uji.ei1027.easyrent.dao.UserDao;
import es.uji.ei1027.easyrent.domain.Invoice;
import es.uji.ei1027.easyrent.domain.Property;
import es.uji.ei1027.easyrent.domain.Punctuation;
import es.uji.ei1027.easyrent.domain.Reservation;
import es.uji.ei1027.easyrent.domain.User;

@Controller
@RequestMapping("/invoice")
public class InvoiceController {
	
	private InvoiceDao invoiceDao; 
	private ReservationDao reservationDao;
	private PropertyDao propertyDao;
	private UserDao userDao;
	private PunctuationDao punctuationDao;

	@Autowired
	public void setInvoiceDao(InvoiceDao invoiceDao) {
		this.invoiceDao = invoiceDao;
	}

	@Autowired
	public void setReservationDao(ReservationDao reservationDao) {
		this.reservationDao = reservationDao;
	}
	
	@Autowired
	public void setPropertyDao(PropertyDao propertyDao) {
		this.propertyDao = propertyDao;
	}
	
	@Autowired
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	@Autowired
	public void setPunctuationDao(PunctuationDao punctuationDao) {
		this.punctuationDao = punctuationDao;
	}
	
	@RequestMapping(value="/info/{tracking_number}")
	public String accept(@PathVariable int tracking_number, Model model, HttpSession session) {
		User user = (User)session.getAttribute("user");
		if (user == null) 
	    { 
		    model.addAttribute("user", new User()); 
		    session.setAttribute("nextURL", "invoice/info/" + tracking_number + ".html");
	    	return "login";
	    }
		Reservation res = reservationDao.getReservation(tracking_number);
		Property property = propertyDao.getProperty(res.getIdProperty());
		if(!res.getUserNameTenant().equals(user.getUsername()) && !property.getOwnerUsername().equals(user.getUsername())){
			return "redirect:../../user/profile.html";
		}
		Invoice invoice = invoiceDao.getInvoice(tracking_number);
		invoice.setVatIncrease(res.getTotalAmount()*(invoice.getVat()/100));
		invoice.setTotal(res.getTotalAmount()+invoice.getVatIncrease());
		model.addAttribute("average", punctuationDao.getPunctuationAverage(property.getId()));
		model.addAttribute("reservation", res);
		model.addAttribute("invoice", invoice);
		model.addAttribute("property", property);
		model.addAttribute("tenant", userDao.getTenant(res.getUserNameTenant()));
		model.addAttribute("owner", userDao.getOwner(property.getOwnerUsername()));
		Punctuation punctuation = new Punctuation();
		String messagePunctuation = "";
		try{
			punctuation = punctuationDao.getPunctuation(property.getId(), res.getUserNameTenant());
		}
		catch(Exception e){
			messagePunctuation = "form";
		}
		model.addAttribute("message", messagePunctuation);
		model.addAttribute("punctuation", punctuation);
		return "invoice/info";
	}
	
}

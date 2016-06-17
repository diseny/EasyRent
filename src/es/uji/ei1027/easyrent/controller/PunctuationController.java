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
@RequestMapping("/punctuation")
public class PunctuationController {
	
	private PunctuationDao punctuationDao;

	@Autowired
	public void setPunctuationDao(PunctuationDao punctuationDao) {
		this.punctuationDao = punctuationDao;
	}

	@RequestMapping(value="/add/{tracking_number}", method=RequestMethod.POST)
	public String add(@PathVariable int tracking_number, @ModelAttribute("punctuation") Punctuation punctuation, Model model, HttpSession session) {
		User user = (User)session.getAttribute("user");
		if(user==null){
			model.addAttribute("user", new User()); 
	        session.setAttribute("nextURL", "user/profile.html");
	        return "login";
		} else if(!user.getRole().equals("Tenant") || !user.getUsername().equals(punctuation.getUsername())){
			return "redirect:../../invoice/info/" + tracking_number + ".html";
		}
		try{
			punctuation.setUsername(user.getUsername());
			punctuationDao.addPunctuation(punctuation);
		} catch(Exception e){
			;
		}
		return "redirect:../../invoice/info/" + tracking_number + ".html";
	}
	
	@RequestMapping(value="/delete/{tracking_number}/{property_id}")
	public String delete(Model model, @PathVariable int tracking_number, @PathVariable int property_id, @ModelAttribute("punctuation") Punctuation punctuation, HttpSession session) {
		User user = (User)session.getAttribute("user");
		if(user==null){
			model.addAttribute("user", new User()); 
	        session.setAttribute("nextURL", "user/profile.html");
	        return "login";
		} else if(!user.getRole().equals("Tenant") || !user.getUsername().equals(punctuation.getUsername())){
			return "redirect:../../invoice/info/" + tracking_number + ".html";
		}
		try{
			punctuation.setUsername(user.getUsername());
			punctuation.setPropertyId(property_id);
			punctuationDao.deletePunctuation(punctuation);
		}catch(Exception e){
			;
		}
		return "redirect:../../../invoice/info/" + tracking_number + ".html";
	}
	
}

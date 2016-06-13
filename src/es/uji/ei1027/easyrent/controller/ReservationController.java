package es.uji.ei1027.easyrent.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import es.uji.ei1027.easyrent.dao.ReservationDao;
import es.uji.ei1027.easyrent.domain.Invoice;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	
	private ReservationDao reservationDao; 

	@Autowired
	public void setReservationDao(ReservationDao reservationDao) {
		this.reservationDao = reservationDao;
	}

	@RequestMapping(value="/accept/{tracking_number}")
	public String accept(@ModelAttribute("reservation") Invoice invoice, @PathVariable int tracking_number) {
		try{
			reservationDao.accept(tracking_number);
		}catch(Exception e){
			return "redirect:../../user/profile.html";
		}
		return "redirect:../../user/profile.html";
	 }
	
	@RequestMapping(value="/reject/{tracking_number}")
	public String reject(@ModelAttribute("reservation") Invoice invoice, @PathVariable int tracking_number) {
		try{
			reservationDao.reject(tracking_number);
		}catch(Exception e){
			return "redirect:../../user/profile.html";
		}
		return "redirect:../../user/profile.html";
	 }

}

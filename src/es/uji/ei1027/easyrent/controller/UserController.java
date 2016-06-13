package es.uji.ei1027.easyrent.controller;

import java.sql.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.jasypt.util.password.BasicPasswordEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import es.uji.ei1027.easyrent.dao.CredentialsDao;
import es.uji.ei1027.easyrent.dao.PropertyDao;
import es.uji.ei1027.easyrent.dao.ReservationDao;
import es.uji.ei1027.easyrent.dao.UserDao;
import es.uji.ei1027.easyrent.domain.Credentials;
import es.uji.ei1027.easyrent.domain.Property;
import es.uji.ei1027.easyrent.domain.Reservation;
import es.uji.ei1027.easyrent.domain.User;

@Controller 
@RequestMapping("/user") 
public class UserController {
   
	private UserDao userDao;
	private PropertyDao propertyDao;
	private ReservationDao reservationDao;
	private CredentialsDao credentialsDao;
	final long MILLSECS_PER_DAY = 24 * 60 * 60 * 1000;

   @Autowired 
   public void setUserDao(UserDao userDao) {
       this.userDao = userDao;
   }
  
   @Autowired 
   public void setPropertyDao(PropertyDao propertyDao) {
       this.propertyDao = propertyDao;
   }
   
   @Autowired 
   public void setReservationDao(ReservationDao reservationDao) {
       this.reservationDao = reservationDao;
   }
   
   @Autowired 
   public void setCredentialsDao(CredentialsDao credentialsDao) {
       this.credentialsDao = credentialsDao;
   }
   
   @RequestMapping("/list.html") 
   public String listSocis(HttpSession session, Model model) {
       if (session.getAttribute("user") == null) 
       { 
          model.addAttribute("user", new Credentials()); 
          session.setAttribute("nextURL", "user/list.html");
          return "login";
       }
       model.addAttribute("users", userDao.getCredentials());
       return "user/list";
   }
   
   @RequestMapping("/update") 
   public String updateUser(HttpSession session, Model model) {
	   model.addAttribute("user", session.getAttribute("user"));
	   return "user/update";
   }
   
   @RequestMapping(value="/update", method=RequestMethod.POST)
   public String updateUserPost(@ModelAttribute("user") User user, HttpSession session, Model model) {
	   try{
		   BasicPasswordEncryptor passwordEncryptor = new BasicPasswordEncryptor();
		   user.setPassword(passwordEncryptor.encryptPassword(user.getPassword()));
		   userDao.updateCredentials(user);
		   if(user.getRole().equals("Tenant")){
			   userDao.updateTenant(user);
		   } else if(user.getRole().equals("Owner")){
			   userDao.updateOwner(user);
		   } else {
			   userDao.updateAdministrator(user);
		   }
	   } catch(Exception e){
		   ;
	   }
	   session.setAttribute("user", user);
	   return "user/profile";
   }
   
   @RequestMapping("/delete") 
   public String deleteUser(HttpSession session, Model model) {
	   return "user/delete";
   }
   
   @RequestMapping(value="/delete", method=RequestMethod.POST) 
   public String confirmDeleteUser(HttpSession session, Model model) {
	   User user = (User)session.getAttribute("user");
	   user.setIsActive(false);
	   credentialsDao.updateCredentials(user);
	   session.invalidate();
	   return "redirect:../index.jsp";
   }
   
   @RequestMapping("/profile") 
   public String getProfileInfo(HttpSession session, Model model) {
	   if (session.getAttribute("user") == null) 
       { 
          model.addAttribute("user", new User()); 
          session.setAttribute("nextURL", "user/profile.html");
          return "login";
       }
	   User user = (User)session.getAttribute("user");	
	   model.addAttribute("user", user);
	   List<Reservation> uncheckedReservations = reservationDao.getReservations();
	   Date today = new java.sql.Date(new java.util.Date().getTime());
	   Date applicationTimestamp;
	   String application[];
	   for(Reservation r: uncheckedReservations){
		   if(r.getConfirmationTimestamp()==null){
			   application = r.getApplicationTimestamp().split("-");
			   applicationTimestamp = new java.sql.Date(Integer.parseInt(application[0])-1900,Integer.parseInt(application[1])-1,Integer.parseInt(application[2]));
			   if(((today.getTime()-applicationTimestamp.getTime())/MILLSECS_PER_DAY)>7){
				   try{
					   reservationDao.reject(r.getTrackingNumber());
				   }catch(Exception e){;}
			   }
		   }
	   }
	   
	   if(user.getRole().equals("Owner")){
		   List<Reservation> reservations = reservationDao.getReservations();
		   List<Reservation> reservationsOwner = new LinkedList<Reservation>();
		   List<Property> propertiesOwner = propertyDao.getPropertyOwner(user.getUsername());
		   List<Integer> propertiesIds = propertyDao.getIdsPropertyOwner((user.getUsername()));
		   for(Reservation r: reservations){
			   if(propertiesIds.contains(r.getIdProperty())){
				   r.setPropertyTitle(propertyDao.getProperty(r.getIdProperty()).getTitle());
				   reservationsOwner.add(r);
			   }
		   }
		   model.addAttribute("propertiesOwner", propertiesOwner);
		   model.addAttribute("reservations", reservationsOwner);
	   }
	   else if(user.getRole().equals("Tenant")){
		   List<Reservation> reservations = reservationDao.getReservationsTenant(user.getUsername());
		   for(Reservation res: reservations){
			   Property p = propertyDao.getProperty(res.getIdProperty());
			   res.setOwnerUsername(p.getOwnerUsername());
			   res.setPropertyTitle(p.getTitle());
		   }
		   model.addAttribute("reservations", reservations);
	   }
	   else {
		   List<Reservation> reservations = reservationDao.getReservations();
		   for(Reservation res: reservations){
			   Property p = propertyDao.getProperty(res.getIdProperty());
			   res.setOwnerUsername(p.getOwnerUsername());
			   res.setPropertyTitle(p.getTitle());
		   }
		   model.addAttribute("reservations", reservations);
	   }
	   return "user/profile";
   }
   
}
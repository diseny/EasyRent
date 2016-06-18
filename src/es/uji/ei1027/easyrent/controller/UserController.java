package es.uji.ei1027.easyrent.controller;

import java.sql.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.jasypt.util.password.BasicPasswordEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import es.uji.ei1027.easyrent.dao.CredentialsDao;
import es.uji.ei1027.easyrent.dao.PropertyDao;
import es.uji.ei1027.easyrent.dao.ReservationDao;
import es.uji.ei1027.easyrent.dao.UserDao;
import es.uji.ei1027.easyrent.domain.Credentials;
import es.uji.ei1027.easyrent.domain.PopUpMessage;
import es.uji.ei1027.easyrent.domain.Property;
import es.uji.ei1027.easyrent.domain.Reservation;
import es.uji.ei1027.easyrent.domain.User;

class UpdateValidator implements Validator { 

	public boolean supports(Class<?> cls) { 
		return User.class.isAssignableFrom(cls);
	}

	public void validate(Object obj, Errors errors) {
		User user = (User)obj;
		if(!user.getPassword().trim().equals(user.getRepeatedPassword().trim()))
			errors.rejectValue("repeatedPassword", "incorrect", "Las contraseñas no son iguales, por favor vuelve a intentarlo.");
	}

}

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
   
   @RequestMapping(value="/update", method=RequestMethod.GET)
   public String update(HttpSession session, Model model){
	   User userSession = (User)session.getAttribute("user");
	   if (userSession == null) 
       { 
          model.addAttribute("user", new User()); 
          session.setAttribute("nextURL", "user/update.html");
          return "login";
       }
	   model.addAttribute("user", userSession);
	   return "user/update";
   }
   
   @RequestMapping(value="/update", method=RequestMethod.POST)
   public String updateUserPost(@ModelAttribute("user") User user, BindingResult bindingResult, HttpSession session, Model model) {
	   User userSession = (User)session.getAttribute("user");
	   if (userSession == null) 
       { 
          model.addAttribute("user", new User()); 
          session.setAttribute("nextURL", "user/profile.html");
          return "login";
       }	
	   UpdateValidator updateValidator = new UpdateValidator(); 
	   	updateValidator.validate(user, bindingResult);
		if (bindingResult.hasErrors()) {
			return "user/update";
		}
		PopUpMessage message = new PopUpMessage();
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
	   }catch(Exception e){
		   message.setTitle("Error");
		   message.setMessage("No se ha podido actualizar tu perfil. Prueba en otro momento.");
		   session.setAttribute("message", message);
		   session.setAttribute("user", user);
		   return "redirect:../user/profile.html";
	   }
	   message.setTitle("Hecho");
	   message.setMessage("Tu perfil se ha actualizado correctamente.");
	   session.setAttribute("message", message);
	   session.setAttribute("user", user);
	   return "redirect:profile.html";
   }
   
   @RequestMapping("/delete") 
   public String deleteUser(HttpSession session, Model model) {
	   return "user/delete";
   }
   
   @RequestMapping(value="/delete", method=RequestMethod.POST) 
   public String confirmDeleteUser(HttpSession session, Model model) {
	   User user = (User)session.getAttribute("user");
	   if (user == null) 
       { 
          model.addAttribute("user", new User()); 
          session.setAttribute("nextURL", "user/profile.html");
          return "login";
       }
	   user.setIsActive(false);
	   credentialsDao.updateCredentials(user);
	   PopUpMessage message = new PopUpMessage();
	   message.setTitle("Hecho");
	   message.setMessage("Tu perfil se ha desactivado correctamente. Si deseas recuperar tu cuenta solo tienes que iniciar sesión con tu usuario y contraseña.");
	   model.addAttribute("message", message);
	   session.invalidate();
	   return "user/delete";
   }
   
   @RequestMapping("/administratordeletes/{username}") 
   public String administratorDeleteUser(HttpSession session, Model model, @PathVariable String username) {
	   User userSession = (User)session.getAttribute("user");
	   if (userSession == null) 
       { 
          model.addAttribute("user", new User()); 
          session.setAttribute("nextURL", "credentials/list.html");
          return "login";
       }
	   else if(!userSession.getRole().equals("Administrator")){
		   return "redirect:../profile.html";
	   }
	   Credentials user = credentialsDao.getCredentials(username);
	   user.setIsActive(false);
	   try{
		   userDao.administratorUpdateCredentials(user);
	   }catch(Exception e){;}
	   PopUpMessage message = new PopUpMessage();
	   message.setTitle("Hecho");
	   message.setMessage("Has desactivado la cuenta del usuario " + userSession.getUsername() + " correctamente.");
	   session.setAttribute("message", message);
	   return "redirect:../../credentials/list.html";
   }
   
   @RequestMapping("/administratoractivates/{username}") 
   public String administratorActivateUser(HttpSession session, Model model, @PathVariable String username) {
	   User userSession = (User)session.getAttribute("user");
	   if (userSession == null) 
       { 
          model.addAttribute("user", new User()); 
          session.setAttribute("nextURL", "credentials/list.html");
          return "login";
       }
	   else if(!userSession.getRole().equals("Administrator")){
		   return "redirect:../profile.html";
	   }
	   Credentials user = credentialsDao.getCredentials(username);
	   user.setIsActive(true);
	   try{
		   userDao.administratorUpdateCredentials(user);
	   }catch(Exception e){;}
	   PopUpMessage message = new PopUpMessage();
	   message.setTitle("Hecho");
	   message.setMessage("Has reactivado la cuenta del usuario " + userSession.getUsername() + " correctamente.");
	   session.setAttribute("message", message);
	   return "redirect:../../credentials/list.html";
   }
   
   @RequestMapping("/profile") 
   public String getProfileInfo(HttpSession session, Model model) {
	   User user = (User)session.getAttribute("user");
	   if (user == null) 
       { 
          model.addAttribute("user", new User()); 
          session.setAttribute("nextURL", "user/profile.html");
          return "login";
       }
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
					   r.setConfirmationTimestamp(new java.sql.Date(new java.util.Date().getTime()).toString());
					   reservationDao.reject(r);
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
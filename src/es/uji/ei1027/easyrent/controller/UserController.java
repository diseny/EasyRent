package es.uji.ei1027.easyrent.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import es.uji.ei1027.easyrent.dao.PropertyDao;
import es.uji.ei1027.easyrent.dao.UserDao;
import es.uji.ei1027.easyrent.domain.Credentials;
import es.uji.ei1027.easyrent.domain.User;

@Controller 
@RequestMapping("/user") 
public class UserController {
   
	private UserDao userDao;
	private PropertyDao propertyDao;

   @Autowired 
   public void setUserDao(UserDao userDao) {
       this.userDao = userDao;
   }
  
   @Autowired 
   public void setPropertyDao(PropertyDao propertyDao) {
       this.propertyDao = propertyDao;
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
	   session.invalidate();
	   return "redirect:../index.jsp";
   }
   
   @RequestMapping("/profile") 
   public String getProfileInfo(HttpSession session, Model model) {
	   User user = (User)session.getAttribute("user");	
	   model.addAttribute("user", user);
	   if(user.getRole().equals("Owner")){
		   model.addAttribute("propertiesOwner", propertyDao.getPropertyOwner(user.getUsername()));
	   }
	   else{
		   
	   }
	   return "user/profile";
   }
   
}
package es.uji.ei1027.easyrent.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import es.uji.ei1027.easyrent.dao.UserDao;
import es.uji.ei1027.easyrent.domain.Credentials;

@Controller 
@RequestMapping("/user") 
public class UserController {
   
	private UserDao userDao;

   @Autowired 
   public void setUserDao(UserDao userDao) {
       this.userDao = userDao;
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
}
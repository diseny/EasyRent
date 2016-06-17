package es.uji.ei1027.easyrent.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import es.uji.ei1027.easyrent.dao.AdministratorDao;
import es.uji.ei1027.easyrent.dao.OwnerDao;
import es.uji.ei1027.easyrent.dao.TenantDao;
import es.uji.ei1027.easyrent.dao.UserDao;
import es.uji.ei1027.easyrent.domain.Credentials;
import es.uji.ei1027.easyrent.domain.Tenant;
import es.uji.ei1027.easyrent.domain.User;
import es.uji.ei1027.easyrent.domain.UserSession;
import es.uji.ei1027.easyrent.domain.Owner;


@Controller
public class LoginController {
	
	@Autowired
	private UserDao userDao;

	@Autowired
	private OwnerDao ownerDao;
	
	@Autowired
	private TenantDao tenantDao;
	
	@Autowired
	private AdministratorDao administratorDao;
	
   @Autowired 
   public void setUserDao(UserDao userDao) {
       this.userDao = userDao;
   }
	
   @Autowired 
   public void setOwnerDao(OwnerDao ownerDao) {
       this.ownerDao = ownerDao;
   }
   
   @Autowired 
   public void setTenantDao(TenantDao tenantDao) {
       this.tenantDao = tenantDao;
   }
   
   @Autowired 
   public void setAdministratorDao(AdministratorDao administratorDao) {
       this.administratorDao = administratorDao;
   }
   
	@RequestMapping("/login")
	public String login(Model model) {
		model.addAttribute("user", new Credentials());
		return "login";
	}

	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String checkLogin(@ModelAttribute("user") Credentials user, BindingResult bindingResult, HttpSession session) {
		UserValidator userValidator = new UserValidator(); 
		userValidator.validate(user, bindingResult); 
		if (bindingResult.hasErrors()) {
			return "login";
		}
		try{
			user = userDao.loadUserByUsername(user.getUsername(),user.getPassword()); 
		} catch(EmptyResultDataAccessException e){
			bindingResult.rejectValue("username", "badusn", "El usuario no está registrado"); 
			return "login";
		}
		if (user == null) {
			bindingResult.rejectValue("password", "badpw", "Contraseña incorrecta"); 
			return "login";
		} else{
			User userSession;
			UserSession s = null;
			if(user.getRole().equals("Tenant")){
				s = tenantDao.getTenant(user.getUsername());
			} else if(user.getRole().equals("Owner")){
				s = ownerDao.getOwner(user.getUsername());
			} else {
				s = administratorDao.getAdministrator(user.getUsername());
			}
			userSession = createUser(s);
			userSession.setPassword(user.getPassword());
			userSession.setRole(user.getRole());
			userSession.setIsActive(user.getIsActive());
			session.setAttribute("user", userSession);
		}
		String url = (String)session.getAttribute("nextURL");
		if(url!=null){
			session.removeAttribute("nextURL");
			return "redirect:" + url;
		}
		return "redirect:index.jsp";
	}

	@RequestMapping("/logout") 
	public String logout(HttpSession session) {
		session.invalidate(); 
		return "redirect:index.jsp";
	}
	
	private User createUser(UserSession s){
		User user = new User();
		user.setUsername(s.getUsername());
		user.setNationalId(s.getNationalId());
		user.setName(s.getName());
		user.setSurname(s.getSurname());
		user.setEmail(s.getEmail());
		user.setPostalAddress(s.getPostalAddress());
		user.setRegistrationDate(s.getRegistrationDate());
		user.setPhoneNumber(s.getPhoneNumber());
		return user;
	}
	
}
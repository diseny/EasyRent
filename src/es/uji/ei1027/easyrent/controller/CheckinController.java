package es.uji.ei1027.easyrent.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.jasypt.util.password.BasicPasswordEncryptor;

import es.uji.ei1027.easyrent.dao.UserDao;
import es.uji.ei1027.easyrent.domain.Credentials;
import es.uji.ei1027.easyrent.domain.User;

class CheckinValidator implements Validator { 

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
public class CheckinController {
	
	@Autowired
	private UserDao userDao;

   @Autowired 
   public void setUserDao(UserDao userDao) {
       this.userDao = userDao;
   }
	
	@RequestMapping("/checkin")
	public String login(Model model) {
		model.addAttribute("user", new User());
		return "user/checkin";
	}

	@RequestMapping(value="/checkin", method=RequestMethod.POST)
	public String checkLogin(@ModelAttribute("user") User user, BindingResult bindingResult, HttpSession session) {
		CheckinValidator checkinValidator = new CheckinValidator(); 
		checkinValidator.validate(user, bindingResult);
		if (bindingResult.hasErrors()) {
			return "user/checkin";
		}
		BasicPasswordEncryptor passwordEncryptor = new BasicPasswordEncryptor();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date today = new Date();
		user.setPassword(passwordEncryptor.encryptPassword(user.getPassword()));
		user.setRegistrationDate(dateFormat.format(today));
		user.setIsActive(true);
		try{
			userDao.addCredentials(user);
			if(user.getRole().equals("Tenant")){
				userDao.addTenant(user);
			} else if(user.getRole().equals("Owner")){
				userDao.addOwner(user);
			} else {
				userDao.addAdministrator(user);
			}
		} catch(Exception e){
			bindingResult.rejectValue("username", "registered", "El username ya está registrado, por favor pruebe con otro.");
			return "user/checkin";
		}
		return "user/profile";
	}
	
}
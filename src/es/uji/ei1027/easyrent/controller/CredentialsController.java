package es.uji.ei1027.easyrent.controller;

import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import es.uji.ei1027.easyrent.dao.AdministratorDao;
import es.uji.ei1027.easyrent.dao.CredentialsDao;
import es.uji.ei1027.easyrent.dao.OwnerDao;
import es.uji.ei1027.easyrent.dao.TenantDao;
import es.uji.ei1027.easyrent.domain.Credentials;
import es.uji.ei1027.easyrent.domain.User;
import es.uji.ei1027.easyrent.domain.UserSession;

@Controller
@RequestMapping("/credentials")
public class CredentialsController {
	
	@Autowired
	private CredentialsDao credentialsDao; 

	@Autowired
	private OwnerDao ownerDao;
	
	@Autowired
	private TenantDao tenantDao;
	
	@Autowired
	private AdministratorDao administratorDao;
	
	@Autowired
	public void setCredentialsDao(CredentialsDao credentialsDao) {
		this.credentialsDao = credentialsDao;
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

	@RequestMapping("/list") 
	public String listCredentials(Model model) {
		List<Credentials> credentials = credentialsDao.getCredentials();
		List<User> users = new LinkedList<User>();
		for(Credentials c: credentials){
			User user;
			UserSession s = null;
			if(c.getRole().equals("Tenant")){
				s = tenantDao.getTenant(c.getUsername());
			} else if(c.getRole().equals("Owner")){
				s = ownerDao.getOwner(c.getUsername());
			} else {
				s = administratorDao.getAdministrator(c.getUsername());
			}
			user = createUser(s);
			user.setPassword(c.getPassword());
			user.setRole(c.getRole());
			user.setIsActive(c.getIsActive());
			users.add(user);
		}
		model.addAttribute("credentials", users);
		return "credentials/list";
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

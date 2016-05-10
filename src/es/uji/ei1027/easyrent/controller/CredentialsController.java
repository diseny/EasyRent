package es.uji.ei1027.easyrent.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import es.uji.ei1027.easyrent.dao.CredentialsDao;
import es.uji.ei1027.easyrent.domain.Credentials;

@Controller
@RequestMapping("/credentials")
public class CredentialsController {
	
	private CredentialsDao credentialsDao; 

	@Autowired
	public void setCredentialsDao(CredentialsDao credentialsDao) {
		this.credentialsDao = credentialsDao;
	}

	@RequestMapping("/list") 
	public String listCredentials(Model model) {
		model.addAttribute("credentials", credentialsDao.getCredentials());
		return "credentials/list";
	}

	@RequestMapping(value="/add") 
	public String addCredentials(Model model) {
		model.addAttribute("credentials", new Credentials());
		return "credentials/add";
	}

	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String processAddSubmit(@ModelAttribute("credentials") Credentials credentials, BindingResult bindingResult) {
		CredentialsValidator credentialsValidator = new CredentialsValidator();
		credentialsValidator.validate(credentials, bindingResult);
		if (bindingResult.hasErrors())
			return "credentials/add";
		try {
			credentialsDao.addCredentials(credentials);
		} catch (Exception e) {
			if(e.getMessage()==null){
				return "redirect:list.html";
			}
			else{
				bindingResult.rejectValue("username", "obligatori", "Parece que el username ya está registrado en el sistema, prueba con otro.");
				return "credentials/add";
			}
		}
		return "redirect:list.html";
	 }

	@RequestMapping(value="/update/{username}", method = RequestMethod.GET)
	public String editCredentials(Model model, @PathVariable String username) {
		model.addAttribute("credentials", credentialsDao.getCredentials(username));
		return "credentials/update"; 
	}

	@RequestMapping(value="/update/{username}", method = RequestMethod.POST) 
	public String processUpdateSubmit(@PathVariable String username, @ModelAttribute("credentials") Credentials credentials, BindingResult bindingResult) {
		CredentialsValidator credentialsValidator = new CredentialsValidator();
		credentialsValidator.validate(credentials, bindingResult);
		if (bindingResult.hasErrors()) 
			return "credentials/update";
		credentialsDao.updateCredentials(credentials);
		return "redirect:../list.html"; 
	}
	
	@RequestMapping(value="/delete/{username}", method = RequestMethod.GET)
	public String deleteCredentials(Model model, @PathVariable String username) {
		model.addAttribute("credentials", credentialsDao.getCredentials(username));
		return "credentials/delete"; 
	}

	@RequestMapping(value="/delete/{username}", method = RequestMethod.POST) 
	public String processDeleteSubmit(@PathVariable String username, @ModelAttribute("credentials") Credentials credentials, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) 
			return "credentials/delete";
		credentialsDao.deleteCredentials(credentials);
		return "redirect:../list.html"; 
	}
	
}

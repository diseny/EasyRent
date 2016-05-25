package es.uji.ei1027.easyrent.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import es.uji.ei1027.easyrent.dao.OwnerDao;
import es.uji.ei1027.easyrent.domain.Owner;

@Controller
@RequestMapping("/owner")
public class OwnerController {
	
	private OwnerDao ownerDao; 

	@Autowired
	public void setOwnerDao(OwnerDao ownerDao) {
		this.ownerDao = ownerDao;
	}

	@RequestMapping("/list") 
	public String listOwner(Model model) {
		model.addAttribute("owners", ownerDao.getOwners());
		return "owner/list";
	}

	@RequestMapping(value="/add") 
	public String addOwner(Model model) {
		model.addAttribute("owner", new Owner());
		return "owner/add";
	}

	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String processAddSubmit(@ModelAttribute("owner") Owner owner, BindingResult bindingResult) {
		OwnerValidator ownerValidator = new OwnerValidator();
		ownerValidator.validate(owner, bindingResult);
		if (bindingResult.hasErrors())
			return "owner/add";
		try {
			ownerDao.addOwner(owner);
		} catch (Exception e) {
			if(e.getMessage()==null){
				return "redirect:list.html";
			}
			else{
				if(e.getMessage().contains("already exists")){
					bindingResult.rejectValue("username", "obligatori", "Parece que ya hay un Owner con el username indicado.");
				} else if(e.getMessage().contains("not present")){
					bindingResult.rejectValue("username", "obligatori", "Parece que el username no está registrado.");
				} 
				
				return "owner/add";
			}
		}
		return "redirect:list.html";
	 }

	@RequestMapping(value="/update/{username}", method = RequestMethod.GET)
	public String editOwner(Model model, @PathVariable String username) {
		model.addAttribute("owner", ownerDao.getOwner(username));
		return "owner/update"; 
	}

	@RequestMapping(value="/update/{username}", method = RequestMethod.POST) 
	public String processUpdateSubmit(@PathVariable String username, @ModelAttribute("owner") Owner owner, BindingResult bindingResult) {
		OwnerValidator OwnerValidator = new OwnerValidator();
		OwnerValidator.validate(owner, bindingResult);
		if (bindingResult.hasErrors()) 
			return "owner/update";
		ownerDao.updateOwner(owner);
		return "redirect:../list.html"; 
	}
	
	@RequestMapping(value="/delete/{username}", method = RequestMethod.GET)
	public String deleteOwner(Model model, @PathVariable String username) {
		model.addAttribute("owner", ownerDao.getOwner(username));
		return "owner/delete"; 
	}

	@RequestMapping(value="/delete/{username}", method = RequestMethod.POST) 
	public String processDeleteSubmit(@PathVariable String username, @ModelAttribute("owner") Owner owner, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) 
			return "owner/delete";
		ownerDao.deleteOwner(owner);
		return "redirect:../list.html"; 
	}
	
}

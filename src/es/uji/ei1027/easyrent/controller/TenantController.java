package es.uji.ei1027.easyrent.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import es.uji.ei1027.easyrent.dao.TenantDao;
import es.uji.ei1027.easyrent.domain.Tenant;

@Controller
@RequestMapping("/tenant")
public class TenantController {
	
	private TenantDao tenantDao; 

	@Autowired
	public void setTenantDao(TenantDao tenantDao) {
		this.tenantDao = tenantDao;
	}

	@RequestMapping("/list") 
	public String listTenant(Model model) {
		model.addAttribute("tenants", tenantDao.getTenants());
		return "tenant/list";
	}

	@RequestMapping(value="/add") 
	public String addTenant(Model model) {
		model.addAttribute("tenant", new Tenant());
		return "tenant/add";
	}

	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String processAddSubmit(@ModelAttribute("tenant") Tenant tenant, BindingResult bindingResult) {
		TenantValidator tenantValidator = new TenantValidator();
		tenantValidator.validate(tenant, bindingResult);
		if (bindingResult.hasErrors())
			return "tenant/add";
		try {
			tenant.setIsActive(true);
			tenantDao.addTenant(tenant);
		} catch (Exception e) {
			if(e.getMessage()==null){
				return "redirect:list.html";
			}
			else{
				if(e.getMessage().contains("already exists")){
					bindingResult.rejectValue("username", "obligatori", "Parece que ya hay un tenant con el username indicado.");
				} else if(e.getMessage().contains("not present")){
					bindingResult.rejectValue("username", "obligatori", "Parece que el username no está registrado.");
				} 
				
				return "tenant/add";
			}
		}
		return "redirect:list.html";
	 }

	@RequestMapping(value="/update/{username}", method = RequestMethod.GET)
	public String editTenant(Model model, @PathVariable String username) {
		model.addAttribute("tenant", tenantDao.getTenant(username));
		return "tenant/update"; 
	}

	@RequestMapping(value="/update/{username}", method = RequestMethod.POST) 
	public String processUpdateSubmit(@PathVariable String username, @ModelAttribute("tenant") Tenant tenant, BindingResult bindingResult) {
		TenantValidator tenantValidator = new TenantValidator();
		tenantValidator.validate(tenant, bindingResult);
		if (bindingResult.hasErrors()) 
			return "tenant/update";
		tenantDao.updateTenant(tenant);
		return "redirect:../list.html"; 
	}
	
	@RequestMapping(value="/delete/{username}", method = RequestMethod.GET)
	public String deleteTenant(Model model, @PathVariable String username) {
		model.addAttribute("tenant", tenantDao.getTenant(username));
		return "tenant/delete"; 
	}

	@RequestMapping(value="/delete/{username}", method = RequestMethod.POST) 
	public String processDeleteSubmit(@PathVariable String username, @ModelAttribute("tenant") Tenant tenant, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) 
			return "tenant/delete";
		tenantDao.deleteTenant(tenant);
		return "redirect:../list.html"; 
	}
	
}

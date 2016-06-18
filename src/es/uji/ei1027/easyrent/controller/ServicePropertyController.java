package es.uji.ei1027.easyrent.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import es.uji.ei1027.easyrent.dao.ServicePropertyDao;
import es.uji.ei1027.easyrent.domain.Property;
import es.uji.ei1027.easyrent.domain.Service;
import es.uji.ei1027.easyrent.domain.ServiceProperty;

@Controller
@RequestMapping("/service")
public class ServicePropertyController {

	@Autowired
	private ServicePropertyDao servicePropertyDao;
	
	@Autowired 
	   public void setServicePropertyDao(ServicePropertyDao servicePropertyDao) {
	       this.servicePropertyDao = servicePropertyDao;
	   }
	 @RequestMapping(value="/add") 
		public String addService(Model model) {
		 	ServiceProperty service = new ServiceProperty();
			model.addAttribute("service",service);
			Property prop = new Property();
			model.addAttribute("property",prop);
			   
			return "property/add";
		}
	/*
   @RequestMapping(value="/add", method=RequestMethod.POST)
	public String addProperty(@ModelAttribute("service") ServiceProperty service, Property property, BindingResult bindingResult, Model model) {
	   model.addAttribute("property",property);
	   if (bindingResult.hasErrors())
			return "service/add";
		try {
			//add service
			servicePropertyDao.addServiceProperty(service);
			
		} catch (Exception e) {/*
			if(e.getMessage()==null){
				return "redirect:list.html";
			}
			else{
				if(e.getMessage().contains("already exists")){
					bindingResult.rejectValue("ownerUsername", "obligatori", "Parece que ya hay una propiedad con el username indicado.");
				} else if(e.getMessage().contains("not present")){
					bindingResult.rejectValue("ownerUsername", "obligatori", "Parece que el username no est� registrado.");
				} 
				return "service/add";
			}
		}
		return "property/add";

	}*/

}

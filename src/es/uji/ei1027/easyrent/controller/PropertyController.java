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

import es.uji.ei1027.easyrent.dao.ImageDao;
import es.uji.ei1027.easyrent.dao.PropertyDao;
import es.uji.ei1027.easyrent.domain.Image;
import es.uji.ei1027.easyrent.domain.Property;

@Controller
@RequestMapping("/property")
public class PropertyController {
	
	private List<String> filters;
	
	@Autowired
	private PropertyDao propertyDao;

	@Autowired
	private ImageDao imageDao;
	
   @Autowired 
   public void setpropertyDao(PropertyDao propertyDao) {
       this.propertyDao = propertyDao;
   }
	
   @Autowired 
   public void setImageDao(ImageDao imageDao) {
       this.imageDao = imageDao;
   }
   
	@RequestMapping(value="/list")
	public String listProperties(Model model) {
		model.addAttribute("properties", propertyDao.getProperties());
		model.addAttribute("property", new Property());
		List<Image> list = imageDao.getImages();
		List<Image> images = new LinkedList<Image>();
		List<Integer> ids = new LinkedList<Integer>();
		for(Image i: list){
			if(!ids.contains(i.getID())){
				ids.add(i.getID());
				images.add(i);
			}
		}
		model.addAttribute("images", images);
		return "property/list";
	}
	
	@RequestMapping(value="/list", method=RequestMethod.POST)
	public String listProperties(@ModelAttribute("property") Property property, BindingResult bindingResult, Model model) {
		stablishFilters(property);
		model.addAttribute("properties", propertyDao.getPropertyFilter(filters));
		model.addAttribute("property", property);
		List<Image> list = imageDao.getImages();
		List<Image> images = new LinkedList<Image>();
		List<Integer> ids = new LinkedList<Integer>();
		for(Image i: list){
			if(!ids.contains(i.getID())){
				ids.add(i.getID());
				images.add(i);
			}
		}
		model.addAttribute("images", images);
		return "property/list";
	}

	@RequestMapping(value="/info/{id}", method = RequestMethod.GET)
	public String infoProperty(Model model, @PathVariable int id) {
		model.addAttribute("property", propertyDao.getProperty(id));
		return "property/info"; 
	}
	
	@RequestMapping(value="/listOrderOwnerDown")
	public String listPropertiesOwnerDown(@ModelAttribute("property") Property property, Model model) {
		model.addAttribute("property", property);
		return generalList(model, "owner_username","DESC");
	}
	
	@RequestMapping(value="/listOrderOwnerUp")
	public String listPropertiesOwnerUp(@ModelAttribute("property") Property property, Model model) {
		model.addAttribute("property", property);
		return generalList(model, "owner_username","ASC");
	}
	
	@RequestMapping(value="/listOrderTitleDown")
	public String listPropertiesTitleDown(@ModelAttribute("property") Property property, Model model) {
		model.addAttribute("property", property);
		return generalList(model, "title","DESC");
	}
	
	@RequestMapping(value="/listOrderTitleUp")
	public String listPropertiesTitleUp(@ModelAttribute("property") Property property, Model model) {
		model.addAttribute("property", property);
		return generalList(model, "title","ASC");
	}
	
	@RequestMapping(value="/listOrderCapacityDown")
	public String listPropertiesCapacityDown(@ModelAttribute("property") Property property, Model model) {
		model.addAttribute("property", property);
		return generalList(model, "capacity","DESC");
	}
	
	@RequestMapping(value="/listOrderCapacityUp")
	public String listPropertiesCapacityUp(@ModelAttribute("property") Property property, Model model) {
		model.addAttribute("property", property);
		return generalList(model, "capacity","ASC");
	}
	
	@RequestMapping(value="/listOrderRoomsDown")
	public String listPropertiesRoomsDown(@ModelAttribute("property") Property property, Model model) {
		model.addAttribute("property", property);
		return generalList(model, "num_rooms","DESC");
	}
	
	@RequestMapping(value="/listOrderRoomsUp")
	public String listPropertiesRoomsUp(@ModelAttribute("property") Property property, Model model) {
		model.addAttribute("property", property);
		return generalList(model, "num_rooms","ASC");
	}
	
	@RequestMapping(value="/listOrderBathroomsDown")
	public String listPropertiesBathroomsDown(@ModelAttribute("property") Property property, Model model) {
		model.addAttribute("property", property);
		return generalList(model, "num_bathrooms","DESC");
	}
	
	@RequestMapping(value="/listOrderBathroomsUp")
	public String listPropertiesBathroomsUp(@ModelAttribute("property") Property property, Model model) {
		model.addAttribute("property", property);
		return generalList(model, "num_bathrooms","ASC");
	}
	
	@RequestMapping(value="/listOrderBedsDown")
	public String listPropertiesBedsDown(@ModelAttribute("property") Property property, Model model) {
		model.addAttribute("property", property);
		return generalList(model, "num_beds","DESC");
	}
	
	@RequestMapping(value="/listOrderBedsUp")
	public String listPropertiesBedsUp(@ModelAttribute("property") Property property, Model model) {
		model.addAttribute("property", property);
		return generalList(model, "num_beds","ASC");
	}
	
	@RequestMapping(value="/listOrderMetersDown")
	public String listPropertiesMetersDown(@ModelAttribute("property") Property property, Model model) {
		model.addAttribute("property", property);
		return generalList(model, "square_meters","DESC");
	}
	
	@RequestMapping(value="/listOrderMetersUp")
	public String listPropertiesMetersUp(@ModelAttribute("property") Property property, Model model) {
		model.addAttribute("property", property);
		return generalList(model, "square_meters","ASC");
	}
	
	@RequestMapping(value="/listOrderStreetDown")
	public String listPropertiesStreetDown(@ModelAttribute("property") Property property, Model model) {
		model.addAttribute("property", property);
		return generalList(model, "street","DESC");
	}
	
	@RequestMapping(value="/listOrderStreetUp")
	public String listPropertiesStreetUp(@ModelAttribute("property") Property property, Model model) {
		model.addAttribute("property", property);
		return generalList(model, "street","ASC");
	}
	
	@RequestMapping(value="/listOrderCityDown")
	public String listPropertiesCityDown(@ModelAttribute("property") Property property, Model model) {
		model.addAttribute("property", property);
		return generalList(model, "city","DESC");
	}
	
	@RequestMapping(value="/listOrderCityUp")
	public String listPropertiesCityUp(@ModelAttribute("property") Property property, Model model) {
		model.addAttribute("property", property);
		return generalList(model, "city","ASC");
	}
	
	@RequestMapping(value="/listOrderPriceDown")
	public String listPropertiesPriceDown(@ModelAttribute("property") Property property, Model model) {
		model.addAttribute("property", property);
		return generalList(model, "daily_price","DESC");
	}
	
	@RequestMapping(value="/listOrderPriceUp")
	public String listPropertiesPriceUp(@ModelAttribute("property") Property property, Model model) {
		model.addAttribute("property", property);
		return generalList(model, "daily_price","ASC");
	}
	
	private String generalList(Model model, String field, String order){
		model.addAttribute("properties", propertyDao.getOrderedProperties(field,order));
		List<Image> list = imageDao.getImages();
		List<Image> images = new LinkedList<Image>();
		List<Integer> ids = new LinkedList<Integer>();
		for(Image i: list){
			if(!ids.contains(i.getID())){
				ids.add(i.getID());
				images.add(i);
			}
		}
		model.addAttribute("images", images);
		return "property/list";
	}
	
	private void stablishFilters(Property requirements) {
		filters = new LinkedList<String>(); 
		if(requirements.getCapacity()!=0)
			filters.add("capacity>=" + requirements.getCapacity());
		if(requirements.getNumRooms()!=0)
			filters.add("num_rooms>=" + requirements.getNumRooms());
		if(requirements.getNumBathrooms()!=0)
			filters.add("num_bathrooms>=" + requirements.getNumBathrooms());
		if(requirements.getNumBeds()!=0)
			filters.add("num_beds>=" + requirements.getNumBeds());
		if(requirements.getSquareMeters()!=0)
			filters.add("square_meters>=" + requirements.getSquareMeters());
		if(!requirements.getStreet().equals(""))
			filters.add("street='" + requirements.getStreet() + "'");
		if(!requirements.getCity().equals(""))
			filters.add("city='" + requirements.getCity() + "'");
		if(requirements.getDailyPrice()!=0)
			filters.add("daily_price<=" + requirements.getDailyPrice());
	}
	
}
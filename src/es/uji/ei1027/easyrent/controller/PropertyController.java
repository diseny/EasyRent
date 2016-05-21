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
		stablishFilters(property, "daily_price", "ASC");
		return generalList(model, property);
	}

	@RequestMapping(value="/info/{id}", method = RequestMethod.GET)
	public String infoProperty(Model model, @PathVariable int id) {
		model.addAttribute("property", propertyDao.getProperty(id));
		return "property/info"; 
	}
	
	@RequestMapping(value="/listOrderOwnerDown")
	public String listPropertiesOwnerDown(@ModelAttribute("property") Property property, Model model) {
		stablishFilters(property, "owner_username","DESC");
		return generalList(model, property);
	}
	
	@RequestMapping(value="/listOrderOwnerUp")
	public String listPropertiesOwnerUp(@ModelAttribute("property") Property property, Model model) {
		stablishFilters(property, "owner_username","ASC");
		return generalList(model, property);
	}
	
	@RequestMapping(value="/listOrderTitleDown")
	public String listPropertiesTitleDown(@ModelAttribute("property") Property property, Model model) {
		stablishFilters(property, "title","DESC");
		return generalList(model, property);
	}
	
	@RequestMapping(value="/listOrderTitleUp")
	public String listPropertiesTitleUp(@ModelAttribute("property") Property property, Model model) {
		stablishFilters(property, "title","ASC");
		return generalList(model, property);
	}
	
	@RequestMapping(value="/listOrderCapacityDown")
	public String listPropertiesCapacityDown(@ModelAttribute("property") Property property, Model model) {
		stablishFilters(property, "capacity","DESC");
		return generalList(model, property);
	}
	
	@RequestMapping(value="/listOrderCapacityUp")
	public String listPropertiesCapacityUp(@ModelAttribute("property") Property property, Model model) {
		stablishFilters(property, "capacity","ASC");
		return generalList(model, property);
	}
	
	@RequestMapping(value="/listOrderRoomsDown")
	public String listPropertiesRoomsDown(@ModelAttribute("property") Property property, Model model) {
		stablishFilters(property, "num_rooms","DESC");
		return generalList(model, property);
	}
	
	@RequestMapping(value="/listOrderRoomsUp")
	public String listPropertiesRoomsUp(@ModelAttribute("property") Property property, Model model) {
		stablishFilters(property, "num_rooms","ASC");
		return generalList(model, property);
	}
	
	@RequestMapping(value="/listOrderBathroomsDown")
	public String listPropertiesBathroomsDown(@ModelAttribute("property") Property property, Model model) {
		stablishFilters(property, "num_bathrooms","DESC");
		return generalList(model, property);
	}
	
	@RequestMapping(value="/listOrderBathroomsUp")
	public String listPropertiesBathroomsUp(@ModelAttribute("property") Property property, Model model) {
		stablishFilters(property, "num_bathrooms","ASC");
		return generalList(model, property);
	}
	
	@RequestMapping(value="/listOrderBedsDown")
	public String listPropertiesBedsDown(@ModelAttribute("property") Property property, Model model) {
		stablishFilters(property, "num_beds","DESC");
		return generalList(model, property);
	}
	
	@RequestMapping(value="/listOrderBedsUp")
	public String listPropertiesBedsUp(@ModelAttribute("property") Property property, Model model) {
		stablishFilters(property, "num_beds","ASC");
		return generalList(model, property);
	}
	
	@RequestMapping(value="/listOrderMetersDown")
	public String listPropertiesMetersDown(@ModelAttribute("property") Property property, Model model) {
		stablishFilters(property, "square_meters","DESC");
		return generalList(model, property);
	}
	
	@RequestMapping(value="/listOrderMetersUp")
	public String listPropertiesMetersUp(@ModelAttribute("property") Property property, Model model) {
		stablishFilters(property, "square_meters","ASC");
		return generalList(model, property);
	}
	
	@RequestMapping(value="/listOrderStreetDown")
	public String listPropertiesStreetDown(@ModelAttribute("property") Property property, Model model) {
		stablishFilters(property, "street","DESC");
		return generalList(model, property);
	}
	
	@RequestMapping(value="/listOrderStreetUp")
	public String listPropertiesStreetUp(@ModelAttribute("property") Property property, Model model) {
		stablishFilters(property, "street","ASC");
		return generalList(model, property);
	}
	
	@RequestMapping(value="/listOrderCityDown")
	public String listPropertiesCityDown(@ModelAttribute("property") Property property, Model model) {
		stablishFilters(property, "city","DESC");
		return generalList(model, property);
	}
	
	@RequestMapping(value="/listOrderCityUp")
	public String listPropertiesCityUp(@ModelAttribute("property") Property property, Model model) {
		model.addAttribute("property", property);
		stablishFilters(property, "city","ASC");
		return generalList(model, property);
	}
	
	@RequestMapping(value="/listOrderPriceDown")
	public String listPropertiesPriceDown(@ModelAttribute("property") Property property, Model model) {
		stablishFilters(property, "daily_price","DESC");
		return generalList(model, property);
	}
	
	@RequestMapping(value="/listOrderPriceUp")
	public String listPropertiesPriceUp(@ModelAttribute("property") Property property, Model model) {
		stablishFilters(property, "daily_price","ASC");
		return generalList(model, property);
	}
	
	private String generalList(Model model, Property property){
		model.addAttribute("property", property);
		model.addAttribute("properties", propertyDao.getPropertyFilter(filters));
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
	
	private void stablishFilters(Property requirements, String field, String order) {
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
		filters.add("ORDER BY " + field + " " + order);
	}
	
}
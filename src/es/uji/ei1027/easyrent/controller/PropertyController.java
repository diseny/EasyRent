package es.uji.ei1027.easyrent.controller;

import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import es.uji.ei1027.easyrent.dao.ImageDao;
import es.uji.ei1027.easyrent.dao.PropertyDao;
import es.uji.ei1027.easyrent.domain.Image;

@Controller
@RequestMapping("/property")
public class PropertyController {
	
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
	
	@RequestMapping(value="/listOrderOwnerDown")
	public String listPropertiesOwnerDown(Model model) {
		return generalList(model, "owner_username","DESC");
	}
	
	@RequestMapping(value="/listOrderOwnerUp")
	public String listPropertiesOwnerUp(Model model) {
		return generalList(model, "owner_username","ASC");
	}
	
	@RequestMapping(value="/listOrderTitleDown")
	public String listPropertiesTitleDown(Model model) {
		return generalList(model, "title","DESC");
	}
	
	@RequestMapping(value="/listOrderTitleUp")
	public String listPropertiesTitleUp(Model model) {
		return generalList(model, "title","ASC");
	}
	
	@RequestMapping(value="/listOrderCapacityDown")
	public String listPropertiesCapacityDown(Model model) {
		return generalList(model, "capacity","DESC");
	}
	
	@RequestMapping(value="/listOrderCapacityUp")
	public String listPropertiesCapacityUp(Model model) {
		return generalList(model, "capacity","ASC");
	}
	
	@RequestMapping(value="/listOrderRoomsDown")
	public String listPropertiesRoomsDown(Model model) {
		return generalList(model, "num_rooms","DESC");
	}
	
	@RequestMapping(value="/listOrderRoomsUp")
	public String listPropertiesRoomsUp(Model model) {
		return generalList(model, "num_rooms","ASC");
	}
	
	@RequestMapping(value="/listOrderBathroomsDown")
	public String listPropertiesBathroomsDown(Model model) {
		return generalList(model, "num_bathrooms","DESC");
	}
	
	@RequestMapping(value="/listOrderBathroomsUp")
	public String listPropertiesBathroomsUp(Model model) {
		return generalList(model, "num_bathrooms","ASC");
	}
	
	@RequestMapping(value="/listOrderBedsDown")
	public String listPropertiesBedsDown(Model model) {
		return generalList(model, "num_beds","DESC");
	}
	
	@RequestMapping(value="/listOrderBedsUp")
	public String listPropertiesBedsUp(Model model) {
		return generalList(model, "num_beds","ASC");
	}
	
	@RequestMapping(value="/listOrderMetersDown")
	public String listPropertiesMetersDown(Model model) {
		return generalList(model, "square_meters","DESC");
	}
	
	@RequestMapping(value="/listOrderMetersUp")
	public String listPropertiesMetersUp(Model model) {
		return generalList(model, "square_meters","ASC");
	}
	
	@RequestMapping(value="/listOrderStreetDown")
	public String listPropertiesStreetDown(Model model) {
		return generalList(model, "street","DESC");
	}
	
	@RequestMapping(value="/listOrderStreetUp")
	public String listPropertiesStreetUp(Model model) {
		return generalList(model, "street","ASC");
	}
	
	@RequestMapping(value="/listOrderCityDown")
	public String listPropertiesCityDown(Model model) {
		return generalList(model, "city","DESC");
	}
	
	@RequestMapping(value="/listOrderCityUp")
	public String listPropertiesCityUp(Model model) {
		return generalList(model, "city","ASC");
	}
	
	@RequestMapping(value="/listOrderPriceDown")
	public String listPropertiesPriceDown(Model model) {
		return generalList(model, "daily_price","DESC");
	}
	
	@RequestMapping(value="/listOrderPriceUp")
	public String listPropertiesPriceUp(Model model) {
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
	
}
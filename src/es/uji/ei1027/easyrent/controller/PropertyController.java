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
	
}
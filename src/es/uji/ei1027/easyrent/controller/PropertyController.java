package es.uji.ei1027.easyrent.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Date;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import es.uji.ei1027.easyrent.dao.ImageDao;
import es.uji.ei1027.easyrent.dao.PeriodDao;
import es.uji.ei1027.easyrent.dao.PropertyDao;
import es.uji.ei1027.easyrent.dao.PunctuationDao;
import es.uji.ei1027.easyrent.dao.ReservationDao;
import es.uji.ei1027.easyrent.dao.ServiceDao;
import es.uji.ei1027.easyrent.dao.ServicePropertyDao;
import es.uji.ei1027.easyrent.domain.Period;
import es.uji.ei1027.easyrent.domain.Property;
import es.uji.ei1027.easyrent.domain.Reservation;
import es.uji.ei1027.easyrent.domain.Service;
import es.uji.ei1027.easyrent.domain.ServiceProperty;

@Controller
@RequestMapping("/property")
public class PropertyController {
	
	private List<String> filters;
	
	@Autowired
	private PropertyDao propertyDao;

	@Autowired
	private ImageDao imageDao;
	
	@Autowired
	private PeriodDao periodDao;
	
	@Autowired
	private ReservationDao reservationDao;
	
	@Autowired
	private ServiceDao serviceDao;
	
	@Autowired
	private ServicePropertyDao servicePropertyDao;
	
	@Autowired
	private PunctuationDao punctuationDao;
	
   @Autowired 
   public void setpropertyDao(PropertyDao propertyDao) {
       this.propertyDao = propertyDao;
   }
	
   @Autowired 
   public void setImageDao(ImageDao imageDao) {
       this.imageDao = imageDao;
   }
   
   @Autowired 
   public void setPeriodDao(PeriodDao periodDao) {
       this.periodDao = periodDao;
   }
   
   @Autowired 
   public void setServiceDao(ServiceDao serviceDao) {
       this.serviceDao = serviceDao;
   }
   
   @Autowired 
   public void setServicePropertyDao(ServicePropertyDao servicePropertyDao) {
       this.servicePropertyDao = servicePropertyDao;
   }
   
   @Autowired 
   public void setPunctuationDao(PunctuationDao punctuationDao) {
       this.punctuationDao = punctuationDao;
   }
   
	@RequestMapping(value="/list")
	public String listProperties(Model model) {
		model.addAttribute("properties", propertyDao.getProperties());
		model.addAttribute("property", new Property());
		List<ServiceProperty> servicesProperties = servicePropertyDao.getServicesProperties();
		List<Service> services = serviceDao.getServices();
		List<Service> allServices = serviceDao.getServices();
		for(ServiceProperty sP: servicesProperties){
			for(Service s: services){
				if(s.getID() == sP.getServiceId()){
					sP.setServiceName(s.getName());
				}
			}
		}
		model.addAttribute("allServices", allServices);
		model.addAttribute("services", servicesProperties);
		model.addAttribute("images", imageDao.getImages());
		return "property/list";
	}
	
	@RequestMapping(value="/list", method=RequestMethod.POST)
	public String listProperties(@ModelAttribute("property") Property property, BindingResult bindingResult, Model model) {
		stablishFilters(property, "daily_price", "ASC");
		return generalList(model, property);
	}

	@RequestMapping(value="/info/{id}", method = RequestMethod.GET)
	public String infoProperty(Model model, @PathVariable int id) {
		List<ServiceProperty> servicesProperties = servicePropertyDao.getServicesProperties();
		List<Service> services = serviceDao.getServices();
		List<Service> allServices = serviceDao.getServices();
		List<Period> periods= periodDao.getPeriods(id);
		List<Reservation> reservas = reservationDao.getReservations(id);
		for(ServiceProperty sP: servicesProperties){
			for(Service s: services){
				if(s.getID() == sP.getServiceId()){
					sP.setServiceName(s.getName());
				}
			}
		}
		model.addAttribute("reservas",reservas);
		model.addAttribute("periods",periods);
		model.addAttribute("allServices", allServices);
		model.addAttribute("services", servicesProperties);
		model.addAttribute("property", propertyDao.getProperty(id));
		model.addAttribute("images", imageDao.getImages());
		model.addAttribute("punctuations", punctuationDao.getPunctuations(id));		
		try{
			float average = punctuationDao.getPunctuationAverage(id);
			model.addAttribute("average", Math.round(average));
		} catch(NullPointerException e) {;}
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
		List<ServiceProperty> servicesProperties = servicePropertyDao.getServicesProperties();
		List<Service> services = serviceDao.getServices();
		for(ServiceProperty sP: servicesProperties){
			for(Service s: services){
				if(s.getID() == sP.getServiceId()){
					sP.setServiceName(s.getName());
				}
			}
		}
		model.addAttribute("services", servicesProperties);
		model.addAttribute("images", imageDao.getImages());
		return "property/list";
	}
	
	private void stablishFilters(Property requirements, String field, String order) {
		List<Integer> propertiesIds = null;
		if(requirements.getStartDate()!=null && !requirements.getStartDate().equals("") && requirements.getFinishDate()!=null && !requirements.getFinishDate().equals("")){
			String []startDate = requirements.getStartDate().split("/");
			Date start = new java.sql.Date(Integer.parseInt(startDate[2])-1900,Integer.parseInt(startDate[0])-1,Integer.parseInt(startDate[1]));
			String []finishDate = requirements.getFinishDate().split("/");
			Date finish = new java.sql.Date(Integer.parseInt(finishDate[2])-1900,Integer.parseInt(finishDate[0])-1,Integer.parseInt(finishDate[1]));
			if(finish.compareTo(start)>0){
				propertiesIds = periodDao.getPropertiesIdPeriod(start.toString(), finish.toString());
			}
		}
		
		filters = new LinkedList<String>();
		if(propertiesIds!=null){
			String idsQuery = "(";
			for(int id: propertiesIds){
				idsQuery += id + ",";
			}
			idsQuery = idsQuery.substring(0, idsQuery.length()-1) + ")";
			filters.add("id IN " + idsQuery);
		}
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
	
	@RequestMapping(value="/uploadFile")
	public String uploadFileHandler() {
	
		return "property/upload";
	}
	
	@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
	public String uploadFileHandler(@RequestParam("name") String name,
			@RequestParam("file") MultipartFile file) {
		
		return "property/upload";
		/*
		 *
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();

				// Creating the directory to store file
				String rootPath = System.getProperty("catalina.home");
				File dir = new File(rootPath + File.separator + "tmpFiles");
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath()
						+ File.separator + name);
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				
				return "You successfully uploaded file=" + name;
			} catch (Exception e) {
				return "You failed to upload " + name + " => " + e.getMessage();
			}
		} else {
			return "You failed to upload " + name
					+ " because the file was empty.";
		}*/
	}

	/**
	 * Upload multiple file using Spring Controller
	 */
	@RequestMapping(value = "/uploadMultipleFile", method = RequestMethod.POST)
	String uploadMultipleFileHandler(@RequestParam("name") String[] names,
			@RequestParam("file") MultipartFile[] files) {

		if (files.length != names.length)
			return "Mandatory information missing";

		String message = "";
		for (int i = 0; i < files.length; i++) {
			MultipartFile file = files[i];
			String name = names[i];
			try {
				byte[] bytes = file.getBytes();

				// Creating the directory to store file
				String rootPath = System.getProperty("catalina.home");
				File dir = new File(rootPath + File.separator + "tmpFiles");
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath()
						+ File.separator + name);
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				

				message = message + "You successfully uploaded file=" + name ;
			} catch (Exception e) {
				return "You failed to upload " + name + " => " + e.getMessage();
			}
		}
		return message;
	}
	
}
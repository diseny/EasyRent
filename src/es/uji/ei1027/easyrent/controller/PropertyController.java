package es.uji.ei1027.easyrent.controller;

import java.io.File;
import java.net.URL;
import java.sql.Date;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.validation.Validator;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import es.uji.ei1027.easyrent.dao.ImageDao;
import es.uji.ei1027.easyrent.dao.PeriodDao;
import es.uji.ei1027.easyrent.dao.PropertyDao;
import es.uji.ei1027.easyrent.dao.PunctuationDao;
import es.uji.ei1027.easyrent.dao.ReservationDao;
import es.uji.ei1027.easyrent.dao.ServiceDao;
import es.uji.ei1027.easyrent.dao.ServicePropertyDao;
import es.uji.ei1027.easyrent.dao.ServicesPropertyDao;
import es.uji.ei1027.easyrent.dao.UserDao;
import es.uji.ei1027.easyrent.domain.Image;
import es.uji.ei1027.easyrent.domain.Period;
import es.uji.ei1027.easyrent.domain.PopUpMessage;
import es.uji.ei1027.easyrent.domain.Property;
import es.uji.ei1027.easyrent.domain.Reservation;
import es.uji.ei1027.easyrent.domain.Service;
import es.uji.ei1027.easyrent.domain.ServiceProperty;
import es.uji.ei1027.easyrent.domain.User;

class PropertyValidator implements Validator { 

	public boolean supports(Class<?> cls) { 
		return Property.class.isAssignableFrom(cls);
	}

	public void validate(Object obj, Errors errors) {
		Property property = (Property)obj;
		if(property.getTitle().equals(""))
			errors.rejectValue("title", "empty", "La propiedad debe tener un t�tulo.");
		if(property.getDescription().equals(""))
			errors.rejectValue("description", "empty", "La propiedad debe tener una descrpci�n.");
		if(property.getCapacity()<1)
			errors.rejectValue("capacity", "empty", "M�nimo 1.");
		if(property.getNumBathrooms()<1)
			errors.rejectValue("numBathrooms", "empty", "M�nimo 1.");
		if(property.getNumRooms()<1)
			errors.rejectValue("numRooms", "empty", "M�nimo 1.");
		if(property.getNumBeds()<1)
			errors.rejectValue("numBeds", "empty", "M�nimo 1.");
		if(property.getSquareMeters()<15)
			errors.rejectValue("squareMeters", "empty", "M�nimo 15.");
		if(property.getDailyPrice()<1)
			errors.rejectValue("dailyPrice", "empty", "M�nimo 1�/d�a.");
		if(property.getCity().equals(""))
			errors.rejectValue("city", "empty", "Debe indicar la ciudad en la que est� la propiedad.");
		if(property.getStreet().equals(""))
			errors.rejectValue("street", "empty", "Debe indicar la calle en la que est� la propiedad.");
		if(property.getNumber()<1)
			errors.rejectValue("number", "empty", "Debe indicar el portal.");
		if(property.getFloor().equals(""))
			errors.rejectValue("floor", "empty", "Debe indicar el piso.");
		if(property.getStart()==null)
			errors.rejectValue("start", "empty", "La propiedad debe tener una fecha de inicio.");
		else if(property.getStart().equals(""))
			errors.rejectValue("start", "empty", "La propiedad debe tener una fecha de inicio.");
		if(property.getFinish()==null)
			errors.rejectValue("start", "empty", "La propiedad debe tener una fecha de final.");
		else if(property.getFinish().equals(""))
			errors.rejectValue("finish", "empty", "La propiedad debe tener una fecha de final.");
	}

}

@Controller
@RequestMapping("/property")
public class PropertyController {
	
	private List<String> filters;
	final long MILLSECS_PER_DAY = 24 * 60 * 60 * 1000;
	List<String> servicesList = new LinkedList<String>(Arrays.asList("Balcon","Piscina","Wifi","Jacuzzi","Parque","Television","Gimnasio","Jardin","Cocina"));
	
	@Autowired
	private PropertyDao propertyDao;

	@Autowired
	private ImageDao imageDao;
	
	@Autowired
	private PeriodDao periodDao;
	
	@Autowired
	private ServiceDao serviceDao;
	
	@Autowired
	private ServicePropertyDao servicePropertyDao;
	
	@Autowired 
	private ServicesPropertyDao servicesPropertyDao;
	
	@Autowired
	private PunctuationDao punctuationDao;
	
	@Autowired
	private ReservationDao reservationDao;
	
	@Autowired
	private ImageDao imagenDao;
	
	@Autowired
	private UserDao userDao;
	
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
   
   @Autowired 
   public void setReservationDao(ReservationDao reservationDao) {
       this.reservationDao = reservationDao;
   }
   
   @Autowired 
   public void setUserDao(UserDao userDao) {
       this.userDao = userDao;
   }
   
   @RequestMapping(value="/add") 
	public String addProperty(Model model, HttpSession session) {
	   User user = (User)session.getAttribute("user");
	   if (user == null) 
       { 
          model.addAttribute("user", new User()); 
          session.setAttribute("nextURL", "property/add.html");
          return "login";
       } else if(!user.getRole().equals("Owner")){
    	   return "redirect:../user/profile.html";
       }
	   Property prop = new Property();
		List<Service> allServices = serviceDao.getServices();
		int numProp = propertyDao.getProperties().size();
		model.addAttribute("property",prop);
		model.addAttribute("numProp", numProp);
		model.addAttribute("allServices", allServices);
		Integer popUpCounter = (Integer)session.getAttribute("counter");
	    if(popUpCounter!=null){
		    if(popUpCounter==0){
		 	   popUpCounter++;
		   	   session.setAttribute("counter", popUpCounter);
		    }
		    else{
			    session.removeAttribute("counter");
			    session.removeAttribute("message");
		    }
	    }
		return "property/add";
	}
   
   @RequestMapping(value="/add", method=RequestMethod.POST)
	public String addProperty(@ModelAttribute("property") Property property, BindingResult bindingResult, Model model, HttpSession session) {
	   User user = (User)session.getAttribute("user");
	   if (user == null) 
       { 
          model.addAttribute("user", new User()); 
          session.setAttribute("nextURL", "property/add.html");
          return "login";
       } else if(!user.getRole().equals("Owner")){
    	   return "redirect:../user/profile.html";
       } 
	   PropertyValidator propertyValidator = new PropertyValidator(); 
	    propertyValidator.validate(property, bindingResult);
	    boolean hasErrors = false;
	    boolean contained;
	    for(ObjectError e: bindingResult.getAllErrors()){
	    	contained = false;
	    	for(String service: servicesList){
	    		if(e.toString().contains(service)){
	    			contained = true;
	    			break;
	    		}
	    	}
	    	if(!contained){
	    		hasErrors = true;
	    		break;
	    	}
	    }
	    if (hasErrors) {
			List<Service> allServices = serviceDao.getServices();
			model.addAttribute("allServices", allServices);
			return "property/add";
		}
	    int numProp = propertyDao.getProperties().size();
		model.addAttribute("numProp", numProp);
		try {
			CommonsMultipartFile fich = property.getFichero();
			String name = property.getFichero().getOriginalFilename();
			property.setIsActive(false);
			property.setValidated("pending");
			propertyDao.addProperty(property);
			servicesPropertyDao.addServicesProperty(property);
			periodDao.addPeriod(property);
			File nDirectory = new File("C:/Users/Francisco/Desktop/INGENIER�A INFORM�TICA/3 - TERCERO/SEGUNDO SEMESTRE/DISE�O E IMPLEMENTACI�N DE SISTEMAS DE INFORMACI�N/EasyRent/WebContent/images/propiedades/"+numProp);
			nDirectory.mkdirs();
			if(!name.equals("")){
				property.setHref(name);
				imagenDao.addImage(property);
				FileCopyUtils.copy(fich.getBytes(), new File(nDirectory+"/"+name));
			}
		} catch (Exception e) {
			if(e.getMessage()==null){
				PopUpMessage message = new PopUpMessage();
				message.setTitle("Error");
				message.setMessage("No se ha podido a�adir la propiedad. Int�ntalo m�s tarde.");
				session.setAttribute("message", message);
				session.setAttribute("counter", 0);
				return "redirect:add.html";
			}
		}
		PopUpMessage message = new PopUpMessage();
		message.setTitle("Hecho");
		message.setMessage("Has a�adido la propiedad con t�tulo " + property.getTitle() + ". Cuando el administrador la valide se mostrar� para todos los usuarios.");
		session.setAttribute("message", message);
		session.setAttribute("counter", 0);
		return "redirect:../user/profile.html";
	}

   @RequestMapping(value="/activate/{id}")
   public String activate(Model model, @PathVariable int id, HttpSession session){
	   User user = (User)session.getAttribute("user");
	   if (user == null || !user.getRole().equals("Owner")){ 
          model.addAttribute("user", new User()); 
    	  return "redirect:../../user/profile.html";
       }
	   Property property = propertyDao.getProperty(id);
	   property.setIsActive(true);
	   propertyDao.updateProperty(property);
	   PopUpMessage message = new PopUpMessage();
	   message.setTitle("Hecho");
	   message.setMessage("Tu propiedad con t�tulo " + property.getTitle() + " vuelve a ser visible.");
	   session.setAttribute("message", message);
	   session.setAttribute("counter", 0);
	   return "redirect:../../user/profile.html";
   }
   
   @RequestMapping(value="/delete/{id}")
   public String delete(Model model, @PathVariable int id, HttpSession session){
	   User user = (User)session.getAttribute("user");
	   if (user == null || !user.getRole().equals("Owner")){ 
          model.addAttribute("user", new User()); 
    	  return "redirect:../../user/profile.html";
       }
	   Property property = propertyDao.getProperty(id);
	   property.setIsActive(false);
	   propertyDao.updateProperty(property);
	   PopUpMessage message = new PopUpMessage();
	   message.setTitle("Hecho");
	   message.setMessage("Tu propiedad con t�tulo " + property.getTitle() + " es invisible. Para volver a hacerla visible pulsa Reactivar.");
	   session.setAttribute("message", message);
	   session.setAttribute("counter", 0);
	   return "redirect:../../user/profile.html";
   }
   
   @RequestMapping(value="/update/{id}")
   public String update(@PathVariable int id, Model model, HttpSession session){

	   User user = (User)session.getAttribute("user");
	   if (user == null || !user.getRole().equals("Owner")){ 
          model.addAttribute("user", new User()); 
    	  return "redirect:../../user/profile.html";
       }
	   Property property = propertyDao.getProperty(id);
	   model.addAttribute("property", property);
	   List<Service> allServices = serviceDao.getServices();
	   List<ServiceProperty> servicesProperty = servicePropertyDao.getServicesProperty(id);
	   List<Integer> ids = new LinkedList<Integer>();
	   for(ServiceProperty sP: servicesProperty){
		   ids.add(sP.getServiceId());
	   }
	   for(Service s: allServices){
		   if(ids.contains(s.getID())){
			   s.setPropertyHas(true);
		   } else {
			   s.setPropertyHas(false);
		   }
	   }
	   model.addAttribute("allServices", allServices);
	   return "property/update";
   }
   
   @RequestMapping(value="/update/{id}", method=RequestMethod.POST)
   public String updatePost(@ModelAttribute("property") Property property, BindingResult bindingResult, Model model, @PathVariable int id, HttpSession session){
	   System.out.println("Me ejecuto");
	   User user = (User)session.getAttribute("user");
	   if (user == null || !user.getRole().equals("Owner")){ 
          model.addAttribute("user", new User()); 
    	  return "redirect:../../user/profile.html";
       }
	   PropertyValidator propertyValidator = new PropertyValidator(); 
	    propertyValidator.validate(property, bindingResult);
	    boolean hasErrors = false;
	    boolean contained;
	    for(ObjectError e: bindingResult.getAllErrors()){
	    	contained = false;
	    	for(String service: servicesList){
	    		if(e.toString().contains(service)){
	    			contained = true;
	    			break;
	    		}
	    	}
	    	if(!contained){
	    		hasErrors = true;
	    		break;
	    	}
	    }
	  
	   try{
		   propertyDao.updateProperty(property);
		   servicesPropertyDao.updateServicesProperty(property);
	   }catch(Exception e){
		   PopUpMessage message = new PopUpMessage();
		   message.setTitle("Error");
		   message.setMessage("Tu propiedad con t�tulo " + property.getTitle() + " no ha podido ser actualizada.");
		   session.setAttribute("message", message);
		   session.setAttribute("counter", 0);
		   return "redirect:../../user/profile.html";
	   }
	   PopUpMessage message = new PopUpMessage();
	   message.setTitle("Hecho");
	   message.setMessage("Tu propiedad con t�tulo " + property.getTitle() + " ha sido actualizada correctamente.");
	   session.setAttribute("message", message);
	   session.setAttribute("counter", 0);
	   return "redirect:../../user/profile.html";
   }
   
   @RequestMapping(value="/periods/{id}")
   public String periods(Model model, @PathVariable int id, HttpSession session){
	   User user = (User)session.getAttribute("user");
	   if (user == null || !user.getRole().equals("Owner")){ 
          model.addAttribute("user", new User()); 
    	  return "redirect:../../user/profile.html";
       }
	   Property property = propertyDao.getProperty(id);
	   model.addAttribute("property", property);
	   model.addAttribute("periods", periodDao.getPeriods(id));
	   Period period = new Period();
	   period.setPropertyId(id);
	   model.addAttribute("period", period);
	   return "/property/periodlist";
   }
   
   @RequestMapping(value="/deleteperiod/{propertyId}/{periodId}")
   public String deletePeriod(Model model, @PathVariable int propertyId, @PathVariable int periodId, HttpSession session){
	   User user = (User)session.getAttribute("user");
	   if (user == null || !user.getRole().equals("Owner")){ 
          model.addAttribute("user", new User()); 
    	  return "redirect:../../../user/profile.html";
       }
	   Period period = periodDao.getPeriod(propertyId, periodId);
	   periodDao.deletePeriod(propertyId, periodId);
	   PopUpMessage message = new PopUpMessage();
	   message.setTitle("Hecho");
	   message.setMessage("Se ha borrado el periodo que va de " + period.getStart() + " a " + period.getFinish() + ". Tu propiedad no se mostrar� disponible para estas fechas pero la reservas que ya hay hechas no se pueden eliminar.");
	   session.setAttribute("message", message);
	   session.setAttribute("counter", 0);
	   return "redirect:../../../user/profile.html";
   }
   
   @RequestMapping(value="/addPeriod", method=RequestMethod.POST)
   public String addPeriod(Model model, @ModelAttribute("period") Period period, HttpSession session){
	   User user = (User)session.getAttribute("user");
	   if (user == null || !user.getRole().equals("Owner")){ 
          model.addAttribute("user", new User()); 
    	  return "redirect:../user/profile.html";
       }
	   period.setPeriodId(periodDao.getPeriods(period.getPropertyId()).size());
	   periodDao.addPeriod(period);
	   PopUpMessage message = new PopUpMessage();
	   message.setTitle("Hecho");
	   message.setMessage("Se ha a�adido el periodo que va de " + period.getStart() + " a " + period.getFinish() + ". Tu propiedad se mostrar� disponible para estas fechas.");
	   session.setAttribute("message", message);
	   session.setAttribute("counter", 0);
	   return "redirect:../user/profile.html";
   }
   
   @RequestMapping(value="/photosAdmin/{id}")
   public String photos(Model model, @PathVariable int id, HttpSession session){
	   User user = (User)session.getAttribute("user");
	   if (user == null || !user.getRole().equals("Owner")){ 
          model.addAttribute("user", new User()); 
    	  return "redirect:../../user/profile.html";
       }
	   Property property = propertyDao.getProperty(id);
	   model.addAttribute("property", property);
	   model.addAttribute("images", imageDao.getImagesProperty(id));
	   Image image = new Image();
	   image.setID(id);
	   model.addAttribute("image", image);
	   Integer popUpCounter = (Integer)session.getAttribute("counter");
	   if(popUpCounter!=null){
		   if(popUpCounter==0){
			   popUpCounter++;
		   	   session.setAttribute("counter", popUpCounter);
		   }
		   else{
			   session.removeAttribute("counter");
			   session.removeAttribute("message");
		   }
	   }
	   return "/property/photosAdmin";
   }
   
   @RequestMapping(value="/deletePhoto/{id}/{caption}")
   public String deletePhoto(Model model, @PathVariable int id, @PathVariable String caption, HttpSession session){
	   User user = (User)session.getAttribute("user");
	   if (user == null || !user.getRole().equals("Owner")){ 
          model.addAttribute("user", new User()); 
    	  return "redirect:../../user/profile.html";
       }
	   imageDao.deleteImage(id, caption);
	   Property property = propertyDao.getProperty(id);
	   model.addAttribute("property", property);
	   model.addAttribute("images", imageDao.getImagesProperty(id));
	   Image image = new Image();
	   image.setID(id);
	   model.addAttribute("image", image);
	   PopUpMessage message = new PopUpMessage();
	   message.setTitle("Hecho");
	   message.setMessage("Has eliminado la foto.");
	   session.setAttribute("message", message);
	   session.setAttribute("counter", 0);
	   return "redirect:../../photosAdmin/" + id + ".html";
   }
   
   @RequestMapping(value="/uploadPhoto")
   public String uploadPhoto(Model model, @ModelAttribute("property") Property property, HttpSession session){
	   try {	
			CommonsMultipartFile fich = property.getFichero();
			String name = property.getFichero().getOriginalFilename();
				 
			File nDirectory = new File("C:/Users/Francisco/Desktop/INGENIER�A INFORM�TICA/3 - TERCERO/SEGUNDO SEMESTRE/DISE�O E IMPLEMENTACI�N DE SISTEMAS DE INFORMACI�N/EasyRent/WebContent/images/propiedades/" + property.getId());
			nDirectory.mkdirs();
			if(!name.equals("")){
				property.setHref(name);
				imagenDao.addImage(property);
				FileCopyUtils.copy(fich.getBytes(), new File(nDirectory+"/"+name));
			}
		} catch (Exception e) {
			if(e.getMessage()==null){
				PopUpMessage message = new PopUpMessage();
				message.setTitle("Error");
				message.setMessage("No se ha podido a�adir la imagen. Int�ntalo m�s tarde.");
				session.setAttribute("message", message);
				session.setAttribute("counter", 0);
				return "redirect:photosAdmin/" + property.getId() + ".html";
			}
		}
		PopUpMessage message = new PopUpMessage();
		message.setTitle("Hecho");
		message.setMessage("Has a�adido la imagen de la propiedad " + property.getTitle() + ".");
		session.setAttribute("message", message);
		session.setAttribute("counter", 0);
		return "redirect:photosAdmin/" + property.getId() + ".html";
	}
   
	@RequestMapping(value="/list")
	public String listProperties(Model model) {
		List<Property> properties = propertyDao.getProperties();
		List<Property> activeProperties = new LinkedList<Property>();
		for(Property p: properties){
			if(userDao.getCredentials(p.getOwnerUsername()).getIsActive() && p.getIsActive()){
				activeProperties.add(p);
			}
		}
		model.addAttribute("properties", activeProperties);
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
	
	@RequestMapping(value="/validateList")
	public String listValidateProperties(Model model, HttpSession session) {
		User user = (User)session.getAttribute("user");
		if (user == null || !user.getRole().equals("Administrator")){ 
			model.addAttribute("user", new User()); 
	    	return "redirect:../user/profile.html";
	    }
		List<Property> properties = propertyDao.getProperties();
		model.addAttribute("properties", properties);
		Integer popUpCounter = (Integer)session.getAttribute("counter");
		if(popUpCounter!=null){
			if(popUpCounter==0){
				popUpCounter++;
			   	session.setAttribute("counter", popUpCounter);
			}
			else{
				session.removeAttribute("counter");
				session.removeAttribute("message");
			}
		}
		return "property/validateList";
	}
	
	@RequestMapping(value="/reject/{id}")
	public String rejectProperty(Model model, HttpSession session, @PathVariable int id) {
		User user = (User)session.getAttribute("user");
		if (user == null || !user.getRole().equals("Administrator")){ 
			model.addAttribute("user", new User()); 
	    	return "redirect:../../user/profile.html";
	    }
		Property property = propertyDao.getProperty(id);
		property.setValidated("rejected");
		propertyDao.updateProperty(property);
		PopUpMessage message = new PopUpMessage();
		message.setTitle("Hecho");
	    message.setMessage("No has permitido que se registre la propiedad.");
	    session.setAttribute("message", message);
	    session.setAttribute("counter", 0);
		return "redirect:../validateList.html";
	}
	
	@RequestMapping(value="/validate/{id}")
	public String valdiateProperty(Model model, HttpSession session, @PathVariable int id) {
		User user = (User)session.getAttribute("user");
		if (user == null || !user.getRole().equals("Administrator")){ 
			model.addAttribute("user", new User()); 
	    	return "redirect:../../user/profile.html";
	    }
		Property property = propertyDao.getProperty(id);
		property.setIsActive(true);
		property.setValidated("validated");
		propertyDao.updateProperty(property);
		PopUpMessage message = new PopUpMessage();
		message.setTitle("Hecho");
	    message.setMessage("Has validado la propiedad.");
	    session.setAttribute("message", message);
	    session.setAttribute("counter", 0);
	    return "redirect:../validateList.html";
	}
	
	@RequestMapping(value="/list", method=RequestMethod.POST)
	public String listProperties(@ModelAttribute("property") Property property, BindingResult bindingResult, Model model) {
		stablishFilters(property, "daily_price", "ASC");
		return generalList(model, property);
	}

	@RequestMapping(value="/info/{id}", method = RequestMethod.GET)
	public String infoProperty(Model model, @PathVariable int id, HttpSession session) {
		List<ServiceProperty> servicesProperties = servicePropertyDao.getServicesProperties();
		List<Service> services = serviceDao.getServices();
		List<Service> allServices = serviceDao.getServices();
		List<Period> periods = periodDao.getPeriods(id);
		if(periods.size()==0){
			Period period = new Period();
			period.setStart("2015-1-1");
			int year = new java.util.Date().getYear()+1900;
			int month = new java.util.Date().getMonth()+1;
			int day = new java.util.Date().getDay()-1;
			period.setFinish(year + "-" + month + day);
			periods.add(period);
		}
		List<Reservation> reservas = reservationDao.getReservationsProperty(id);
		List<Reservation> reservasNoRechazadas = new LinkedList<Reservation>();
		List<Image> images = imageDao.getImages();
		List<Image> imagesProperty = new LinkedList<Image>();
		for(Reservation r: reservas){
			if(!r.getStatus().equals("rejected")){
				reservasNoRechazadas.add(r);
			}
		}
		for(ServiceProperty sP: servicesProperties){
			for(Service s: services){
				if(s.getID() == sP.getServiceId()){
					sP.setServiceName(s.getName());
				}
			}
		}
		for(Image i: images){
			if(i.getID()==id){
				imagesProperty.add(i);
			}
		}
		model.addAttribute("reservas",reservasNoRechazadas);
		model.addAttribute("periods",periods);
		model.addAttribute("allServices", allServices);
		model.addAttribute("services", servicesProperties);
		model.addAttribute("property", propertyDao.getProperty(id));
		model.addAttribute("images", imagesProperty);
		model.addAttribute("punctuations", punctuationDao.getPunctuations(id));		
		try{
			float average = punctuationDao.getPunctuationAverage(id);
			model.addAttribute("average", Math.round(average));
		} catch(NullPointerException e) {;}
		Integer popUpCounter = (Integer)session.getAttribute("counter");
		if(popUpCounter!=null){
			if(popUpCounter==0){
				popUpCounter++;
			   	session.setAttribute("counter", popUpCounter);
			}
			else{
				session.removeAttribute("counter");
				session.removeAttribute("message");
			}
		}
		return "property/info"; 
	}
	
	@RequestMapping(value="/info/{id}", method = RequestMethod.POST)
	public String bookProperty(@ModelAttribute("property") Property property, Model model, @PathVariable int id,  HttpSession session) {
		User userSession = (User)session.getAttribute("user");
		PopUpMessage message = new PopUpMessage();
		if (userSession == null) 
		{ 
			model.addAttribute("user", new User()); 
			session.setAttribute("nextURL", "property/info/" + id + ".html");
			return "login";
        }
		else if(!userSession.getRole().equals("Tenant")){
			message.setTitle("Error");
		    message.setMessage("No puedes alquilar una propiedad a no ser que est�s registrado como inquilino.");
		    session.setAttribute("message", message);
		    session.setAttribute("counter", 0);
			return "redirect:../../property/info/" + id + ".html";
		}
		boolean available = false;
		Date start = null;
		Date finish = null;
		if(property.getStartDate()!=null && !property.getStartDate().equals("") && property.getFinishDate()!=null && !property.getFinishDate().equals("")){
			List<Integer> propertiesIds = null;
			String []startDate = property.getStartDate().split("/");
			start = new java.sql.Date(Integer.parseInt(startDate[2])-1900,Integer.parseInt(startDate[1])-1,Integer.parseInt(startDate[0]));
			String []finishDate = property.getFinishDate().split("/");
			finish = new java.sql.Date(Integer.parseInt(finishDate[2])-1900,Integer.parseInt(finishDate[1])-1,Integer.parseInt(finishDate[0]));
			if(finish.compareTo(start)>0){
				propertiesIds = periodDao.getPropertiesIdPeriod(start.toString(), finish.toString());
			}
			if(propertiesIds!=null && propertiesIds.contains(id)){
				available = checkAvailability(reservationDao.getReservationsProperty(id), start, finish);
			}
		}
		if(!available){
			List<ServiceProperty> servicesProperties = servicePropertyDao.getServicesProperties();
			List<Service> services = serviceDao.getServices();
			List<Service> allServices = serviceDao.getServices();
			List<Period> periods= periodDao.getPeriods(id);
			List<Reservation> reservas = reservationDao.getReservationsProperty(id);
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
			message.setTitle("Hecho");
		    message.setMessage("Las fechas de la reserva no son v�lidas. Prueba con otras de las que permite el calendario.");
		    session.setAttribute("message", message);
		    session.setAttribute("counter", 0);
			return "property/info";
		}
		Reservation reservation = new Reservation();
		reservation.setTrackingNumber(reservationDao.generateTrackingNumber()+1);
		User user = (User)session.getAttribute("user");
		reservation.setUserNameTenant(user.getUsername());
		reservation.setIdProperty(id);
		reservation.setApplicationTimestamp(new java.sql.Date(new java.util.Date().getTime()).toString());
		reservation.setConfirmationTimestamp(null);
		reservation.setNumPeople(property.getNumPeople());
		reservation.setStartDate(start.toString());
		reservation.setFinishDate(finish.toString());
		reservation.setTotalAmount(((finish.getTime()-start.getTime())/MILLSECS_PER_DAY+1)*property.getDailyPrice());
		reservation.setStatus("pending");
		try{
			reservationDao.addReservation(reservation);
		}
		catch(Exception e){
			message.setTitle("Hecho");
		    message.setMessage("Tu reserva de " + reservation.getStartDate() + " a " + reservation.getStartDate() + " no ha podido registrarse. Por favor, prueba en otro momento.");
		    session.setAttribute("message", message);
		    session.setAttribute("counter", 0);
		    return "property/info";
		}
		message.setTitle("Hecho");
	    message.setMessage("Tu reserva de " + reservation.getStartDate() + " a " + reservation.getStartDate() + " se ha registrado. Se mostrar� como pendiente en tu perfil hasta que el due�o la acepte o la rechace. Si en 7 d�as no ha contestado se considerar� como rechazada.");
	    session.setAttribute("message", message);
	    session.setAttribute("counter", 0);
		return "redirect:../../user/profile.html";
	}
	
	private boolean checkAvailability(List<Reservation> reservationsProperty, Date start, Date finish) {
		for(Reservation res: reservationsProperty){
			String []startDate = res.getStartDate().split("-");
			Date startRes = new java.sql.Date(Integer.parseInt(startDate[0])-1900,Integer.parseInt(startDate[1])-1,Integer.parseInt(startDate[2]));
			String []finishDate = res.getFinishDate().split("-");
			Date finishRes = new java.sql.Date(Integer.parseInt(finishDate[0])-1900,Integer.parseInt(finishDate[1])-1,Integer.parseInt(finishDate[2]));
			if(start.compareTo(startRes)>=0 && start.compareTo(finishRes)<=0 || finish.compareTo(startRes)>=0 && finish.compareTo(finishRes)<=0 || start.compareTo(startRes)<=0 && finish.compareTo(finishRes)>=0){
				return false;
			}
		}
		return true;
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
		List<Property> properties = propertyDao.getPropertyFilter(filters);
		List<Property> activeProperties = new LinkedList<Property>();
		for(Property p: properties){
			if(userDao.getCredentials(p.getOwnerUsername()).getIsActive()){
				activeProperties.add(p);
			}
		}
		model.addAttribute("property", property);
		model.addAttribute("properties", activeProperties);
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
			Date start = new java.sql.Date(Integer.parseInt(startDate[2])-1900,Integer.parseInt(startDate[1])-1,Integer.parseInt(startDate[0]));
			String []finishDate = requirements.getFinishDate().split("/");
			Date finish = new java.sql.Date(Integer.parseInt(finishDate[2])-1900,Integer.parseInt(finishDate[1])-1,Integer.parseInt(finishDate[0]));
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
	
}
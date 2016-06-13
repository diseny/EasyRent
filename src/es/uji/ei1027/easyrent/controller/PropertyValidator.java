package es.uji.ei1027.easyrent.controller;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import es.uji.ei1027.easyrent.domain.Property;

public class PropertyValidator implements Validator{

	
	@Override
	public boolean supports(Class<?> cls) {
		return Property.class.equals(cls);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		Property prop= (Property) obj;
		if (prop.getOwnerUsername().trim().equals(""))
			errors.rejectValue("ownerUsername", "obligatorio","El nombre del usuario no puede estar vac�o.");
		if(prop.getTitle().trim().equals(""))
			errors.rejectValue("title", "obligatorio","El titulo es un campo obligatorio.");
		if(prop.getDescription().trim().equals(""))
			errors.rejectValue("description", "obligatorio","La descripción es un campo obligatorio.");
		if(prop.getStreet().trim().equals(""))
			errors.rejectValue("street", "obligatorio","La calle es un campo obligatorio.");
		if(prop.getCity().trim().equals(""))
			errors.rejectValue("city", "obligatorio","La ciudad  es un campo obligatorio.");
		if(prop.getFloor().trim().equals(""))
			errors.rejectValue("floor", "obligatorio","La planta  es un campo obligatorio.");
		
		if(prop.getCapacity()<1)
			errors.rejectValue("capacity", "obligatorio","La capacidad ha de ser mayor de 0.");
		if(prop.getNumRooms()<1)
			errors.rejectValue("numRooms", "obligatorio","El número de  habitaciones ha de ser mayor de 0.");
		if(prop.getNumBathrooms()<1)
			errors.rejectValue("numBathrooms", "obligatorio","El número de  baños ha de ser mayor de 0.");
		if(prop.getNumBeds()<1)
			errors.rejectValue("numBeds", "obligatorio","El número de  camas ha de ser mayor de 0.");
		
		if(prop.getSquareMeters()<1)
			errors.rejectValue("squareMeters", "obligatorio","El número de  metros cuadrados ha de ser mayor de 0.");
		if(prop.getNumber()<1)
			errors.rejectValue("number", "obligatorio","El número de  la calle ha de ser mayor de 0.");
		if(prop.getDailyPrice()<1)
			errors.rejectValue("dailyPrice", "obligatorio","El precio ha de ser mayor de 0.");
		
		
		
	}
}

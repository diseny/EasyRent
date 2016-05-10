package es.uji.ei1027.easyrent.controller;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import es.uji.ei1027.easyrent.domain.Owner;

public class OwnerValidator implements Validator {

	@Override
	public boolean supports(Class<?> cls) {
		return Owner.class.equals(cls);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		Owner owner = (Owner)obj;
		if (owner.getUsername().trim().equals(""))
			errors.rejectValue("username", "obligatorio","El username no puede estar vacío.");
		if (owner.getNationalId().trim().equals(""))
			errors.rejectValue("nationalId", "obligatorio","El ID no puede estar vacío.");
		if(owner.getName().trim().equals(""))
			errors.rejectValue("name", "obligatorio","El nombre es un campo obligatorio.");
		if(owner.getSurname().trim().equals(""))
			errors.rejectValue("surname", "obligatorio","El apellido es un campo obligatorio.");
		if(owner.getEmail().trim().equals(""))
			errors.rejectValue("email", "obligatorio","El correo es un campo obligatorio.");
		if(owner.getPostalAddress().trim().equals(""))
			errors.rejectValue("postalAddress", "obligatorio","El código postal es un campo obligatorio.");
		if(owner.getRegistrationDate().trim().equals(""))
			errors.rejectValue("registrationDate", "obligatorio","La fecha de registro es un campo obligatorio.");
		else{
			try{
				java.sql.Date.valueOf(owner.getRegistrationDate());
			} catch(Exception e){
				errors.rejectValue("registrationDate", "obligatorio","La fecha de registro debe ir en formato (yyyy-mm-dd).");
			}
		}
		if(owner.getPhoneNumber().trim().equals(""))
			errors.rejectValue("phoneNumber", "obligatorio","El teléfono es un campo obligatorio.");
	}

}

package es.uji.ei1027.easyrent.controller;

import java.util.HashSet;
import java.util.Set;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import es.uji.ei1027.easyrent.domain.Credentials;

public class CredentialsValidator implements Validator {

	@Override
	public boolean supports(Class<?> cls) {
		return Credentials.class.equals(cls);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		Credentials credentials = (Credentials)obj;
		Set<String> roles = new HashSet<String>();
		roles.add("Administrator");
		roles.add("Owner");
		roles.add("Tenant");
		if (credentials.getUsername().trim().equals(""))
			errors.rejectValue("username", "obligatorio","El username no puede estar vacío.");
		if (credentials.getPassword().trim().equals(""))
			errors.rejectValue("password", "obligatorio","La contraseña no puede estar vacía.");
		if(credentials.getRole().trim().equals(""))
			errors.rejectValue("role", "obligatorio","Por favor, rellene este campo (Administrator, Owner o Tenant).");
		else if(!roles.contains(credentials.getRole().trim())){
			errors.rejectValue("role", "obligatorio","Los roles válidos para este campo son Administrator, Owner o Tenant.");
		}
			
	}

}

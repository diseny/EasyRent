package es.uji.ei1027.easyrent.domain;

public class User {

	private String username;
	private String password;
	private String repeatedPassword;
	private String role;
	private String nationalId;
	private String name;
	private String surname;
	private String email;
	private String postalAddress;
	private String registrationDate;
	private String phoneNumber;
	private boolean isActive;
		
	public String getUsername() { 
		return username; 
	}
	
	public void setUsername(String username) { 
		this.username = username; 
	}
	
	public String getPassword() { 
		return password; 
	}
	
	public void setPassword(String password) { 
		this.password = password; 
	}
	
	public String getRepeatedPassword() { 
		return repeatedPassword; 
	}
	
	public void setRepeatedPassword(String repeatedPassword) { 
		this.repeatedPassword = repeatedPassword; 
	}
	
	public String getRole() { 
		return role; 
	}
	
	public void setRole(String role) { 
		this.role = role; 
	}
	
	public String getNationalId() { 
		return nationalId; 
	}
	
	public void setNationalId(String nationalId) { 
		this.nationalId = nationalId; 
	}
	
	public String getName() { 
		return name; 
	}
	
	public void setName(String name) { 
		this.name = name; 
	}
	
	public String getSurname() { 
		return surname; 
	}
	
	public void setSurname(String surname) { 
		this.surname = surname; 
	}
	
	public String getEmail() { 
		return email; 
	}
	
	public void setEmail(String email) { 
		this.email = email; 
	}
	
	public String getPostalAddress() { 
		return postalAddress; 
	}
	
	public void setPostalAddress(String postalAddress) { 
		this.postalAddress = postalAddress; 
	}

	public String getRegistrationDate() { 
		return registrationDate; 
	}
	
	public void setRegistrationDate(String registrationDate) { 
		this.registrationDate = registrationDate; 
	}
	
	public String getPhoneNumber() { 
		return phoneNumber; 
	}
	
	public void setPhoneNumber(String phoneNumber) { 
		this.phoneNumber = phoneNumber; 
	}

	public boolean getIsActive() { 
		return isActive; 
	}
	
	public void setIsActive(boolean isActive) { 
		this.isActive = isActive; 
	}

	@Override
	public String toString() {
		return "User: username '" + username + "', password '" + password + "', rol '" + role + "', nationalId '" + nationalId + "', name '" + name + "', surname '" + surname
				 + "', email '" + email + "', postalAddress '" + postalAddress + "', registrationDate '" + registrationDate
				 + "', phoneNumber '" + phoneNumber + "', isActive '" + isActive + "'.";
	}
	
}

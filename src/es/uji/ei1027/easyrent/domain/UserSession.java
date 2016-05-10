package es.uji.ei1027.easyrent.domain;

public interface UserSession {

	public String getUsername();
	public void setUsername(String username);
	public String getNationalId();
	public void setNationalId(String nationalId);
	public String getName();
	public void setName(String name);
	public String getSurname();
	public void setSurname(String surname);
	public String getEmail();
	public void setEmail(String email);
	public String getPostalAddress();
	public void setPostalAddress(String postalAddress);
	public String getRegistrationDate();
	public void setRegistrationDate(String registrationDate);
	public String getPhoneNumber();
	public void setPhoneNumber(String phoneNumber);
	public boolean getIsActive();
	public void setIsActive(boolean isActive); 

}

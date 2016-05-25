package es.uji.ei1027.easyrent.domain;

import java.sql.Date;

public class Reservation {

	private int trackingNumber;
	private String userNameTenant;
	private int idProperty;
	private String applicationTimestamp;
	private String confirmationTimestamp;
	private int numPeople;
	private String startDate;
	private String finishDate;
	private double totalAmount;
	private String status;
	private String ownerUsername;
	private String propertyTitle;
			
	public int getTrackingNumber() { 
		return trackingNumber; 
	}
	
	public void setTrackingNumber(int trackingNumber) {
		this.trackingNumber = trackingNumber; 
	}
	
	public String getApplicationTimestamp() { 
		return applicationTimestamp; 
	}
	
	public void setApplicationTimestamp(String applicationTimestamp) {
		this.applicationTimestamp = applicationTimestamp; 
	}
	
	public String getConfirmationTimestamp() { 
		return confirmationTimestamp; 
	}
	
	public void setConfirmationTimestamp(String confirmationTimestamp) { 
		this.confirmationTimestamp = confirmationTimestamp; 
	}
	
	public int getNumPeople() {
		return numPeople; 
	}
	
	public void setNumPeople(int numPeople) { 
		this.numPeople = numPeople; 
	}
	
	public String getStartDate() { 
		return startDate; 
	}
	
	public void setStartDate(String startDate) { 
		this.startDate = startDate; 
	}
	
	public String getFinishDate() { 
		return finishDate; 
	}
	
	public void setFinishDate(String finishDate) { 
		this.finishDate = finishDate; 
	}
	
	public double getTotalAmount() { 
		return totalAmount; 
	}
	
	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount; 
	}
	
	public String getStatus() { 
		return status; 
	}
	
	public void setStatus(String status) { 
		this.status = status; 
	}
	
	public String getUserNameTenant() { 
		return userNameTenant; 
	}
	
	public void setUserNameTenant(String userNameTenant) { 
		this.userNameTenant = userNameTenant; 
	}
	
	public int getIdProperty() { 
		return idProperty; 
	}
	
	public void setIdProperty(int idProperty) { 
		this.idProperty = idProperty; 
	}
	
	public String getOwnerUsername() { 
		return ownerUsername; 
	}
	
	public void setOwnerUsername(String ownerUsername) { 
		this.ownerUsername = ownerUsername; 
	}
	
	public String getPropertyTitle() { 
		return propertyTitle; 
	}
	
	public void setPropertyTitle(String propertyTitle) { 
		this.propertyTitle = propertyTitle; 
	}
	
	@Override
	public String toString() {
		return "Reservation: trackingNumber '" + trackingNumber + "', applicationTimestamp '" + applicationTimestamp + "', confirmationTimestamp '" + confirmationTimestamp +
				"', numPeople '" + numPeople + "', startDate '" + startDate + "', finishDate '" + finishDate + "', totalAmount '" + totalAmount + "', status '" + status + 
				"', userNameTenant '" + userNameTenant + "', idProperty '" + idProperty + "', owner '" + ownerUsername + "', propertyTitle '" + propertyTitle + "'.";
	} 
	
}

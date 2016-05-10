package es.uji.ei1027.easyrent.domain;

import java.sql.Date;

public class Reservation {

	private int trackingNumber;
	private String userNameTenant;
	private int idProperty;
	private Date applicationTimestamp;
	private Date confirmationTimestamp;
	private int numPeople;
	private Date startDate;
	private Date finishDate;
	private double totalAmount;
	private String status;
			
	public int getTrackingNumber() { 
		return trackingNumber; 
	}
	
	public void setTrackingNumber(int trackingNumber) {
		this.trackingNumber = trackingNumber; 
	}
	
	public Date getApplicationTimestamp() { 
		return applicationTimestamp; 
	}
	
	public void setApplicationTimestamp(Date applicationTimestamp) {
		this.applicationTimestamp = applicationTimestamp; 
	}
	
	public Date getConfirmationTimestamp() { 
		return confirmationTimestamp; 
	}
	
	public void setConfirmationTimestamp(Date confirmationTimestamp) { 
		this.confirmationTimestamp = confirmationTimestamp; 
	}
	
	public int getNumPeople() {
		return numPeople; 
	}
	
	public void setNumPeople(int numPeople) { 
		this.numPeople = numPeople; 
	}
	
	public Date getStartDate() { 
		return startDate; 
	}
	
	public void setStartDate(Date startDate) { 
		this.startDate = startDate; 
	}
	
	public Date getFinishDate() { 
		return finishDate; 
	}
	
	public void setFinishDate(Date finishDate) { 
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
		
	@Override
	public String toString() {
		return "Reservation: trackingNumber '" + trackingNumber + "', applicationTimestamp '" + applicationTimestamp + "', confirmationTimestamp '" + confirmationTimestamp +
				"', numPeople '" + numPeople + "', startDate '" + startDate + "', finishDate '" + finishDate + "', totalAmount '" + totalAmount + "', status '" + status + 
				"', userNameTenant '" + userNameTenant + "', idProperty '" + idProperty + "'.";
	} 
	
}

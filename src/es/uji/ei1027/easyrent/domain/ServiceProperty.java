package es.uji.ei1027.easyrent.domain;

public class ServiceProperty {

	private int propertyId;
	private int serviceId;
		
	public int getPropertyId() { 
		return propertyId; 
	}
	
	public void setPropertyId(int propertyId) { 
		this.propertyId = propertyId; 
	}
	
	public int getServiceId() { 
		return serviceId; 
	}
	
	public void setServiceId(int serviceId) { 
		this.serviceId = serviceId; 
	}
	
	@Override
	public String toString() {
		return "ServiceProperty: propertyId '" + propertyId + "', serviceId '" + serviceId + "'.";
	}
	
}

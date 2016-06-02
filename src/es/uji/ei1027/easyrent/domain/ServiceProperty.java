package es.uji.ei1027.easyrent.domain;

public class ServiceProperty {

	private int propertyId;
	private int serviceId;
	private String serviceName;
	
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
	
	public String getServiceName(){
		return serviceName;
	}
	
	public void setServiceName(String serviceName){
		this.serviceName = serviceName;
	}
	
	@Override
	public String toString() {
		return "ServiceProperty: propertyId '" + propertyId + "', serviceId '" + serviceId + "', serviceName '" + serviceName + "'.";
	}
	
}

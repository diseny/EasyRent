package es.uji.ei1027.easyrent.domain;

public class Service {

	private int id;
	private String name;
	private boolean propertyHas;
	
	public int getID(){
		return id;
	}
	
	public void setID(int id){
		this.id = id;
	}
	
	public String getName(){
		return name;
	}
	
	public void setName(String name){
		this.name = name;
	}
	
	public boolean getPropertyHas(){
		return propertyHas;
	}
	
	public void setPropertyHas(boolean propertyHas){
		this.propertyHas = propertyHas;
	}
	
	@Override
	public String toString(){
		return "Service: id '" + id + "', name '" + name + "'.";
	}
	
}

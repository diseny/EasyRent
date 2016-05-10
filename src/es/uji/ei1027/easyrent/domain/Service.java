package es.uji.ei1027.easyrent.domain;

public class Service {

	private int id;
	private String name;
	
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
	
	@Override
	public String toString(){
		return "Service: id '" + id + "', name '" + name + "'.";
	}
	
}

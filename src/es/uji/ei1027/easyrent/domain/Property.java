package es.uji.ei1027.easyrent.domain;

public class Property {

	private int id;
	private String ownerUsername;		
	private String title;
	private String description;
	private int capacity;
	private int numRooms;
	private int numBathrooms;
	private int numBeds;
	private int squareMeters;
	private String street;
	private int number;
	private String floor;
	private String city;
	private double dailyPrice;
	private boolean isActive;

	public int getId() { 
		return id; 
	}
	
	public void setId(int id) { 
		this.id = id; 
	}
	
	public String getOwnerUsername() {	
		return ownerUsername;	
	}
	
	public void setOwnerUsername(String ownerUsername) {
		this.ownerUsername = ownerUsername;	
	}
	
	public String getTitle() {	
		return title;	
	}
	
	public void setTitle(String title) {
		this.title = title;	
	}
	
	public String getDescription() {
		return description;	
	}
	
	public void setDescription(String description) {
		this.description = description;	
	}
	
	public int getCapacity() {
		return capacity; 
	}
	
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	
	public int getNumRooms() {
		return numRooms;
	}
	
	public void setNumRooms(int numRooms) {
		this.numRooms = numRooms;
	}
	
	public int getNumBathrooms() {	
		return numBathrooms;	
	}
	
	public void setNumBathrooms(int numBathrooms) {	
		this.numBathrooms = numBathrooms;	
	}
	
	public int getNumBeds() {
		return numBeds;	
	}
	
	public void setNumBeds(int numBeds) {
		this.numBeds = numBeds;	
	}
	
	public int getSquareMeters() {
		return squareMeters;
	}
	
	public void setSquareMeters(int squareMeters) {	
		this.squareMeters = squareMeters;
	}
	
	public String getStreet() {	
		return street;	
	}
	
	public void setStreet(String street) {
		this.street = street;
	}
	
	public int getNumber() {
		return number;	
	}
	
	public void setNumber(int number) {	
		this.number = number;
	}
	
	public String getFloor() {
		return floor;
	}
	
	public void setFloor(String floor) {
		this.floor = floor;	
	}
	
	public String getCity() {
		return city;
	}
	
	public void setCity(String city) {	
		this.city = city;	
	}
	
	public double getDailyPrice() {	
		return dailyPrice;
	}

	public void setDailyPrice(double dailyPrice) {	
		this.dailyPrice = dailyPrice;
	}

	public boolean isActive() {
		return isActive;
	}
	
	public void setIsActive(boolean isActive) {	
		this.isActive = isActive;
	}
	
	@Override
	public String toString() {
		return "Property: id '" + id + "', ownerUsername '" + ownerUsername + "', title '"
				+ title + "', description '" + description + "', capacity '"
				+ capacity + "', numRooms '" + numRooms + "', numBathrooms '" + numBathrooms + "', numBeds '"
				+ numBeds + "', squareMeters '" + squareMeters + "', street '" + street + "', number '"
				+ number + "', floor '" + floor + "', city '" + city + "', dailyPrice '" + dailyPrice + "', isActive '"
				+ isActive + "'.";
	}
	
}

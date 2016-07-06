package es.uji.ei1027.easyrent.domain;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

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
	private String validated;
	private String startDate;
	private String finishDate;
	private int numPeople;
	private int piscina;
	private int balcon;
	private int jacuzzi;
	private int parque;
	private int jardin;
	private int wifi;
	private int television;
	private int gimnasio;
	private int cocina;
	private int periodId;
	private String start;
	private String finish;
	private String caption;
	private String href;
	private CommonsMultipartFile fichero;

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

	public boolean getIsActive() {
		return isActive;
	}
	
	public void setIsActive(boolean isActive) {	
		this.isActive = isActive;
	}
	
	public String getValidated() {
		return validated;
	}
	
	public void setValidated(String validated) {	
		this.validated = validated;
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

	public int getNumPeople() {
		return numPeople;
	}
	
	public void setNumPeople(int numPeople) {	
		this.numPeople = numPeople;
	}
	
	public CommonsMultipartFile getFichero() { 
		return fichero; 
	}
	
	public void setFichero(CommonsMultipartFile fichero) { 
		this.fichero = fichero; 
	}
	
	public int getPeriodId(){
		return periodId;
	}
	
	public void setPeriodId(int periodId){
		this.periodId = periodId;
	}

	public String getStart(){
		return start;
	}

	public void setStart(String start){
		this.start = start;
	}
	
	public String getFinish(){
		return finish;
	}

	public void setFinish(String finish){
		this.finish = finish;
	}

	public void setPiscina(int piscina) {
		this.piscina = piscina;
	}
	public int getPiscina() { 
		return piscina; 
	
	}

	public int getBalcon() {
		return balcon;
	}

	public void setBalcon(int balcon) {
		this.balcon = balcon;
	}

	public int getJacuzzi() {
		return jacuzzi;
	}

	public void setJacuzzi(int jacuzzi) {
		this.jacuzzi = jacuzzi;
	}

	public int getParque() {
		return parque;
	}

	public void setParque(int parque) {
		this.parque = parque;
	}

	public int getJardin() {
		return jardin;
	}

	public void setJardin(int jardin) {
		this.jardin = jardin;
	}

	public int getWifi() {
		return wifi;
	}

	public void setWifi(int wifi) {
		this.wifi = wifi;
	}

	public int getTelevision() {
		return television;
	}

	public void setTelevision(int television) {
		this.television = television;
	}

	public int getGimnasio() {
		return gimnasio;
	}

	public void setGimnasio(int gimnasio) {
		this.gimnasio = gimnasio;
	}

	public int getCocina() {
		return cocina;
	}

	public void setCocina(int cocina) {
		this.cocina = cocina;
	}

	public String getCaption() {
		return caption;
	}

	public void setCaption(String caption) {
		this.caption = caption;
	}

	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}
	
	@Override
	public String toString() {
		return "Property: id '" + id + "', ownerUsername '" + ownerUsername + "', title '"
				+ title + "', description '" + description + "', capacity '"
				+ capacity + "', numRooms '" + numRooms + "', numBathrooms '" + numBathrooms + "', numBeds '"
				+ numBeds + "', squareMeters '" + squareMeters + "', street '" + street + "', number '"
				+ number + "', floor '" + floor + "', city '" + city + "', dailyPrice '" + dailyPrice + "', isActive '"
				+ isActive + "', start '" + startDate + "', finish '" + finishDate + "', people '" + numPeople + "'.";
	}
	
}

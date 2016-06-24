package es.uji.ei1027.easyrent.domain;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class AddProperty {

	private int propertyId;
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
	public int getPropertyId() { 
		return propertyId; 
	}
	
	public void setPropertyId(int propertyId) { 
		this.propertyId = propertyId; 
	}
	
	
	
	@Override
	public String toString() {
		return "ServiceProperty a completar ";
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
}

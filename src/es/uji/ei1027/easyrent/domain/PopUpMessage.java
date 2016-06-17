package es.uji.ei1027.easyrent.domain;

public class PopUpMessage {

	private String title;
	private String message;
	
	public void setTitle(String title){
		this.title = title;
	}
	
	public String getTitle(){
		return title;
	}
	
	public void setMessage(String message){
		this.message = message;
	}
	
	public String getMessage(){
		return message;
	}
	
	public String toString(){
		return "Title: " + title + ", message: " + message + ".";
	}
	
}

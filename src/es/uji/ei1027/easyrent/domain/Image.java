package es.uji.ei1027.easyrent.domain;

public class Image {

	private int id;
	private String caption;
	private String href;
	
	public int getID(){
		return id;
	}
	
	public void setID(int id){
		this.id = id;
	}
	
	public String getCaption(){
		return caption;
	}
	
	public void setCaption(String caption){
		this.caption = caption;
	}
	
	public String getHref(){
		return href;
	}
	
	public void setHref(String href){
		this.href = href;
	}
	
	@Override
	public String toString(){
		return "Image: id '" + id + "', caption '" + caption + "', href '" + href + "'.";
	}
	
}

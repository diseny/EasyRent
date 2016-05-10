package es.uji.ei1027.easyrent.domain;

public class Punctuation {

	private String username;
	private int propertyId;
	private int punctuation;
	private String comments;
		
	public String getUsername() { 
		return username; 
	}
	
	public void setUsername(String username) { 
		this.username = username; 
	}
	
	public int getPropertyId() { 
		return propertyId; 
	}
	
	public void setPropertyId(int propertyId) { 
		this.propertyId = propertyId; 
	}
	
	public int getPunctuation() { 
		return punctuation; 
	}
	
	public void setPunctuation(int punctuation) { 
		this.punctuation = punctuation; 
	}
	
	public String getComments() { 
		return comments; 
	}
	
	public void setComments(String comments) { 
		this.comments = comments; 
	}
	
	@Override
	public String toString() {
		return "Punctuation: username '" + username + "', propertyId '" + propertyId
				 + "', punctuation '" + punctuation + "', comments '" + comments + "'.";
	}
	
}

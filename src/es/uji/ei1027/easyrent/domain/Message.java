package es.uji.ei1027.easyrent.domain;

public class Message {

	private int id;
	private String transmitter;
	private String receiver;
	private boolean answered;
	private String message;
	
	public int getId() { 
		return id; 
	}
	
	public void setId(int id) { 
		this.id = id; 
	}
	
	public String getTransmitter() { 
		return transmitter; 
	}
	
	public void setTransmitter(String transmitter) { 
		this.transmitter = transmitter; 
	}
	
	public String getReceiver() { 
		return receiver; 
	}
	
	public void setReceiver(String receiver) { 
		this.receiver = receiver;
	}

	public String getMessage() { 
		return message; 
	}
	
	public void setMessage(String message) { 
		this.message = message; 
	}
	
	public boolean getAnswered() { 
		return answered;
	}
	
	public void setAnswered(boolean answered) { 
		this.answered = answered;
	}
	
	@Override
	public String toString() {
		return "Message: id '" + id + "', transmitter '" + transmitter + "', receiver '" + receiver + "', answered '" + answered + "', message '" + message + "'.";
	}
	
}


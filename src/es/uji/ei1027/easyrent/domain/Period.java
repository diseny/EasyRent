package es.uji.ei1027.easyrent.domain;

import java.sql.Date;

public class Period {

	private int propertyId;
	private int periodId;
	private String start;
	private String finish;
	
	public int getPropertyId(){
		return propertyId;
	}
	
	public void setPropertyId(int propertyId){
		this.propertyId = propertyId;
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
	
	@Override
	public String toString(){
		return "Period: propertyId '" + propertyId + "', periodId '" + periodId + "', start '" + start+ "', finish '" + finish + "'.";
	}
	
}

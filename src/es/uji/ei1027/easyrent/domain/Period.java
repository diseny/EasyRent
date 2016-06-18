package es.uji.ei1027.easyrent.domain;

import java.sql.Date;

public class Period {

	private int propertyId;
	private int periodId;
	private Date start;
	private Date finish;
	
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

	public Date getStart(){
		return start;
	}

	public void setStart(Date start){
		this.start = start;
	}
	
	public Date getFinish(){
		return finish;
	}

	public void setFinish(Date finish){
		this.finish = finish;
	}
	
	@Override
	public String toString(){
		return "Period: propertyId '" + propertyId + "', periodId '" + periodId + "', start '" + start+ "', finish '" + finish + "'.";
	}
	
}

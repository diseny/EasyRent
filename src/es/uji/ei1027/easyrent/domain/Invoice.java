package es.uji.ei1027.easyrent.domain;

import java.sql.Date;

public class Invoice {

	private int trackingNumber;
	private int invoiceNumber;
	private String invoiceDate;
	private double vat;
	private double vatIncrease;
	private double total;

	public int getTrackingNumber() { 
		return trackingNumber; 
	}
	
	public void setTrackingNumber(int trackingNumber) { 
		this.trackingNumber = trackingNumber; 
	}
		
	public int getInvoiceNumber() { 
		return invoiceNumber;
	}
	
	public void setInvoiceNumber(int invoiceNumber) {
		this.invoiceNumber = invoiceNumber;
	}
	
	public String getInvoiceDate() { 
		return invoiceDate; 
	}
	
	public void setInvoiceDate(String invoiceDate) { 
		this.invoiceDate = invoiceDate; 
	}
		
	public double getVat() { 
		return vat; 
	}
	
	public void setVat(double vat) { 
		this.vat = vat; 
	}
	
	public double getVatIncrease() { 
		return vatIncrease; 
	}
	
	public void setVatIncrease(double vatIncrease) { 
		this.vatIncrease = vatIncrease; 
	}
	
	public double getTotal() { 
		return total; 
	}
	
	public void setTotal(double total) { 
		this.total = total; 
	}
	
	@Override
	public String toString() {
		return "Factura: trackingNumber '" + trackingNumber + "', invoiceNumber '" + invoiceNumber + "', invoiceDate '" + invoiceDate +
				"', vat '" + vat + "'.";
	} 

}

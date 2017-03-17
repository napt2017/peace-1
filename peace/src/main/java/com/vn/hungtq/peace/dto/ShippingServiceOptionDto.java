package com.vn.hungtq.peace.dto;

import com.ebay.soap.eBLBaseComponents.CurrencyCodeType;
import com.ebay.soap.eBLBaseComponents.ShippingServiceCodeType;

public class ShippingServiceOptionDto {
	private String shippingMethodType;
	private double shippingServiceCost;
	private double shippingServiceAddtionalCost;
	private double shippingInsuranceCost;
	private String currency= "USD";
	
	
	public ShippingServiceOptionDto(){} 
	
	public ShippingServiceOptionDto(String shippingMethodType,
			double shippingServiceCost, double shippingServiceAddtionalCost,
			double shippingInsuranceCost ) {
		super();
		this.shippingMethodType = shippingMethodType;
		this.shippingServiceCost = shippingServiceCost;
		this.shippingServiceAddtionalCost = shippingServiceAddtionalCost;
		this.shippingInsuranceCost = shippingInsuranceCost; 
	}

	public String getShippingMethodType() {
		return shippingMethodType;
	}
	
	public void setShippingMethodType(String shippingMethodType) {
		this.shippingMethodType = shippingMethodType;
	}
	
	public double getShippingServiceCost() {
		return shippingServiceCost;
	}
	
	public void setShippingServiceCost(double shippingServiceCost) {
		this.shippingServiceCost = shippingServiceCost;
	}
	
	public double getShippingServiceAddtionalCost() {
		return shippingServiceAddtionalCost;
	}
	
	public void setShippingServiceAddtionalCost(double shippingServiceAddtionalCost) {
		this.shippingServiceAddtionalCost = shippingServiceAddtionalCost;
	}
	
	public double getShippingInsuranceCost() {
		return shippingInsuranceCost;
	}
	
	public void setShippingInsuranceCost(double shippingInsuranceCost) {
		this.shippingInsuranceCost = shippingInsuranceCost;
	} 
	
	public CurrencyCodeType getCurrencyCodeType(){
		return CurrencyCodeType.fromValue(this.currency);
	}	
	
	public ShippingServiceCodeType getShippingServiceCodeType(){
		return ShippingServiceCodeType.fromValue(this.shippingMethodType);
	}
}

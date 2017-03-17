package com.vn.hungtq.peace.dto;

import com.ebay.soap.eBLBaseComponents.CurrencyCodeType;
import com.ebay.soap.eBLBaseComponents.InsuranceOptionCodeType;
import com.ebay.soap.eBLBaseComponents.ShippingTypeCodeType;
import java.util.List;

public class ShippingDetailDto {
	private double isuranceFee;
	private String currencyId ="USD";
	private String isuranceOption;
	private String paymentInstruction;
	private String shippingType;
	private List<ShippingServiceOptionDto> listOfShippingServiceOption;
	
	public double getIsuranceFee() {
		return isuranceFee;
	}
	public void setIsuranceFee(double isuranceFee) {
		this.isuranceFee = isuranceFee;
	}
	public String getCurrencyId() {
		return currencyId;
	}
	public void setCurrencyId(String currencyId) {
		this.currencyId = currencyId;
	}
	public String getIsuranceOption() {
		return isuranceOption;
	}
	public void setIsuranceOption(String isuranceOption) {
		this.isuranceOption = isuranceOption;
	}
	public String getPaymentInstruction() {
		return paymentInstruction;
	}
	public void setPaymentInstruction(String paymentInstruction) {
		this.paymentInstruction = paymentInstruction;
	}
	public String getShippingType() {
		return shippingType;
	}
	public void setShippingType(String shippingType) {
		this.shippingType = shippingType;
	}
	
	public InsuranceOptionCodeType getIsuranceOptionCodeType(){
		return InsuranceOptionCodeType.fromValue(this.isuranceOption);
	} 
	
	public ShippingTypeCodeType getShippingCodeType(){
		return ShippingTypeCodeType.fromValue(this.shippingType);
	}
	
	public CurrencyCodeType getCurrencyCodeType(){
		return CurrencyCodeType.fromValue(this.currencyId);
	}
	public List<ShippingServiceOptionDto> getListOfShippingServiceOption() {
		return listOfShippingServiceOption;
	}
	public void setListOfShippingServiceOption(
			List<ShippingServiceOptionDto> listOfShippingServiceOption) {
		this.listOfShippingServiceOption = listOfShippingServiceOption;
	} 
}

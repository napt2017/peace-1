package com.vn.hungtq.peace.dto;

import com.vn.hungtq.peace.entity.ItemInfomation;

public class ItemInfomationDto {
	private int itemId;
	private String payment;
	private String termsOfSale;
	private String aboutUs;
	private String internationalBuyersNote;
	
	public String getPayment() {
		return payment;
	}
	
	public void setPayment(String payment) {
		this.payment = payment;
	}
	
	public String getTermsOfSale() {
		return termsOfSale;
	}
	
	public void setTermsOfSale(String termsOfSale) {
		this.termsOfSale = termsOfSale;
	}
	
	public String getAboutUs() {
		return aboutUs;
	}
	
	public void setAboutUs(String aboutUs) {
		this.aboutUs = aboutUs;
	}
	
	public String getInternationalBuyersNote() {
		return internationalBuyersNote;
	}
	
	public void setInternationalBuyersNote(String internationalBuyersNote) {
		this.internationalBuyersNote = internationalBuyersNote;
	}

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	} 
	
	public ItemInfomationDto withDefaultId(){
		this.itemId = -1;
		return this;
	}
	
	public ItemInfomationDto copyFrom(ItemInfomation itemInfomation){
		this.itemId = itemInfomation.getId();
		this.aboutUs= itemInfomation.getAboutUs();
		this.internationalBuyersNote = itemInfomation.getInternationalBuyerNote();
		this.payment = itemInfomation.getPayment();
		this.termsOfSale = itemInfomation.getTermsOfSale();
		return this;
	}
}

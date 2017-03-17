package com.vn.hungtq.peace.dto;

import com.ebay.soap.eBLBaseComponents.CountryCodeType;
import com.ebay.soap.eBLBaseComponents.CurrencyCodeType;

public class EbayItemDto {
	private String title;            
	private String description;     
	private String currency ="USD"; 
	private String country ="US";
	private Integer quantity; 
	private String location ="San Jose";
	private String listingDuration;
	private String categoryId;  
	private double startPrice;  
	private double reservePrice;
	private double buyNowPrice;
	private boolean isBestOfferEnable = false;
	private boolean hasSecondaryCategory = false;
	private String secondaryCategoryId;
	private Integer conditionId;	 
	private String paypalEmail;  
	
	private ReturnPolicyDto returnPolicyDto;
	private ShippingDetailDto shippingDetailDto;
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	} 
	
	public CurrencyCodeType getCurrencyCodeType(){
		return CurrencyCodeType.fromValue(this.currency);
	}
	
	public CountryCodeType getCountryCodeType(){
		return CountryCodeType.fromValue(this.country);
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getListingDuration() { 
		return listingDuration;
	}

	public void setListingDuration(String listingDuration) {
		this.listingDuration = listingDuration;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public double getStartPrice() {
		return startPrice;
	}

	public void setStartPrice(double startPrice) {
		this.startPrice = startPrice;
	}

	public double getReservePrice() {
		return reservePrice;
	}

	public void setReservePrice(double reservePrice) {
		this.reservePrice = reservePrice;
	}

	public double getBuyNowPrice() {
		return buyNowPrice;
	}

	public void setBuyNowPrice(double buyNowPrice) {
		this.buyNowPrice = buyNowPrice;
	}

	public boolean isBestOfferEnable() {
		return isBestOfferEnable;
	}

	public void setBestOfferEnable(boolean isBestOfferEnable) {
		this.isBestOfferEnable = isBestOfferEnable;
	}

	public boolean isHasSecondaryCategory() {
		return hasSecondaryCategory;
	}

	public void setHasSecondaryCategory(boolean hasSecondaryCategory) {
		this.hasSecondaryCategory = hasSecondaryCategory;
	}

	public String getSecondaryCategoryId() {
		return secondaryCategoryId;
	}

	public void setSecondaryCategoryId(String secondaryCategoryId) {
		this.secondaryCategoryId = secondaryCategoryId;
	}
	
	public String getApplicationData(){
		return "AppData_"+System.currentTimeMillis();
	}

	public Integer getConditionId() {
		return conditionId;
	}

	public void setConditionId(Integer conditionId) {
		this.conditionId = conditionId;
	}

	public String getPaypalEmail() {
		return paypalEmail;
	}

	public void setPaypalEmail(String paypalEmail) {
		this.paypalEmail = paypalEmail;
	}

	public ReturnPolicyDto getReturnPolicyDto() {
		return returnPolicyDto;
	}

	public void setReturnPolicyDto(ReturnPolicyDto returnPolicyDto) {
		this.returnPolicyDto = returnPolicyDto;
	}

	public ShippingDetailDto getShippingDetailDto() {
		return shippingDetailDto;
	}

	public void setShippingDetailDto(ShippingDetailDto shippingDetailDto) {
		this.shippingDetailDto = shippingDetailDto;
	}  
	
	
}

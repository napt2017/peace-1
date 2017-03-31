package com.vn.hungtq.peace.dto;

import java.util.List;

import com.ebay.soap.eBLBaseComponents.NameValueListType;


public class EbayItemDto {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String title;
	private String categoryId;	
	private String conditionID; 	
	private String description; 
	private String upc; 
	private String timePeriod; 
	private String country; 
	private String imageUrl; 
	private String imageDescription;
	private String youtubeUrl; 
	private String radListingType; 
	private String startPrice; 
	private String buyItNow; 
	private String duration; 
	private Boolean isScheduleDate; 
	private Boolean isFreeShip; 

	private String sku; 
	private Boolean isPrivateListing; 
	private String stockUrl;
	private List<NameValueListType> nameValueListTypes;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	public String getConditionID() {
		return conditionID;
	}
	public void setConditionID(String conditionID) {
		this.conditionID = conditionID;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getUpc() {
		return upc;
	}
	public void setUpc(String upc) {
		this.upc = upc;
	}
	public String getTimePeriod() {
		return timePeriod;
	}
	public void setTimePeriod(String timePeriod) {
		this.timePeriod = timePeriod;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public String getImageDescription() {
		return imageDescription;
	}
	public void setImageDescription(String imageDescription) {
		this.imageDescription = imageDescription;
	}
	public String getYoutubeUrl() {
		return youtubeUrl;
	}
	public void setYoutubeUrl(String youtubeUrl) {
		this.youtubeUrl = youtubeUrl;
	}
	public String getRadListingType() {
		return radListingType;
	}
	public void setRadListingType(String radListingType) {
		this.radListingType = radListingType;
	}
	public String getStartPrice() {
		return startPrice;
	}
	public void setStartPrice(String startPrice) {
		this.startPrice = startPrice;
	}
	public String getBuyItNow() {
		return buyItNow;
	}
	public void setBuyItNow(String buyItNow) {
		this.buyItNow = buyItNow;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public Boolean getIsScheduleDate() {
		return isScheduleDate;
	}
	public void setIsScheduleDate(Boolean isScheduleDate) {
		this.isScheduleDate = isScheduleDate;
	}
	public Boolean getIsFreeShip() {
		return isFreeShip;
	}
	public void setIsFreeShip(Boolean isFreeShip) {
		this.isFreeShip = isFreeShip;
	}
	public String getSku() {
		return sku;
	}
	public void setSku(String sku) {
		this.sku = sku;
	}
	public Boolean getIsPrivateListing() {
		return isPrivateListing;
	}
	public void setIsPrivateListing(Boolean isPrivateListing) {
		this.isPrivateListing = isPrivateListing;
	}
	public String getStockUrl() {
		return stockUrl;
	}
	public void setStockUrl(String stockUrl) {
		this.stockUrl = stockUrl;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public List<NameValueListType> getNameValueListTypes() {
		return nameValueListTypes;
	}
	public void setNameValueListTypes(List<NameValueListType> nameValueListTypes) {
		this.nameValueListTypes = nameValueListTypes;
	}


}

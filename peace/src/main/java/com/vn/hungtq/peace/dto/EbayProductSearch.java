package com.vn.hungtq.peace.dto;

public class EbayProductSearch {
	private String title;
	private String endTime;
	private String listPrice;
	private String currency;
	private String purchaser;
	private String edit;
	private String end;
	private String reListing;
	private String error; 
	
	public EbayProductSearch(String title, String endTime, String listPrice,
			String currency, String purchaser, String edit, String end,
			String reListing, String error) {
		super();
		this.title = title;
		this.endTime = endTime;
		this.listPrice = listPrice;
		this.currency = currency;
		this.purchaser = purchaser;
		this.edit = edit;
		this.end = end;
		this.reListing = reListing;
		this.error = error;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getListPrice() {
		return listPrice;
	}
	public void setListPrice(String listPrice) {
		this.listPrice = listPrice;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public String getPurchaser() {
		return purchaser;
	}
	public void setPurchaser(String purchaser) {
		this.purchaser = purchaser;
	}
	public String getEdit() {
		return edit;
	}
	public void setEdit(String edit) {
		this.edit = edit;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getReListing() {
		return reListing;
	}
	public void setReListing(String reListing) {
		this.reListing = reListing;
	}
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	} 
}

package com.vn.hungtq.peace.common;

public class StockRegistorItem {
	private int id;
	private String storeName;
	private String productName;
	private String vendorURL;
	private Double buyPrice;
	private Integer logicCheck;
	private Double stock;
	private String note;
	private String stockWord;
	private Boolean isSelected;
	
	public StockRegistorItem(){} 
	
	
	public StockRegistorItem(int id, String storeName, String productName,
			String vendorURL, Double buyPrice, Integer logicCheck, Double stock,
			String note,String stockWord) {
		super();
		this.id = id;
		this.storeName = storeName;
		this.productName = productName;
		this.vendorURL = vendorURL;
		this.buyPrice = buyPrice;
		this.logicCheck = logicCheck;
		this.stock = stock;
		this.note = note;
		this.stockWord = stockWord;
	}  

	public Boolean getIsSelected() {
		return isSelected;
	}


	public void setIsSelected(Boolean isSelected) {
		this.isSelected = isSelected;
	}


	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getStoreName() {
		return storeName;
	}
	
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	
	public String getProductName() {
		return productName;
	}
	
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	public String getVendorURL() {
		return vendorURL;
	}
	
	public void setVendorURL(String vendorURL) {
		this.vendorURL = vendorURL;
	}
	
	public Double getBuyPrice() {
		return buyPrice;
	}
	
	public void setBuyPrice(Double buyPrice) {
		this.buyPrice = buyPrice;
	}
	
	public Integer getLogicCheck() {
		return logicCheck;
	}
	
	public void setLogicCheck(Integer logicCheck) {
		this.logicCheck = logicCheck;
	}
	
	public Double getStock() {
		return stock;
	}
	
	public void setStock(Double stock) {
		this.stock = stock;
	}
	
	public String getNote() {
		return note;
	}
	
	public void setNote(String note) {
		this.note = note;
	} 

	public String getStockWord() {
		return stockWord;
	} 

	public void setStockWord(String stockWord) {
		this.stockWord = stockWord;
	}  
}

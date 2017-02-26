package com.vn.hungtq.peace.common;

public class ProductSearch {
	private String image;
	private String productName;
	private String price;
	private String stock;
	private String exhibition;
	
	public String getImage() {
		return image;
	}
	
	public void setImage(String image) {
		this.image = image;
	}
	
	public String getProductName() {
		return productName;
	}
	
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	public String getPrice() {
		return price;
	}
	
	public void setPrice(String price) {
		this.price = price;
	}
	
	public String getStock() {
		return stock;
	}
	
	public void setStock(String stock) {
		this.stock = stock;
	}
	
	public String getExhibition() {
		return exhibition;
	}
	
	public void setExhibition(String exhibition) {
		this.exhibition = exhibition;
	}
	
	public ProductSearch(String image, String productName, String price,
			String stock, String exhibition) {
		super();
		this.image = image;
		this.productName = productName;
		this.price = price;
		this.stock = stock;
		this.exhibition = exhibition;
	} 
}

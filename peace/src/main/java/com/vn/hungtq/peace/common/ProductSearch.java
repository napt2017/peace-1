package com.vn.hungtq.peace.common;

public class ProductSearch {
	private String image;
	private String productName;
	private String price;
	private String stock;
	private String exhibition;
	private String searchSite;
	private String itemId;
	
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

	public String getSearchSite() {
		return searchSite;
	}

	public void setSearchSite(String searchSite) {
		this.searchSite = searchSite;
	}

	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}

	public ProductSearch(String image, String productName, String price,
						 String stock, String exhibition, String searchSite,String itemId) {
		super();
		this.image = image;
		this.productName = productName;
		this.price = price;
		this.stock = stock;
		this.exhibition = exhibition;
		this.searchSite = searchSite;
		this.itemId = itemId;
	} 
}

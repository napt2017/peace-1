package com.vn.hungtq.peace.dto;

public class EbayCategory {
	private int id;
	private int parentId;
	private String name;
	private int categoryLevel;
	private Boolean isBestOfferEnable;
	private Boolean isAutoPayEnable; 
	private Boolean leafCategory;
	
	public EbayCategory(int id, int parentId, String name, int categoryLevel,
			boolean isBestOfferEnable, boolean isAutoPayEnable, boolean leafCategory) {
		super();
		this.id = id;
		this.parentId = parentId;
		this.name = name;
		this.categoryLevel = categoryLevel;
		this.isBestOfferEnable = isBestOfferEnable;
		this.isAutoPayEnable = isAutoPayEnable;
		this.leafCategory = leafCategory;
	}

	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public int getParentId() {
		return parentId;
	}
	
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public int getCategoryLevel() {
		return categoryLevel;
	}
	
	public void setCategoryLevel(int categoryLevel) {
		this.categoryLevel = categoryLevel;
	}
	
	public boolean isBestOfferEnable() {
		return isBestOfferEnable;
	}
	
	public void setBestOfferEnable(boolean isBestOfferEnable) {
		this.isBestOfferEnable = isBestOfferEnable;
	}
	
	public boolean isAutoPayEnable() {
		return isAutoPayEnable;
	}
	
	public void setAutoPayEnable(boolean isAutoPayEnable) {
		this.isAutoPayEnable = isAutoPayEnable;
	} 
	public Boolean getLeafCategory() {
		return leafCategory;
	}

	public void setLeafCategory(Boolean leafCategory) {
		this.leafCategory = leafCategory;
	}
}

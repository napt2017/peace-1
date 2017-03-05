package com.vn.hungtq.peace.dto;

import java.util.List;

public class EbayShippingAreaDto {
	private int areaId;
	private String areaName;
	private int orderBy;
	private List<EbayShippingMethodDto> lstEbayShippingMethods;
	
	public String getAreaName() {
		return areaName;
	}
	
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	
	public List<EbayShippingMethodDto> getLstEbayShippingMethods() {
		return lstEbayShippingMethods;
	}
	
	public void setLstEbayShippingMethods(List<EbayShippingMethodDto> lstEbayShippingMethods) {
		this.lstEbayShippingMethods = lstEbayShippingMethods;
	}

	public int getAreaId() {
		return areaId;
	}

	public void setAreaId(int areaId) {
		this.areaId = areaId;
	}

	public int getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(int orderBy) {
		this.orderBy = orderBy;
	}  
}

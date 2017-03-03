package com.vn.hungtq.peace.dto;

import java.util.List;

public class EbayShippingAreaDto {
	private String areaName;
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
}

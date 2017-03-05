package com.vn.hungtq.peace.dto;
import java.util.List;

public class AreaSettingInfoDto { 
	private String shippingMethodName; 
	private Boolean isChoice; 
	private List<AreaTimeUnitMappingDto> listOfAreaTimeUnitMapping; 
	
	public String getShippingMethodName() {
		return shippingMethodName;
	}
	
	public void setShippingMethodName(String shippingMethodName) {
		this.shippingMethodName = shippingMethodName;
	}
	
	public Boolean getIsChoice() {
		return isChoice;
	}
	
	public void setIsChoice(Boolean isChoice) {
		this.isChoice = isChoice;
	}
	
	public List<AreaTimeUnitMappingDto> getListOfAreaTimeUnitMapping() {
		return listOfAreaTimeUnitMapping;
	}
	
	public void setListOfAreaTimeUnitMapping(
			List<AreaTimeUnitMappingDto> listOfAreaTimeUnitMapping) {
		this.listOfAreaTimeUnitMapping = listOfAreaTimeUnitMapping;
	} 
}

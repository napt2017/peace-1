package com.vn.hungtq.peace.dto;

public class AreaTimeUnitMappingDto {
	private int recordId;
	private String timeShipping;
	private int valueOfAskFreeAndNoShipping;
	private String moneyName;
	private String placeHolder;
	private String areaName;
	private int timeUnitMappingId;
	
	public String getTimeShipping() {
		return timeShipping;
	}
	
	public void setTimeShipping(String timeShipping) {
		this.timeShipping = timeShipping;
	}  
	
	public int getValueOfAskFreeAndNoShipping() {
		return valueOfAskFreeAndNoShipping;
	}

	public void setValueOfAskFreeAndNoShipping(int valueOfAskFreeAndNoShipping) {
		this.valueOfAskFreeAndNoShipping = valueOfAskFreeAndNoShipping;
	}

	public String getMoneyName() {
		return moneyName;
	}
	
	public void setMoneyName(String moneyName) {
		this.moneyName = moneyName;
	}
	
	public String getPlaceHolder() {
		return placeHolder;
	}
	
	public void setPlaceHolder(String placeHolder) {
		this.placeHolder = placeHolder;
	}

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public int getRecordId() {
		return recordId;
	}

	public void setRecordId(int recordId) {
		this.recordId = recordId;
	}

	public int getTimeUnitMappingId() {
		return timeUnitMappingId;
	}

	public void setTimeUnitMappingId(int timeUnitMappingId) {
		this.timeUnitMappingId = timeUnitMappingId;
	}   
}

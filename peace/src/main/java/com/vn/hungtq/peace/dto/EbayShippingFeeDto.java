package com.vn.hungtq.peace.dto;

import java.util.List;

public class EbayShippingFeeDto {
	private int layoutAreaId; 
	private int numberOfDayToShip;
	private List<ShippingAreaWithMethodDto> listAreaWithMethod;
	 
	
	public int getNumberOfDayToShip() {
		return numberOfDayToShip;
	}
	
	public void setNumberOfDayToShip(int numberOfDayToShip) {
		this.numberOfDayToShip = numberOfDayToShip;
	}

	public int getLayoutAreaId() {
		return layoutAreaId;
	}

	public void setLayoutAreaId(int layoutAreaId) {
		this.layoutAreaId = layoutAreaId;
	}

	public List<ShippingAreaWithMethodDto> getListAreaWithMethod() {
		return listAreaWithMethod;
	}

	public void setListAreaWithMethod(
			List<ShippingAreaWithMethodDto> listAreaWithMethod) {
		this.listAreaWithMethod = listAreaWithMethod;
	}  
} 
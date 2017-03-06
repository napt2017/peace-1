package com.vn.hungtq.peace.dto;

public class ShippingAreaWithMethodDto {
	private int areaId;
	private int methodId;
	
	public ShippingAreaWithMethodDto(){} 
	
	public ShippingAreaWithMethodDto(int areaId, int methodId) {
		super();
		this.areaId = areaId;
		this.methodId = methodId;
	} 

	public int getAreaId() {
		return areaId;
	}
	
	public void setAreaId(int areaId) {
		this.areaId = areaId;
	}
	
	public int getMethodId() {
		return methodId;
	}
	
	public void setMethodId(int methodId) {
		this.methodId = methodId;
	}
}

package com.vn.hungtq.peace.dto;

public class EbayDeliveryMethodDto {
	private int returnWarrantyMethodId;
	private String shippingDetail;
	private int usShippingMethodId;
	private int otherAreaShippingMethodId;
	
	public int getReturnWarrantyMethodId() {
		return returnWarrantyMethodId;
	}
	
	public void setReturnWarrantyMethodId(int returnWarrantyMethodId) {
		this.returnWarrantyMethodId = returnWarrantyMethodId;
	}
	
	public String getShippingDetail() {
		return shippingDetail;
	}
	
	public void setShippingDetail(String shippingDetail) {
		this.shippingDetail = shippingDetail;
	}
	
	public int getUsShippingMethodId() {
		return usShippingMethodId;
	}
	
	public void setUsShippingMethodId(int usShippingMethodId) {
		this.usShippingMethodId = usShippingMethodId;
	}
	
	public int getOtherAreaShippingMethodId() {
		return otherAreaShippingMethodId;
	}
	
	public void setOtherAreaShippingMethodId(int otherAreaShippingMethodId) {
		this.otherAreaShippingMethodId = otherAreaShippingMethodId;
	}
}

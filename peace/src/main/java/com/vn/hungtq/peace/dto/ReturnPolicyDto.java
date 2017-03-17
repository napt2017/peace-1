package com.vn.hungtq.peace.dto;

public class ReturnPolicyDto {
	private String refund;
	private String returnsWithinOption;
	private String returnsAcceptedOption;
	private String shippingCostPaidByOption;
	
	public String getRefund() {
		return refund;
	}
	public void setRefund(String refund) {
		this.refund = refund;
	}
	public String getReturnsWithinOption() {
		return returnsWithinOption;
	}
	public void setReturnsWithinOption(String returnsWithinOption) {
		this.returnsWithinOption = returnsWithinOption;
	}
	public String getReturnsAcceptedOption() {
		return returnsAcceptedOption;
	}
	public void setReturnsAcceptedOption(String returnsAcceptedOption) {
		this.returnsAcceptedOption = returnsAcceptedOption;
	}
	public String getShippingCostPaidByOption() {
		return shippingCostPaidByOption;
	}
	public void setShippingCostPaidByOption(String shippingCostPaidByOption) {
		this.shippingCostPaidByOption = shippingCostPaidByOption;
	} 
}

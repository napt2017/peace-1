package com.vn.hungtq.peace.dto;

public class AccountSettingDto {
	private int userId;
	private int id;
	private String email;
	private Boolean isDeliver;
	private String amazonAccessKey;
	private String amazonSecretKey;
	private String amazoneId;
	private String paypalEmail;
	private Boolean isImmediateStettlement; 
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getUserId() {
		return userId;
	}
	
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	public Boolean getIsDeliver() {
		return isDeliver;
	}
	
	public void setIsDeliver(Boolean isDeliver) {
		this.isDeliver = isDeliver;
	}
	
	public String getAmazonAccessKey() {
		return amazonAccessKey;
	}
	
	public void setAmazonAccessKey(String amazonAccessKey) {
		this.amazonAccessKey = amazonAccessKey;
	}
	
	public String getAmazonSecretKey() {
		return amazonSecretKey;
	}
	
	public void setAmazonSecretKey(String amazonSecretKey) {
		this.amazonSecretKey = amazonSecretKey;
	}
	
	public String getAmazoneId() {
		return amazoneId;
	}
	
	public void setAmazoneId(String amazoneId) {
		this.amazoneId = amazoneId;
	}
	
	public String getPaypalEmail() {
		return paypalEmail;
	}
	
	public void setPaypalEmail(String paypalEmail) {
		this.paypalEmail = paypalEmail;
	}
	
	public Boolean getIsImmediateStettlement() {
		return isImmediateStettlement;
	}
	
	public void setIsImmediateStettlement(Boolean isImmediateStettlement) {
		this.isImmediateStettlement = isImmediateStettlement;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	} 
}

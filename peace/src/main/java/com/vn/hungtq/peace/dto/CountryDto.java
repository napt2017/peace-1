package com.vn.hungtq.peace.dto;

public class CountryDto {
	private int id;
	private Boolean isSelected;
	private String name;
	private int userId;
	
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public Boolean isSelected() {
		return isSelected;
	}
	
	public void setSelected(Boolean isSelected) {
		this.isSelected = isSelected;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	} 
}
package com.vn.hungtq.peace.dto;

import java.util.List;
import java.util.Map;

public class CountryGroupDto {
	private List<CountryDto> lstCountries;
	private String name;
	private int id;
	private String href;
	
	public List<CountryDto> getLstCountries() {
		return lstCountries;
	}

	public void setLstCountries(List<CountryDto> lstCountries) {
		this.lstCountries = lstCountries;
	}

	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
		this.href = "#"+name;
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}

	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		if(!href.startsWith("#")){
			href = "#"+href;
		}
		this.href = href;
	} 
}

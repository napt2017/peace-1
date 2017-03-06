package com.vn.hungtq.peace.dto;

import java.util.List;

public class AreaSettingTableDto {
	private List<String> lstColumnHeader;
	private List<AreaSettingInfoDto> lstAreaSettingDto;
	
	public List<String> getLstColumnHeader() {
		return lstColumnHeader;
	}
	public void setLstColumnHeader(List<String> lstColumnHeader) {
		this.lstColumnHeader = lstColumnHeader;
	}
	
	public List<AreaSettingInfoDto> getLstAreaSettingDto() {
		return lstAreaSettingDto;
	}
	
	public void setLstAreaSettingDto(List<AreaSettingInfoDto> lstAreaSettingDto) {
		this.lstAreaSettingDto = lstAreaSettingDto;
	} 
}

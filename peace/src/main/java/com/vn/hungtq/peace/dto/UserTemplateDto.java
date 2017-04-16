package com.vn.hungtq.peace.dto;

public class UserTemplateDto {
	private String title;
	private String htmlCode;
	private String base64StringImage;
	private int index;
	private int templateId;
	private boolean isDefault;
	
	public UserTemplateDto(){} 
	
	public UserTemplateDto(String title, String htmlCode,
			String base64StringImage) {
		super();
		this.title = title;
		this.htmlCode = htmlCode;
		this.base64StringImage = base64StringImage;
	} 

	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getHtmlCode() {
		return htmlCode;
	}
	
	public void setHtmlCode(String htmlCode) {
		this.htmlCode = htmlCode;
	}
	
	public String getBase64StringImage() {
		return base64StringImage;
	}
	
	public void setBase64StringImage(String base64StringImage) {
		this.base64StringImage = base64StringImage;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public int getTemplateId() {
		return templateId;
	}

	public void setTemplateId(int templateId) {
		this.templateId = templateId;
	}

	public boolean isDefault() {
		return isDefault;
	}

	public void setDefault(boolean aDefault) {
		isDefault = aDefault;
	}
}

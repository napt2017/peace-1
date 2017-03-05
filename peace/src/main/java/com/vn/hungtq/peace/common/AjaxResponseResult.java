package com.vn.hungtq.peace.common;

public class AjaxResponseResult<T> {
	private String status;
	private String cause;
	private int recordId;
	private T extraData;
	private String msg;
	
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getCause() {
		return cause;
	}
	
	public void setCause(String cause) {
		this.cause = cause;
	}
	
	public int getRecordId() {
		return recordId;
	}
	
	public void setRecordId(int recordId) {
		this.recordId = recordId;
	} 
	
	public void setExtraData(T extraData){
		this.extraData = extraData;
	}
	
	public T getExtraData(){
		return this.extraData;
	}
} 
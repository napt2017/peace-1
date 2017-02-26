package com.vn.hungtq.peace.common;  

import java.text.MessageFormat;

public class GmailConfiguration {  
	
	private String smptPort; 
	private String smtpHost; 
	private String socketFactoryPort; 
	private String isSmptAuth; 
	private String socketFactoryClass; 
	private String startttlsEnable; 
	
	public String getSmtpHost() {
		return smtpHost;
	} 

	public String isStartttlsEnable() {
		return startttlsEnable;
	} 

	public String getSocketFactoryPort() {
		return socketFactoryPort;
	} 

	public String getSocketFactoryClass() {
		return socketFactoryClass;
	} 

	public String isSmptAuth() {
		return isSmptAuth;
	} 

	public String getSmptPort() {
		return smptPort;
	}

	public void setSmtpHost(String smtpHost) {
		this.smtpHost = smtpHost;
	}

	public void setStartttlsEnable(String startttlsEnable) {
		this.startttlsEnable = startttlsEnable;
	}

	public void setSocketFactoryPort(String socketFactoryPort) {
		this.socketFactoryPort = socketFactoryPort;
	}

	public void setSocketFactoryClass(String socketFactoryClass) {
		this.socketFactoryClass = socketFactoryClass;
	}

	public void setSmptAuth(String isSmptAuth) {
		this.isSmptAuth = isSmptAuth;
	}

	public void setSmptPort(String smptPort) {
		this.smptPort = smptPort;
	}
	
	@Override
	public String toString() {
		return MessageFormat.format("smptPort [{0}],smtpHost [{1}],socketFactoryPort [{2}],isSmptAuth [{3}],socketFactoryClass [{4}],startttlsEnable [{5}]",this.smptPort,
									this.smtpHost,this.socketFactoryPort,this.isSmptAuth,this.socketFactoryClass,this.startttlsEnable);
	}
}

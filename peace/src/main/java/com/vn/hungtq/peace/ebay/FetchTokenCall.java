package com.vn.hungtq.peace.ebay;

import java.io.ByteArrayInputStream;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;

import com.vn.hungtq.peace.common.EbayServiceInfo;

public class FetchTokenCall {

	private static Logger logger = LoggerFactory
			.getLogger(FetchTokenCall.class);

	EbayServiceInfo ebayServiceInfo;

	private String usertoken;
	private String tokenExpirationTime;
	private String longErrorMessage;
	private boolean isProduction;

	public FetchTokenCall(boolean isProduction, EbayServiceInfo ebayServiceInfo) {
		this.ebayServiceInfo = ebayServiceInfo;
		this.isProduction = isProduction;
	}

	/**
	 * Send FetchToken request
	 * 
	 * @param sessionID
	 *            String <br>
	 * @return The Document object.
	 */
	public Document sendRequest(String sessionID) {
		logger.info("Entering in FetchTokenCall.sendRequest for sessionID="
				+ sessionID);
		try {
			// make the API request
			String verb = "FetchToken";
			byte[] bytes = new String(fetchTokenRequestXML()).getBytes();
			ByteArrayInputStream bin = new ByteArrayInputStream(bytes);

			DocumentBuilderFactory factory = DocumentBuilderFactory
					.newInstance();
			DocumentBuilder docBuild = factory.newDocumentBuilder();
			// File getAccountFile = new File("./ebay.dts.FetchToken.xml");
			// Document req = docBuild.parse(getAccountFile);
			Document req = docBuild.parse(bin);
			req.getElementsByTagName("SessionID").item(0)
					.setTextContent(sessionID);
			System.out.println("sessionID in request"
					+ req.getElementsByTagName("SessionID").item(0)
							.getTextContent());

			TradingAPIConnection tradingAPIConnection = new TradingAPIConnection(ebayServiceInfo);
			
			Document response = tradingAPIConnection.sendApiXMPPostCall(
					isProduction, req, verb);
			return response;
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 *
	 * @param response
	 *            Document
	 */
	public void getUserTokenString(Document response) {
		logger.info("Entering in FetchTokenCall.getUserTokenString .....");

		if (response != null) {
			NodeList ackNodes = response.getElementsByTagName("Ack");
			String ack = ackNodes.item(0).getTextContent();
			if (ack.compareTo("Failure") == 0) {
				NodeList longErrorNode = response
						.getElementsByTagName("LongMessage");
				this.longErrorMessage = "RequestError: "
						+ longErrorNode.item(0).getTextContent();
			} else {
				NodeList bufferNodes = response
						.getElementsByTagName("eBayAuthToken");
				this.usertoken = bufferNodes.item(0).getTextContent();
				NodeList expirNode2 = response
						.getElementsByTagName("HardExpirationTime");
				this.tokenExpirationTime = expirNode2.item(0).getTextContent();
				logger.info("FetchTokenCall.retrieveToken ===>   user token="
						+ usertoken);
				logger.info("FetchTokenCall.retrieveToken ===> ExpirationTime ="
						+ tokenExpirationTime);
			}
		}

	}

	private String fetchTokenRequestXML() {
		StringBuffer request = new StringBuffer(
				"<?xml version=\"1.0\" encoding=\"utf-8\"?>");
		request.append("<FetchTokenRequest xmlns=\"urn:ebay:apis:eBLBaseComponents\">");
		request.append(" <SessionID>MNO</SessionID>");
		request.append("</FetchTokenRequest>");
		return request.toString();
	}

	public String getUsertoken() {
		return usertoken;
	}

	public void setUsertoken(String usertoken) {
		this.usertoken = usertoken;
	}

	public String getTokenExpirationTime() {
		return tokenExpirationTime;
	}

	public void setTokenExpirationTime(String tokenExpirationTime) {
		this.tokenExpirationTime = tokenExpirationTime;
	}

	public String getLongErrorMessage() {
		return longErrorMessage;
	}

	public void setLongErrorMessage(String longErrorMessage) {
		this.longErrorMessage = longErrorMessage;
	}
}

package com.vn.hungtq.peace.ebay;

import java.io.StringReader;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.vn.hungtq.peace.common.EbayServiceInfo;

@Service
@Scope("session")
public class GetSessionIDCall {
	private static Logger logger = LoggerFactory.getLogger(GetSessionIDCall.class);

	private EbayServiceInfo ebayServiceInformation; 
    private String rawSessionID=null;

    private boolean isProduction;
    private String longErrorMessage=null;

    public String getLongErrorMessage() {
        return longErrorMessage;
    }

    public GetSessionIDCall() {
    }

    public GetSessionIDCall(boolean isProduction, EbayServiceInfo ebayServiceInformation) {
        this.isProduction = isProduction;
        this.ebayServiceInformation = ebayServiceInformation;
    }

   /**
    * Send GetSessionID request
    * @param runame String
    * <br>
    * @return The Document object.
   */
    public Document sendRequest(String runame) {
        logger.info("Entering GetSessionIDCall.sendRequest runame=" + runame);
        try {
        	String verb = "GetSessionID";
        	InputSource is = new InputSource();
            is.setCharacterStream(new StringReader(getSessionIDRequestXML()));
            
            DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
            DocumentBuilder db = dbf.newDocumentBuilder();
            
            Document req = db.parse(is);
            req.getElementsByTagName("RuName").item(0).setTextContent(runame);
            TradingAPIConnection tradingAPIConnection = new TradingAPIConnection(getEbayServiceInformation());
            Document response = tradingAPIConnection.sendApiXMPPostCall(isProduction, req, verb);
            return response;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

   /**
    *
    * @param response Document
    */
    public void getSessionIDString(Document response) throws Exception{

        logger.info("Entering in GetSessionIDCall.getSessionIDString .....");
        if (response != null) {
            NodeList ackNodes = response.getElementsByTagName("Ack");
            String ack = ackNodes.item(0).getTextContent();
            if (ack.compareTo("Failure") == 0) {
                NodeList longErrorNode = response.getElementsByTagName("LongMessage");
                this.longErrorMessage = "RequestError: " + longErrorNode.item(0).getTextContent();

            } else {
                NodeList bufferNodes = response.getElementsByTagName("SessionID");
                rawSessionID= bufferNodes.item(0).getTextContent();
                logger.info("GetSessionIDCall.getSessionIDString ===> getRawSessionID = "
                        + rawSessionID);   
            }
        }else {
            logger.info("nothing returned  .....");

        }
    }

      /**
    *
    * @param response Document
    */
    public String getRowSessionIDString(Document response) throws Exception{

        logger.info("Entering in GetSessionIDCall.getSessionIDString .....");
        String getRawSessionID="";
        if (response != null) {
            NodeList ackNodes = response.getElementsByTagName("Ack");
            String ack = ackNodes.item(0).getTextContent();
            if (ack.compareTo("Failure") == 0) {
                NodeList longErrorNode = response.getElementsByTagName("LongMessage");
                this.longErrorMessage = "RequestError: " + longErrorNode.item(0).getTextContent();

            } else {
                NodeList bufferNodes = response.getElementsByTagName("SessionID");
                getRawSessionID = bufferNodes.item(0).getTextContent();
                logger.info("GetSessionIDCall.getSessionIDString ===> getRawSessionID = "
                        + getRawSessionID);

              //  this.sessionID = URLEncoder.encode(bufferNodes.item(0).getTextContent(),"UTF-8");
              //  logger.info("GetSessionIDCall.getSessionIDString ===> sessionID = "
              //          + sessionID);

            }
        }else {
            logger.info("nothing returned  .....");

        }
        return getRawSessionID;
    }
     private String getSessionIDRequestXML() {
        StringBuffer request = new StringBuffer("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
        request.append("<GetSessionIDRequest xmlns=\"urn:ebay:apis:eBLBaseComponents\">");
        request.append("<RuName>MNO</RuName>");
        request.append("</GetSessionIDRequest>");
        return request.toString();
    }
     public String getRawSessionID() {
         return rawSessionID;
     }
     
	   public EbayServiceInfo getEbayServiceInformation() {
			return ebayServiceInformation;
		}

		public void setEbayServiceInformation(EbayServiceInfo ebayServiceInformation) {
			this.ebayServiceInformation = ebayServiceInformation;
		}

}

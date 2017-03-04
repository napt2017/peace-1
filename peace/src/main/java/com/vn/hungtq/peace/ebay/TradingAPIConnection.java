package com.vn.hungtq.peace.ebay;

import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.w3c.dom.Document;

import com.vn.hungtq.peace.common.EbayServiceInfo;

@Controller
@Scope("session")
public class TradingAPIConnection {
    private static Logger logger = LoggerFactory.getLogger(TradingAPIConnection.class);
    
    public TradingAPIConnection(EbayServiceInfo ebayServiceInformation) {
    	this.ebayServiceInformation = ebayServiceInformation;
    }
    
	private EbayServiceInfo ebayServiceInformation; 
	

/**
    * use HTTPURLConnecton to post a XML request document
    * to eBay trading API server
    * 
    * @param isProduction boolan
    * @param apiRequest Document
    * @param callName String
    * @param appID String
    * @param devID String
    * @param cert String
    */
    public Document sendApiXMPPostCall(boolean isProduction,Document apiRequest, String callName) {
        logger.info("DeveloperAPI.sendHTTPSApiCall apiCall.getDocumentURI()"
                + apiRequest.getNamespaceURI()
                + ";; callName="
                + callName + ";"  +ebayServiceInformation.getCertid());
        
        // Ebay SBX
        String apiServerURL=ebayServiceInformation.getSandboxServerURL();
        String appId = ebayServiceInformation.getAppidSBX();
        String devid = ebayServiceInformation.getDevidSBX();
        String certid = ebayServiceInformation.getCertidSBX();
        
        if (isProduction){
        	// Ebay PROD
            apiServerURL = ebayServiceInformation.getProdServerURL();
            appId = ebayServiceInformation.getAppid();
            devid = ebayServiceInformation.getDevid();
            certid = ebayServiceInformation.getCertid();
        }
        try {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder docBuild = factory.newDocumentBuilder();
            logger.info(callName+".sendHTTPSApiCall ==>  : apiServerURL="
                    + apiServerURL);
            URL url = new URL(apiServerURL);

            HttpURLConnection connect;

            connect = (HttpURLConnection) url.openConnection();
            connect.setConnectTimeout(10000);
			setHTTPHeaders(connect, callName, appId, devid, certid);
            connect.setDoInput(true);
            connect.setDoOutput(true);
            connect.setRequestMethod("POST");

            Document response;
            TransformerFactory tf = TransformerFactory.newInstance();
            Transformer tr = tf.newTransformer();
            OutputStream out = connect.getOutputStream();
            Source input = new DOMSource(apiRequest);
            Result output = new StreamResult(out);
            tr.transform(input, output);
            out.flush();
            out.close();
            InputStream in = connect.getInputStream();
            response = docBuild.parse(in);

            return response;
        } catch (MalformedURLException urle) {
            urle.printStackTrace();
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

   /**
    *
    * @param connection URLConnection
    * @param callName String
    * @param appID String
    * @param devID String
    * @param cert String
    */
     private void setHTTPHeaders(URLConnection connection,
            String callName,String appID, String devID, String cert) {
        connection.addRequestProperty("X-EBAY-API-COMPATIBILITY-LEVEL",
                compatLevel);
        // Add the Developer Name, Application Name, and Certification Name
        // Headers
        connection.addRequestProperty("X-EBAY-API-DEV-NAME", devID);
        connection.addRequestProperty("X-EBAY-API-APP-NAME", appID);
        connection.addRequestProperty("X-EBAY-API-CERT-NAME", cert);
        // Add the API verb Header
        connection.addRequestProperty("X-EBAY-API-CALL-NAME", callName);
        // Add the Site Id Header
        connection.addRequestProperty("X-EBAY-API-SITEID", siteID);
        // Add the Content-Type Header
        connection.addRequestProperty("Content-Type", "text/xml");
    }
    public static String
            compatLevel = "667",
            siteID = "0";
    

    public EbayServiceInfo getEbayServiceInformation() {
 		return ebayServiceInformation;
 	}

 	public void setEbayServiceInformation(EbayServiceInfo ebayServiceInformation) {
 		this.ebayServiceInformation = ebayServiceInformation;
 	}
}

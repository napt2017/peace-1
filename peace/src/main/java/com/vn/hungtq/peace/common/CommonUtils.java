package com.vn.hungtq.peace.common;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.text.DateFormat;
import java.text.MessageFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.SortedMap;
import java.util.TimeZone;
import java.util.TreeMap;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.apache.commons.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.context.annotation.Bean;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.util.UriUtils;

import com.ebay.sdk.ApiContext;
import com.ebay.sdk.ApiCredential;
import com.ebay.sdk.call.GetCategoriesCall;
import com.ebay.soap.eBLBaseComponents.CategoryType;
import com.ebay.soap.eBLBaseComponents.DetailLevelCodeType;
import com.ebay.soap.eBLBaseComponents.ItemType;
import com.ebay.soap.eBLBaseComponents.SiteCodeType;
import com.vn.hungtq.peace.dto.EbayCategory;
import com.vn.hungtq.peace.dto.EbayProductSearch;
import com.vn.hungtq.peace.dto.ItemInfomationDto;
import com.vn.hungtq.peace.dto.UserDto;
import com.vn.hungtq.peace.dto.UserTemplateDto;
import com.vn.hungtq.peace.entity.Contact;
import com.vn.hungtq.peace.entity.User;
import com.vn.hungtq.peace.entity.UserTemplate;
import com.vn.hungtq.peace.service.UserDaoService;

/**
 * 
 * The CommonUtils class
 * Provide common util function for all module
 * 
 * @author napt2017  
 * 
 * **/
public class CommonUtils {  
	
	private static final Logger logger = LoggerFactory.getLogger(CommonUtils.class);
	private static final PasswordEncoder  bCryptPasswordEncoder= new BCryptPasswordEncoder();
	
	/**
	 * 
	 *  The buildMessgeContent method <br>
	 *  Build the content for contact email 
	 *  follow the contact as paramter
	 *  
	 *  @param  contact
	 *  @throws UnsupportedEncodingException
	 *  @return String 
	 *  @author napt2017 
	 * 
	 * 
	 * **/
	private static String buildMessageContent(Contact contact) throws UnsupportedEncodingException{
		StringBuilder sb = new StringBuilder();
		
		sb.append("<p>Hi Admin,</p>")
		.append("<p>My name is {0}. </p> ")
		.append("<p>Email: {1}. </p> ")
		.append("<p>Tel: {2}. </p> ")
		.append("<p>{3} </p>")
		.append("<p>{4} </p>")
		.append("<p>Thanks,Best Regard.</p>");
		
		return MessageFormat.format(sb.toString(), UriUtils.decode(contact.getName(),"UTF-8"),UriUtils.decode(contact.getEmail(),"UTF-8"),
									contact.getPhone(),UriUtils.decode(contact.getExhibitionCategory(),"UTF-8"),
									UriUtils.decode(contact.getDescribeContent(),"UTF-8"));
	}
	
	public static boolean isSameHash(String rawPassword,String hash){  
		return bCryptPasswordEncoder.matches(rawPassword, hash);
	} 
	
	public static String encryptPassword(String rawPassword){
		return bCryptPasswordEncoder.encode(rawPassword);
	}
	
	/**
	 * 
	 *  The sendEmailContact method
	 *  Send contact email to user follow the parameter
	 *  
	 *  @param addressTo 
	 *  @param subject
	 *  @param content
	 *  @param peaceContactEmail
	 *  @param gmailConfiguration
	 *  
	 *  @author napt2017
	 *  @return Tuple<Boolean,String>  
	 * 
	 * **/
	public static Tuple<Boolean,String> sendEmailContact(String subject,Contact contact,
														final PeaceContactEmail peaceContactEmail,
														final GmailConfiguration gmailConfiguration ){
		
		//Configuration properties
		logger.debug(gmailConfiguration.toString());
		
		Properties props = new Properties();
		props.put("mail.smtp.host",gmailConfiguration.getSmtpHost());
		props.put("mail.smtp.starttls.enable", gmailConfiguration.isStartttlsEnable());
		props.put("mail.smtp.socketFactory.port", gmailConfiguration.getSocketFactoryPort());
		props.put("mail.smtp.socketFactory.class",gmailConfiguration.getSocketFactoryClass());
		props.put("mail.smtp.auth", gmailConfiguration.isSmptAuth());
		props.put("mail.smtp.port",gmailConfiguration.getSmptPort()); 
		
		//Session login
		logger.debug("Start authentication....");
		logger.debug("UserName:"+peaceContactEmail.getEmail());
		logger.debug("PassWord:"+peaceContactEmail.getPassword());
		
		Session session = Session.getInstance(props, new javax.mail.Authenticator(){
				protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(peaceContactEmail.getEmail(),peaceContactEmail.getPassword());
				}
		});
		logger.debug("End authentication...");
		
		//Send email
		Message message = new MimeMessage(session);
		try{
				//Set from address
				message.setFrom(new InternetAddress(peaceContactEmail.getEmail()));
				
				//Set to address
				message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(contact.getEmail()));
				
				//Set subject
				message.setSubject(subject);
				message.setSentDate(new Date()); 
				
				//Multipart message
				Multipart	multiPart		= new MimeMultipart();
				
				//Set content for message
				message.setContent(multiPart);
				
				//Body part
				BodyPart 	bodyPart	    = null;
				
				//Set text content
				bodyPart	= new MimeBodyPart();  
				multiPart.addBodyPart(bodyPart); 
				message.setContent(CommonUtils.buildMessageContent(contact),"text/html");
				
				Transport.send(message,message.getAllRecipients()); 
				return Tuple.make(true, "Send email success!!!");
		}
		catch (MessagingException | UnsupportedEncodingException e){
				logger.debug("Exception when send contact email", e);
				return Tuple.make(false, e.getMessage());
		} 
	} 
	
	public static UserDto getUserFromSession(org.springframework.security.core.userdetails.User userSSO, UserDaoService userService){
		UserDto userDto = new UserDto();
		
		// Get user from db
		User user = userService.findBySSO(userSSO.getUsername());
		
		if (user != null) {
			
			BeanUtils.copyProperties(user, userDto);
		}
		return userDto;
	}
	
	public static Tuple<Boolean,String> tryToValidateItemInfomation(ItemInfomationDto itemInfomation){
		//Implement later
		return Tuple.make(true, "OK");
	}
	
	public static Tuple<Boolean,String> tryToValidateUserTemplate(UserTemplateDto userTemplate){
		//Implement later
		return Tuple.make(true, "Vaild!!!");
	}
	
	public static byte[] convertStringByteArray(String rawString){
		if(rawString!=null){
			return rawString.getBytes();
		}
		return new byte[0];
	}
	
	public static ApiContext getApiContext(String authToken,EbayServiceInfo ebayServiceInfo){
		String soapUrl;
		if("prod".equals(ebayServiceInfo.getEnvironment())){
			soapUrl = ebayServiceInfo.getProdApiUrl();
		}else{
			soapUrl = ebayServiceInfo.getSandboxApiUrl();
		}
		
		ApiContext apiContext = new ApiContext();
		ApiCredential apiCred = apiContext.getApiCredential();
		apiCred.seteBayToken(authToken);
		apiContext.setApiServerUrl(soapUrl);
		apiContext.setSite(SiteCodeType.US);
		return apiContext;		
	}
	
	public static List<UserTemplateDto> convertToUserTemplateDto(List<UserTemplate> lstOfUserTemplate){
		List<UserTemplateDto> lstUserTemplateDto = new ArrayList<UserTemplateDto>(lstOfUserTemplate.size());
		int index = 0;
		for(UserTemplate userTemplate:lstOfUserTemplate){
			UserTemplateDto userTemplateDto = new UserTemplateDto();
			userTemplateDto.setTitle(userTemplate.getTitle());
			userTemplateDto.setHtmlCode(userTemplate.getHtmlCode());
			userTemplateDto.setBase64StringImage(new String(userTemplate.getImage()));
			userTemplateDto.setIndex(index++);
			userTemplateDto.setTemplateId(userTemplate.getId());
			
			lstUserTemplateDto.add(userTemplateDto);
		}
		
		return lstUserTemplateDto;
	}
	
	public static boolean getBooleanValue(Boolean bVal){
		return bVal!=null?bVal.booleanValue():false;
	}
	
	public static String buildQuestionMark(int length){
		if(length<=0){
			throw new IllegalArgumentException("Length must be greater than zero! Expected value :"+length);
		}
		
		StringBuilder sb = new StringBuilder("(");
		int stop = length-1;
		for(int loop = 0;loop<length;loop++){
			sb.append("?").append(loop==stop?"":",");
		}
		sb.append(")");
		return sb.toString();
	}
	
	/**
	 * 
	 *  The getHTMLContent method 
	 *  Send HttpRequest to webserver then get response 
	 *  as text plain which contain html ,css,javascript code of webpage
	 *  @param 	url
	 *  @author napt2017
	 *  @return String 
	 * 
	 * **/
	public static String getHTMLContent(String url) {
		if (!"".equals(url) && url != null) {
			try {
				URL _url = new URL(url);
				URLConnection cnn = _url.openConnection();
				HttpURLConnection httpUrlConnection = (HttpURLConnection) cnn;
				cnn.addRequestProperty(
						"User-Agent",
						"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36");
				httpUrlConnection.setRequestMethod("GET");
				httpUrlConnection.setDoInput(true);
				httpUrlConnection.setDoOutput(true);

				try (final InputStream in = cnn.getInputStream();
					 final InputStreamReader inRead = new InputStreamReader(in,"UTF-8");
					 final BufferedReader bRead = new BufferedReader(inRead)) {
					StringBuilder sb = new StringBuilder();
					String line;
					while ((line = bRead.readLine()) != null) {
						sb.append(line);
					}
					return sb.toString();
				}
			} catch (MalformedURLException ex) {
				logger.debug("Get html content error with cause :"+ex.getMessage());
			} catch (IOException ex) {
				logger.debug("Get html content error with cause :"+ex.getMessage());
			}  
		}

		return "";
	}
	
	public static List<EbayProductSearch> convertToEbayProductSearch(ItemType [] itemTypes){
		if(itemTypes!=null && itemTypes.length>0){
			List<EbayProductSearch> lstEbayProductSearch = new ArrayList<EbayProductSearch>(itemTypes.length);
			for(ItemType it: itemTypes){
				String title = it.getTitle();
				String currency = it.getCurrency().name();
				String endTime = it.getTimeLeft().toString();
				String listPrice = "__FixLatter";
				String purchaser = it.getPartnerName();
				String edit= it.getEBayNotes();
				String end = "__FixLatter";
				String reListing = "__FixLatter";
				String error = "__FixLatter";
				
				EbayProductSearch ebayProductSearch = new EbayProductSearch(title, endTime, listPrice, currency, purchaser, edit, end, reListing, error);
				lstEbayProductSearch.add(ebayProductSearch);
			}
			return lstEbayProductSearch;
		}
		return Collections.emptyList();
	}
	
	public static Tuple<Boolean,String> tryToValidateContactModel(Contact contact){
		return Tuple.make(true, "Ok");
	}
	
	public static String buildEbayServiceUrl(String keyword,EbayServiceInfo ebayServiceInfomation){
		return MessageFormat.format(ebayServiceInfomation.getServiceUrl(), ebayServiceInfomation.getAppid(),keyword);
	}
	
	public static String buildYahooServiceUrl(String keyword,YahooServiceInfo yahooServiceInfomation){
		return MessageFormat.format(yahooServiceInfomation.getServiceUrl(), yahooServiceInfomation.getAppid(),keyword);
	}
	
	/**
	 * 
	 *  The buildAmazonServiceUrl method
	 *  Create the amazon webservice call url via keyword
	 *  
	 *  @param keyWord
	 *  @author napt2017
	 *  @return String 
	 * 
	 * **/
	public static String buildAmazonServiceUrl(String keyWord,AmazonServiceInfo amazonServiceInfo) {
		 /*
         * Set up the signed requests helper 
         */
        SignedRequestsHelper helper;
        try {
            helper = SignedRequestsHelper.getInstance(amazonServiceInfo.getEndPoint(), 
								            		  amazonServiceInfo.getAwsAccessKeyId(), 
								            		  amazonServiceInfo.getAwsSecretKey());
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
        
        String requestUrl = null; 

        /* The helper can sign requests in two forms - map form and string form */
        
        /*
         * Here is an example in map form, where the request parameters are stored in a map.
         */
        System.out.println("Map form example:");
        Map<String, String> params = new HashMap<String, String>();
        params.put("Service", "AWSECommerceService");
        params.put("Version", "2009-03-31");
        params.put("Operation", "ItemLookup");
        params.put("ItemId", keyWord);
        params.put("ResponseGroup", "Small");

        requestUrl = helper.sign(params);
        System.out.println("Signed Request is \"" + requestUrl + "\"");

        /* Here is an example with string form, where the requests parameters have already been concatenated
         * into a query string. */ 
        String queryString = "Service=AWSECommerceService&Version=2009-03-31&Operation=ItemLookup&ResponseGroup=Small&ItemId="
                + keyWord;
        requestUrl = helper.sign(queryString);
        return requestUrl;
	}
	
	public static Tuple<Boolean,List<EbayCategory>> getListCategories(ApiContext apiContext){
		GetCategoriesCall gCategoriesCall = new GetCategoriesCall(apiContext);
		gCategoriesCall.setDetailLevel(new DetailLevelCodeType []{
				DetailLevelCodeType.RETURN_ALL
		});
		gCategoriesCall.setViewAllNodes(true);
		
		try {
			CategoryType [] categories = gCategoriesCall.getCategories();
			List<EbayCategory> lstEbayCategories = new ArrayList<EbayCategory>();
			for(CategoryType ct : categories){
				int id 						= Integer.valueOf(ct.getCategoryID());
				String name 				= ct.getCategoryName();
				int parentId 				= Integer.valueOf(ct.getCategoryParentID(0));
				int categoryLevel 			= ct.getCategoryLevel();
				boolean isBestOfferEnable 	= ct.isBestOfferEnabled();
				boolean isAutoPayEnable 	= ct.isAutoPayEnabled();
				
				EbayCategory ebayCategory = new EbayCategory(id, parentId, name, categoryLevel, isBestOfferEnable, isAutoPayEnable);
				lstEbayCategories.add(ebayCategory); 
			}
			return Tuple.make(true, lstEbayCategories);
		} catch (Exception e) { 
			return Tuple.make(false, null);
		}
	}
	
	public static Tuple<Boolean,List<String>> getAccountInfomation(ApiContext apiContext){
		return null;
	}
	
	/**
	 * 
	 *  The divToListGroup method
	 *  Div the list of item to list of group item
	 *  follow the parameter 
	 *  
	 *  @param List<T> listOfType
	 *  			The list of type to sub
	 *  @param groupCount
	 *  			The size of sub group
	 *  @return List<List<T>> 
	 *  			The list of list sub
	 * 
	 * 
	 * **/
	public static <T>List<List<T>> divToListGroup(List<T> listOfType,int groupCount){
		int sizeOfList = listOfType.size();
		if(sizeOfList>groupCount){
			List<List<T>> retList = new ArrayList<List<T>>();
			List<T> tempList = new ArrayList<T>(groupCount);
			int count = 0;
			int processed =0;
			for(T item :listOfType){
				tempList.add(item);
				count++;
				if(count==groupCount){
					retList.add(tempList);
					tempList = new ArrayList<T>(groupCount);
					processed+=count;
					count=0;
				}
			}
			
			if(processed<sizeOfList){
				tempList = new ArrayList<>(sizeOfList-processed);
				for(int lostIndex=processed;lostIndex<sizeOfList;lostIndex++){
					tempList.add(listOfType.get(lostIndex));
				}
				
				retList.add(tempList);
			}
			
			return retList;
		}
		
		return Arrays.asList(listOfType);
	}

	private static class SignedRequestsHelper {
		/**
		 * All strings are handled as UTF-8
		 */
		private static final String UTF8_CHARSET = "UTF-8";

		/**
		 * The HMAC algorithm required by Amazon
		 */
		private static final String HMAC_SHA256_ALGORITHM = "HmacSHA256";

		/**
		 * This is the URI for the service, don't change unless you really know
		 * what you're doing.
		 */
		private static final String REQUEST_URI = "/onca/xml";

		/**
		 * The sample uses HTTP GET to fetch the response. If you changed the
		 * sample to use HTTP POST instead, change the value below to POST.
		 */
		private static final String REQUEST_METHOD = "GET";

		private String endpoint = null;
		private String awsAccessKeyId = null;
		private String awsSecretKey = null;

		private SecretKeySpec secretKeySpec = null;
		private Mac mac = null;

		/**
		 * You must provide the three values below to initialize the helper.
		 * 
		 * @param endpoint
		 *            Destination for the requests.
		 * @param awsAccessKeyId
		 *            Your AWS Access Key ID
		 * @param awsSecretKey
		 *            Your AWS Secret Key
		 */
		public static SignedRequestsHelper getInstance(String endpoint,
				String awsAccessKeyId, String awsSecretKey)
				throws IllegalArgumentException, UnsupportedEncodingException,
				NoSuchAlgorithmException, InvalidKeyException {
			if (null == endpoint || endpoint.length() == 0) {
				throw new IllegalArgumentException("endpoint is null or empty");
			}
			if (null == awsAccessKeyId || awsAccessKeyId.length() == 0) {
				throw new IllegalArgumentException(
						"awsAccessKeyId is null or empty");
			}
			if (null == awsSecretKey || awsSecretKey.length() == 0) {
				throw new IllegalArgumentException(
						"awsSecretKey is null or empty");
			}

			SignedRequestsHelper instance = new SignedRequestsHelper();
			instance.endpoint = endpoint.toLowerCase();
			instance.awsAccessKeyId = awsAccessKeyId;
			instance.awsSecretKey = awsSecretKey;

			byte[] secretyKeyBytes = instance.awsSecretKey
					.getBytes(UTF8_CHARSET);
			instance.secretKeySpec = new SecretKeySpec(secretyKeyBytes,
					HMAC_SHA256_ALGORITHM);
			instance.mac = Mac.getInstance(HMAC_SHA256_ALGORITHM);
			instance.mac.init(instance.secretKeySpec);

			return instance;
		}

		/**
		 * The construct is private since we'd rather use getInstance()
		 */
		private SignedRequestsHelper() {
		}

		/**
		 * This method signs requests in hashmap form. It returns a URL that
		 * should be used to fetch the response. The URL returned should not be
		 * modified in any way, doing so will invalidate the signature and
		 * Amazon will reject the request.
		 */
		public String sign(Map<String, String> params) {
			// Let's add the AWSAccessKeyId and Timestamp parameters to the
			// request.
			params.put("AWSAccessKeyId", this.awsAccessKeyId);
			params.put("Timestamp", this.timestamp());

			// The parameters need to be processed in lexicographical order, so
			// we'll
			// use a TreeMap implementation for that.
			SortedMap<String, String> sortedParamMap = new TreeMap<String, String>(
					params);

			// get the canonical form the query string
			String canonicalQS = this.canonicalize(sortedParamMap);

			// create the string upon which the signature is calculated
			String toSign = REQUEST_METHOD + "\n" + this.endpoint + "\n"
					+ REQUEST_URI + "\n" + canonicalQS;

			// get the signature
			String hmac = this.hmac(toSign);
			String sig = this.percentEncodeRfc3986(hmac);

			// construct the URL
			String url = "http://" + this.endpoint + REQUEST_URI + "?"
					+ canonicalQS + "&Signature=" + sig;

			return url;
		}

		/**
		 * This method signs requests in query-string form. It returns a URL
		 * that should be used to fetch the response. The URL returned should
		 * not be modified in any way, doing so will invalidate the signature
		 * and Amazon will reject the request.
		 */
		public String sign(String queryString) {
			// let's break the query string into it's constituent name-value
			// pairs
			Map<String, String> params = this.createParameterMap(queryString);

			// then we can sign the request as before
			return this.sign(params);
		}

		/**
		 * Compute the HMAC.
		 * 
		 * @param stringToSign
		 *            String to compute the HMAC over.
		 * @return base64-encoded hmac value.
		 */
		private String hmac(String stringToSign) {
			String signature = null;
			byte[] data;
			byte[] rawHmac;
			try {
				data = stringToSign.getBytes(UTF8_CHARSET);
				rawHmac = mac.doFinal(data);
				Base64 encoder = new Base64();
				signature = new String(encoder.encode(rawHmac));
			} catch (UnsupportedEncodingException e) {
				throw new RuntimeException(UTF8_CHARSET + " is unsupported!", e);
			}
			return signature;
		}

		/**
		 * Generate a ISO-8601 format timestamp as required by Amazon.
		 * 
		 * @return ISO-8601 format timestamp.
		 */
		private String timestamp() {
			String timestamp = null;
			Calendar cal = Calendar.getInstance();
			DateFormat dfm = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
			dfm.setTimeZone(TimeZone.getTimeZone("GMT")); 
			timestamp = dfm.format(cal.getTime());
			return timestamp;
		}

		/**
		 * Canonicalize the query string as required by Amazon.
		 * 
		 * @param sortedParamMap
		 *            Parameter name-value pairs in lexicographical order.
		 * @return Canonical form of query string.
		 */
		private String canonicalize(SortedMap<String, String> sortedParamMap) {
			if (sortedParamMap.isEmpty()) {
				return "";
			}

			StringBuffer buffer = new StringBuffer();
			Iterator<Map.Entry<String, String>> iter = sortedParamMap
					.entrySet().iterator();

			while (iter.hasNext()) {
				Map.Entry<String, String> kvpair = iter.next();
				buffer.append(percentEncodeRfc3986(kvpair.getKey()));
				buffer.append("=");
				buffer.append(percentEncodeRfc3986(kvpair.getValue()));
				if (iter.hasNext()) {
					buffer.append("&");
				}
			}
			String cannoical = buffer.toString();
			return cannoical;
		}

		/**
		 * Percent-encode values according the RFC 3986. The built-in Java
		 * URLEncoder does not encode according to the RFC, so we make the extra
		 * replacements.
		 * 
		 * @param s
		 *            decoded string
		 * @return encoded string per RFC 3986
		 */
		private String percentEncodeRfc3986(String s) {
			String out;
			try {
				out = URLEncoder.encode(s, UTF8_CHARSET).replace("+", "%20")
						.replace("*", "%2A").replace("%7E", "~");
			} catch (UnsupportedEncodingException e) {
				out = s;
			}
			return out;
		}

		/**
		 * Takes a query string, separates the constituent name-value pairs and
		 * stores them in a hashmap.
		 * 
		 * @param queryString
		 * @return
		 */
		private Map<String, String> createParameterMap(String queryString) {
			Map<String, String> map = new HashMap<String, String>();
			String[] pairs = queryString.split("&");

			for (String pair : pairs) {
				if (pair.length() < 1) {
					continue;
				}

				String[] tokens = pair.split("=", 2);
				for (int j = 0; j < tokens.length; j++) {
					try {
						tokens[j] = URLDecoder.decode(tokens[j], UTF8_CHARSET);
					} catch (UnsupportedEncodingException e) {
					}
				}
				switch (tokens.length) {
				case 1: {
					if (pair.charAt(0) == '=') {
						map.put("", tokens[0]);
					} else {
						map.put(tokens[0], "");
					}
					break;
				}
				case 2: {
					map.put(tokens[0], tokens[1]);
					break;
				}
				}
			}
			return map;
		}
	}
	
	@Bean
	public static PropertySourcesPlaceholderConfigurer propertyConfigInDev() {
		//Must have this to resolve ${}
		return new PropertySourcesPlaceholderConfigurer();
	}
}

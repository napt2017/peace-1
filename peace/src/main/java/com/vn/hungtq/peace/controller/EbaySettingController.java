package com.vn.hungtq.peace.controller;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vn.hungtq.peace.common.AjaxResponseResult;
import com.vn.hungtq.peace.common.CommonUtils;
import com.vn.hungtq.peace.common.EbayServiceInfo;
import com.vn.hungtq.peace.common.Tuple;
import com.vn.hungtq.peace.dto.ItemInfomationDto;
import com.vn.hungtq.peace.dto.UserDto;
import com.vn.hungtq.peace.dto.UserTemplateDto;
import com.vn.hungtq.peace.ebay.FetchTokenCall;
import com.vn.hungtq.peace.ebay.GetSessionIDCall;
import com.vn.hungtq.peace.entity.ItemInfomation;
import com.vn.hungtq.peace.entity.UserTemplate;
import com.vn.hungtq.peace.service.ItemInfomationDaoService;
import com.vn.hungtq.peace.service.UserTemplateDaoService;

@Controller
@Scope("session")
public class EbaySettingController {
	private final Logger logger = LoggerFactory.getLogger(EbaySettingController.class);
	
	private final static String VIEW_LOGIN_EBAY = "/pages/G_SetEbayLogin";
	private final static String COOKIE_EBAY_SESSION = "PeaceEbaySessionId";
	private final static String COOKIE_EBAY_TOKEN = "PeaceEbayToken";
	
	@Autowired
	UserTemplateDaoService userTemplateDaoService;
	
	@Autowired
	ItemInfomationDaoService itemInfomationDaoService; 
	
	@Autowired
	EbayServiceInfo ebayServiceInfo; 
	
	@RequestMapping("/ListTemplate")
	public ModelAndView actionListTemplate(){
		return new ModelAndView("/pages/G_SetTemplate");
	}
	
	@RequestMapping("/CustomTemplate")
	public ModelAndView actionCustomTemplate(){
		return new ModelAndView("/pages/G_SetCustomTemplate");
	}
	
	@RequestMapping("/SetItemInfo")
	public ModelAndView actionSetItemInfo(){
		return new ModelAndView("/pages/G_SetItemInfo");
	}
	
	@RequestMapping("/SetShip")
	public ModelAndView actionSetShip(){
		return new ModelAndView("/pages/G_SetShip");
	}
	
	@RequestMapping("/SetBuyer")
	public ModelAndView actionSetBuyer(){
		return new ModelAndView("/pages/G_SetBuyer");
	} 
	
	@RequestMapping("/ListResearchAll")
	public ModelAndView listSearchAll(){ 
		return new ModelAndView("/pages/G_ListResearchAll");
	}
	
	@RequestMapping(value = "/LoadItemInfomation",method = RequestMethod.GET)
	public @ResponseBody ItemInfomationDto loadItemInfomation(HttpServletRequest request){ 
		UserDto user = (UserDto)request.getSession().getAttribute("user");
		int userId = user.getId();
		
		ItemInfomation itemInfomation = itemInfomationDaoService.getItemInfomationByUserId(userId);
		if(itemInfomation!=null){
			return new ItemInfomationDto().copyFrom(itemInfomation);
		}
		return new ItemInfomationDto().withDefaultId();
	}
	
	@RequestMapping(value ="/AddItemInfomation",method=RequestMethod.POST)
	public @ResponseBody AjaxResponseResult<String> addNewItemInfomation(@RequestBody ItemInfomationDto itemInfomation,HttpServletRequest request){ 
		//Log
		logger.debug("Item infomation :"+itemInfomation.getInternationalBuyersNote());
		
		Tuple<Boolean, String> validateResult = CommonUtils.tryToValidateItemInfomation(itemInfomation);
		AjaxResponseResult<String> ajaxResult = new AjaxResponseResult<String>();
		if(validateResult.getFirst()){ 
			ItemInfomation dbItemInfomation = new ItemInfomation();
			dbItemInfomation.setAboutUs(itemInfomation.getAboutUs());
			dbItemInfomation.setInternationalBuyerNote(itemInfomation.getInternationalBuyersNote());
			dbItemInfomation.setPayment(itemInfomation.getPayment());
			dbItemInfomation.setTermsOfSale(itemInfomation.getTermsOfSale()); 
			
			UserDto user = (UserDto)request.getSession().getAttribute("user");
			int userId = user.getId();
			dbItemInfomation.setUserId(userId);
			if(itemInfomation.getItemId()!=-1){
				//Update
				dbItemInfomation.setId(itemInfomation.getItemId());
				itemInfomationDaoService.updateItemInfomation(dbItemInfomation);
			}else{
				//Insert new
				itemInfomationDaoService.addItemInfomation(dbItemInfomation);
			}
			
			ajaxResult.setStatus("OK");
			ajaxResult.setRecordId(dbItemInfomation.getId());
			
		}else{
			ajaxResult.setStatus("FAILED");
			ajaxResult.setCause(validateResult.getSecond());
		}
		return ajaxResult;
	}
	
	@RequestMapping(value ="/CustomTemplateUpload",method=RequestMethod.POST)
	public @ResponseBody AjaxResponseResult<String> uploadTemplate(@RequestBody UserTemplateDto templateUploadDto,
											  HttpServletRequest request){ 
		Tuple<Boolean,String> validateResult = CommonUtils.tryToValidateUserTemplate(templateUploadDto);
		AjaxResponseResult<String> ajaxResult = new AjaxResponseResult<>();
		
		if(validateResult.getFirst()){
			if(templateUploadDto.getTemplateId()!=-1){
				UserTemplate userTemplate = userTemplateDaoService.getUserTemplateById(templateUploadDto.getTemplateId());
				if(userTemplate!=null){
					userTemplate.setTitle(templateUploadDto.getTitle());
					userTemplate.setHtmlCode(templateUploadDto.getHtmlCode());
					userTemplate.setImage(CommonUtils.convertStringByteArray(templateUploadDto.getBase64StringImage()));
					userTemplateDaoService.updateUserTemplate(userTemplate);
					ajaxResult.setStatus("OK");
					ajaxResult.setRecordId(userTemplate.getId());
					
				}else{
					ajaxResult.setStatus("FAILED");
					ajaxResult.setCause("Cannot found the exist user template! Update failed!");
				}
			}else{
				UserDto user = (UserDto)request.getSession().getAttribute("user");
				int userId = user.getId();
				
				UserTemplate userTemplate = new UserTemplate();
				userTemplate.setHtmlCode(templateUploadDto.getHtmlCode());
				userTemplate.setImage(CommonUtils.convertStringByteArray(templateUploadDto.getBase64StringImage()));
				userTemplate.setTitle(templateUploadDto.getTitle());  
				userTemplate.setUserId(userId);
				userTemplateDaoService.saveUserTemplate(userTemplate);
				ajaxResult.setStatus("OK");
				ajaxResult.setRecordId(userTemplate.getId());
				logger.debug("Save user template success!");
			}
		}else{
			ajaxResult.setStatus("FAILED");
			ajaxResult.setCause("Insert new template failed! Cause by : \n" +validateResult.getSecond());
		}
		
		return ajaxResult;
	}
	
	@RequestMapping(value ="/LoadUserTemplate",method=RequestMethod.GET)
	public @ResponseBody List<List<UserTemplateDto>> loadUserTemplates(HttpServletRequest request){ 
		UserDto user = (UserDto)request.getSession().getAttribute("user");
		int userId = user.getId();
		List<UserTemplate> lstUserTemplate = userTemplateDaoService.getListTemplateOfUser(userId);
		List<UserTemplateDto> lstUserTemplateDtos = CommonUtils.convertToUserTemplateDto(lstUserTemplate);  
		return CommonUtils.divToListGroup(lstUserTemplateDtos, 5);
	}
	
	@RequestMapping("/SetEbayLogin") 
	public ModelAndView actionSetEbayLogin(@CookieValue(value = COOKIE_EBAY_SESSION, defaultValue = "") String cachedSessionID, HttpServletResponse response){
		ModelAndView model = new ModelAndView(VIEW_LOGIN_EBAY);
		boolean isProduction = false;
		// Create Url login base
		StringBuilder loginEbayUrl = new StringBuilder();
		
		
		if ("prod".equals(ebayServiceInfo.getEnvironment())) {
			isProduction = true;
			loginEbayUrl.append(ebayServiceInfo.getProdSigninURL());
		} else {
			loginEbayUrl.append(ebayServiceInfo.getSandboxSigninURL());
		}
		
		// Get sessionId from Ebay then add to URL
		GetSessionIDCall call = new GetSessionIDCall(isProduction, ebayServiceInfo);
		try {
			if (!StringUtils.isEmpty(cachedSessionID)) {
				String encodedSessIDString = URLEncoder.encode(cachedSessionID,"UTF-8");
	            // Create URL login with parameter
	            loginEbayUrl.append(ebayServiceInfo.getRuName());
	            loginEbayUrl.append("&SessID=");
	            loginEbayUrl.append(encodedSessIDString);
	            
	         // Assign url to model
	    		model.addObject("urlEbayLogin", loginEbayUrl.toString());
	    		return model;
	        }
			
            call.getSessionIDString(call.sendRequest(ebayServiceInfo.getRuName()));

            String errMsg = call.getLongErrorMessage();
            if (errMsg != null && errMsg.startsWith("RequestError")) {
                throw new Exception("Cannot get Session Id");
            } else {
                String newCachedSessionID = call.getRawSessionID();
                
                // Add session Id to cookie
                Cookie cookie = new Cookie(COOKIE_EBAY_SESSION, newCachedSessionID);
                response.addCookie(cookie);
                
                String encodedSessIDString =URLEncoder.encode(newCachedSessionID,"UTF-8");
                // Create URL login with parameter
                loginEbayUrl.append(ebayServiceInfo.getRuName());
                loginEbayUrl.append("&SessID=");
                loginEbayUrl.append(encodedSessIDString);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
		
		// Assign url to model
		model.addObject("urlEbayLogin", loginEbayUrl.toString());
		
		return model;
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value ="/GetEbayToken",method=RequestMethod.POST)
	public @ResponseBody AjaxResponseResult fetchTokenActionPerformed(
			@CookieValue(value = COOKIE_EBAY_SESSION, defaultValue = "") String cachedSessionID,
			HttpServletResponse response) {
		
		AjaxResponseResult ajaxResult = new AjaxResponseResult();
        FetchTokenCall call = null;
        
		boolean isProduction = false;
		
		// Create Url login base
		StringBuilder loginEbayUrl = new StringBuilder();
		if ("prod".equals(ebayServiceInfo.getEnvironment())) {
			isProduction = true;
			loginEbayUrl.append(ebayServiceInfo.getProdSigninURL());
		} else {
			loginEbayUrl.append(ebayServiceInfo.getSandboxSigninURL());
		}
		
		// Call Ebay get Token
        if (StringUtils.isEmpty(cachedSessionID)) {
        	ajaxResult.setStatus("FAILED");
        	ajaxResult.setMsg("You need to connect to eBay first");
        } else {
            call = new FetchTokenCall(isProduction, ebayServiceInfo);
            call.getUserTokenString(call.sendRequest(cachedSessionID));
            String errMsg = call.getLongErrorMessage();
            if (errMsg != null && errMsg.startsWith("RequestError")) {
            	
            	ajaxResult.setStatus("FAILED");
            	ajaxResult.setMsg(errMsg);
            	
            	// Remove ebay session
                Cookie cookie = new Cookie(COOKIE_EBAY_SESSION, null);
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            	
            } else {
            	ajaxResult.setStatus("OK");
            	ajaxResult.setMsg("Success");
            	
            	// Add session Id to cookie
                Cookie cookie = new Cookie(COOKIE_EBAY_TOKEN, call.getUsertoken());
                response.addCookie(cookie);
            }
        }
        
        return ajaxResult;
    }
} 
package com.vn.hungtq.peace.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ebay.sdk.ApiContext;
import com.vn.hungtq.peace.common.AjaxResponseResult;
import com.vn.hungtq.peace.common.CommonUtils;
import com.vn.hungtq.peace.common.EbayItemManupulation;
import com.vn.hungtq.peace.common.EbayServiceInfo;
import com.vn.hungtq.peace.common.Tuple;
import com.vn.hungtq.peace.dto.EbayCategory;
import com.vn.hungtq.peace.dto.EbayItemDto;

@Controller
public class EbayListingController {
	
	@Autowired
	EbayServiceInfo ebayServiceInfo;
	
	private final static String COOKIE_EBAY_TOKEN = "PeaceEbayToken";
	
	@RequestMapping(value="/Sell",method= RequestMethod.GET)
	public ModelAndView sell(){
		return new ModelAndView("pages/G_Sell");
	}
	
	@RequestMapping(value="/AddItem",method= RequestMethod.POST)
	public @ResponseBody AjaxResponseResult<String> addItem(@RequestBody EbayItemDto ebayItemDto ,@CookieValue(value=COOKIE_EBAY_TOKEN ,defaultValue="") String ebayToken){
		AjaxResponseResult<String> responseResult = new AjaxResponseResult<String>();
		responseResult.setStatus("OK");
		EbayItemManupulation eim = new EbayItemManupulation();
		ApiContext ctx = CommonUtils.getApiContext(ebayToken, ebayServiceInfo);
		Tuple<Boolean,String> result = eim.addEbayItem(ctx,ebayItemDto); 
		if(result.getFirst()){
			responseResult.setMsg("Add item success with id:"+result.getSecond());
		}else{
			responseResult.setStatus("FAILED");
			responseResult.setCause(result.getSecond());
		}
		return responseResult;
	} 
	
	/**
	 * Get Category Ebay
	 * @param ebayToken
	 * @return
	 */
	@RequestMapping(value="/GetCategory",method= RequestMethod.POST)
	public @ResponseBody AjaxResponseResult<List<EbayCategory>> getCategory(@RequestBody EbayCategory ebayCategory, @CookieValue(value=COOKIE_EBAY_TOKEN ,defaultValue="") String ebayToken){
		AjaxResponseResult<List<EbayCategory>> responseResult = new AjaxResponseResult<List<EbayCategory>>();
		
		if(StringUtils.isEmpty(ebayToken)){
			responseResult.setStatus("FAILED");
			responseResult.setCause("You must login to ebay site to init the ebay token");
		}else{    
			//Get api context
			ApiContext apiContext = CommonUtils.getApiContext(ebayToken, ebayServiceInfo);
			try {
				
				Tuple<Boolean,List<EbayCategory>> tupleCategory = null;
				if (ebayCategory.getId() == 0) {
					tupleCategory = CommonUtils.getListCategories(apiContext, ebayCategory.getCategoryLevel(), null);
				} else {
					tupleCategory = CommonUtils.getListCategories(apiContext, ebayCategory.getCategoryLevel(), String.valueOf(ebayCategory.getId()));
				}
				
				if (Boolean.TRUE == tupleCategory.getFirst() ) {
					responseResult.setExtraData(tupleCategory.getSecond());
				}
			} catch (Exception e) { 
				responseResult.setStatus("FAILED");
				responseResult.setCause(e.getMessage());
			} 
		}
		
		return responseResult;
	}
}

package com.vn.hungtq.peace.controller;
  
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ebay.sdk.ApiContext;
import com.ebay.sdk.ApiException;
import com.ebay.sdk.SdkException;
import com.ebay.sdk.TimeFilter;
import com.ebay.sdk.call.GetSellerListCall;
import com.ebay.sdk.util.eBayUtil;
import com.ebay.soap.eBLBaseComponents.DetailLevelCodeType;
import com.ebay.soap.eBLBaseComponents.ItemType;
import com.ebay.soap.eBLBaseComponents.PaginationType;
import com.vn.hungtq.peace.common.AjaxResponseResult;
import com.vn.hungtq.peace.common.CommonUtils;
import com.vn.hungtq.peace.dto.EbayProductSearch;

@Controller
public class EbayProductListController {
	private final static String COOKIE_EBAY_TOKEN = "PeaceEbayToken";
	
	@RequestMapping(value="ListUnsold",method = RequestMethod.GET)
	public ModelAndView listUnSold(){
		return new ModelAndView("pages/G_ListUnsold");
	}
	
	@RequestMapping(value="ListSold",method = RequestMethod.GET)
	public ModelAndView listSold(){
		return new ModelAndView("pages/G_ListSold");
	}
	
	@RequestMapping(value="ListSell",method = RequestMethod.GET)
	public ModelAndView listSell(){
		return new ModelAndView("pages/G_ListSell");
	}
	
	@RequestMapping(value="ListError",method = RequestMethod.GET)
	public ModelAndView listError(){
		return new ModelAndView("pages/G_ListError");
	}
	
	@RequestMapping(value="GetListProduct/{type}",method = RequestMethod.GET)
	public @ResponseBody AjaxResponseResult<List<EbayProductSearch>> getListSell(@CookieValue(value=COOKIE_EBAY_TOKEN ,defaultValue="") String ebayToken ,@PathVariable("type") int type){
		AjaxResponseResult<List<EbayProductSearch>> resposeResult = new AjaxResponseResult<List<EbayProductSearch>>();
		resposeResult.setStatus("OK"); 
		
		if("".equals(ebayToken)){
			resposeResult.setStatus("FAILED");
			resposeResult.setCause("You must login to ebay site to init the ebay token");
		}else{    
			//Get api context
			ApiContext apiContext = CommonUtils.getApiContext(ebayToken, "https://api.sandbox.ebay.com/wsapi");
			try {
				ItemType [] itemTypes = getSellerListEbayApi(apiContext);
				List<EbayProductSearch> lstEbayProductSearch = CommonUtils.convertToEbayProductSearch(itemTypes);
				resposeResult.setExtraData(lstEbayProductSearch);
			} catch (Exception e) { 
				resposeResult.setStatus("FAILED");
				resposeResult.setCause(e.getMessage());
			} 
		}
		
		return resposeResult; 
	}
	
	private ItemType[] getSellerListEbayApi(ApiContext apiContext) throws ApiException, SdkException, Exception{
		
		//Error language
		apiContext.setErrorLanguage("en_US");
		
		//Create get seller list call object
		GetSellerListCall ex = new GetSellerListCall(apiContext);
		
		//Set return type
        DetailLevelCodeType[] detailLevels = new DetailLevelCodeType[]{DetailLevelCodeType.RETURN_ALL};
        ex.setDetailLevel(detailLevels);
        
        //Pagination result
        PaginationType pagintionT = new PaginationType();
        pagintionT.setEntriesPerPage(200);
        pagintionT.setPageNumber(1);
        ex.setPagination(pagintionT);
        
        //Time filter -temporary fix because at this time ,we have data to test :)
        String strFrom ="2017-03-06 09:20:52";
        Date fromDate = eBayUtil.fromAPITimeString(strFrom);
        Calendar cldFrom = Calendar.getInstance();
        cldFrom.setTime(fromDate);
        
        String strTo ="2017-03-11 09:20:52";
        Date toDate = eBayUtil.fromAPITimeString(strTo);
        Calendar cldTo = Calendar.getInstance();
        cldTo.setTime(toDate);
        
        ex.setStartTimeFilter(new TimeFilter(cldFrom, cldTo));
        
        //Call service 
        return ex.getEntireSellerList(); 
	} 
}

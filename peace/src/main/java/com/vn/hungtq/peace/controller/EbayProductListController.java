package com.vn.hungtq.peace.controller;
  
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
import com.ebay.sdk.call.GetMyeBaySellingCall;
import com.ebay.sdk.call.GetSellerListCall;
import com.ebay.sdk.util.eBayUtil;
import com.ebay.soap.eBLBaseComponents.DetailLevelCodeType;
import com.ebay.soap.eBLBaseComponents.ItemListCustomizationType;
import com.ebay.soap.eBLBaseComponents.ItemSortTypeCodeType;
import com.ebay.soap.eBLBaseComponents.ItemType; 
import com.ebay.soap.eBLBaseComponents.OrderTransactionType;
import com.ebay.soap.eBLBaseComponents.PaginationType;
import com.ebay.soap.eBLBaseComponents.TransactionType;
import com.vn.hungtq.peace.common.AjaxResponseResult;
import com.vn.hungtq.peace.common.CommonUtils;
import com.vn.hungtq.peace.common.EbaySellingType;
import com.vn.hungtq.peace.common.EbayServiceInfo;
import com.vn.hungtq.peace.common.Tuple;
import com.vn.hungtq.peace.dto.EbayProductSearch;

@Controller
public class EbayProductListController {
	private final Logger logger = LoggerFactory.getLogger(EbayProductListController.class);
	private final static String COOKIE_EBAY_TOKEN = "PeaceEbayToken";
	
	@Autowired
	EbayServiceInfo ebayServiceInfo; 
	
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
			ApiContext apiContext = CommonUtils.getApiContext(ebayToken,ebayServiceInfo);
			
			//Load item follow type 
			try {
				Tuple<Boolean, ItemType[]> tupleOfListItems = getMyEbaySelling(apiContext, type);
				if(tupleOfListItems.getFirst()){
					ItemType[] items = tupleOfListItems.getSecond();
					List<EbayProductSearch> lstEbayProductSearch = CommonUtils.convertToEbayProductSearch(items);
					resposeResult.setExtraData(lstEbayProductSearch);
				}else{
					resposeResult.setStatus("FAILED");
					resposeResult.setCause("Cannot load item follow type!");
				}
			} catch (Exception e) { 
				logger.debug("Exception when call getMyEbaySelling ! Cause by :"+e.getMessage());
				resposeResult.setStatus("FAILED");
				resposeResult.setCause(e.getMessage());
			} 
		}
		
		return resposeResult; 
	} 	
	
	private Tuple<Boolean, ItemType[]> getMyEbaySelling(ApiContext apiContext ,int ebaySellingType) throws ApiException, SdkException, Exception{
		
		//Create new instance of my ebay selling call
		GetMyeBaySellingCall gmSellingCall = new GetMyeBaySellingCall(apiContext);
		
		//Set sort type for scheduled list
		ItemListCustomizationType scheduledListCustomType = new ItemListCustomizationType();
		scheduledListCustomType.setSort(ItemSortTypeCodeType.ITEM_ID);
		gmSellingCall.setScheduledList(scheduledListCustomType);
		
		//Set sort type for active list
		ItemListCustomizationType activeListCustomType = new ItemListCustomizationType();
		activeListCustomType.setSort(ItemSortTypeCodeType.ITEM_ID);
		gmSellingCall.setActiveList(activeListCustomType);
		
		//Set sort type for sold list
		ItemListCustomizationType soldListCustomType = new ItemListCustomizationType();
		soldListCustomType.setSort(ItemSortTypeCodeType.ITEM_ID);
		gmSellingCall.setSoldList(soldListCustomType);
		
		//Set sort type for unsold list
		ItemListCustomizationType unSoldListCustomType = new ItemListCustomizationType();
		unSoldListCustomType.setSort(ItemSortTypeCodeType.ITEM_ID);
		gmSellingCall.setUnsoldList(unSoldListCustomType);
		
		//Ret item
		ItemType[] ilCustomType = null;
		boolean hasData = true;
		
		//Call
		gmSellingCall.getMyeBaySelling(); 
		
		switch(ebaySellingType){
			case EbaySellingType.SCHEDULED_LIST:
				if(gmSellingCall.getReturnedScheduledList()!=null){
					ilCustomType = gmSellingCall.getReturnedScheduledList().getItemArray().getItem();
				}else{
					ilCustomType = new ItemType[0];
				}
				break;
			case EbaySellingType.ACTIVE_LIST:
				if(gmSellingCall.getReturnedActiveList()!=null){
					ilCustomType = gmSellingCall.getReturnedActiveList().getItemArray().getItem();
				}else{
					ilCustomType = new ItemType[0];
				}
				break;
			case EbaySellingType.UNSOLD_LIST:
				if(gmSellingCall.getReturnedUnsoldList()!=null){
					ilCustomType = gmSellingCall.getReturnedUnsoldList().getItemArray().getItem();
				}else{
					ilCustomType = new ItemType[0];
				}
				break;
			case EbaySellingType.SOLD_LIST:
				if(gmSellingCall.getReturnedSoldList()!=null){ 
					OrderTransactionType [] orderTransactionType= gmSellingCall.getReturnedSoldList()
																			   .getOrderTransactionArray()
																			   .getOrderTransaction();
					ilCustomType = convertOrderTransactionToItemType(orderTransactionType);
				}else{
					ilCustomType = new ItemType[0];
				}
				break;
			default: 
				hasData = false; 
		}
		
		return Tuple.make(hasData, ilCustomType);
	}
	
	
	private ItemType [] convertOrderTransactionToItemType(OrderTransactionType [] orderTransactionType){
		if(orderTransactionType!=null && orderTransactionType.length>0){
			int len = orderTransactionType.length;
			ItemType[] itemTypes = new ItemType[len];
			for(int loopIndex = 0;loopIndex<len;loopIndex++){
				TransactionType tranType = orderTransactionType[loopIndex].getTransaction();
				if(tranType.getItem()!=null){
					itemTypes[loopIndex] = tranType.getItem();
				}else{
					itemTypes[loopIndex] = new ItemType();
				}
			}
			
			return itemTypes;
		}
		return new ItemType[0];
	}
	
	
	/**
	 *  
	 *  The getSellerListEbayApi method <br>
	 *  Get all seller of current user token </br>
	 *  
	 *  @param apiContext
	 * 			The context which contain the connection token information to service
	 * 
	 *  @throws ApiException
	 *  @throws SdkException
	 *  @throws Exception
	 *  
	 *  @return ItemType[]
	 *  		The array of item which was associated with current user
	 *  
	 *  @author napt2017 
	 * 
	 * **/
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

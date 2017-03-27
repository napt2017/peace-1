package com.vn.hungtq.peace.common;

import java.util.Arrays;
import java.util.List;

import com.ebay.sdk.ApiContext;
import com.ebay.sdk.call.AddItemCall;
import com.ebay.soap.eBLBaseComponents.AmountType;
import com.ebay.soap.eBLBaseComponents.BestOfferDetailsType;
import com.ebay.soap.eBLBaseComponents.BuyerPaymentMethodCodeType;
import com.ebay.soap.eBLBaseComponents.CategoryType;
import com.ebay.soap.eBLBaseComponents.ItemType;
import com.ebay.soap.eBLBaseComponents.ListingEnhancementsCodeType;
import com.ebay.soap.eBLBaseComponents.ListingTypeCodeType;
import com.ebay.soap.eBLBaseComponents.PhotoDisplayCodeType;
import com.ebay.soap.eBLBaseComponents.PictureDetailsType;
import com.ebay.soap.eBLBaseComponents.ReturnPolicyType;
import com.ebay.soap.eBLBaseComponents.SalesTaxType;
import com.ebay.soap.eBLBaseComponents.ShippingDetailsType;
import com.ebay.soap.eBLBaseComponents.ShippingServiceOptionsType;
import com.vn.hungtq.peace.dto.EbayItemDto;
import com.vn.hungtq.peace.dto.ReturnPolicyDto;
import com.vn.hungtq.peace.dto.ShippingDetailDto;
import com.vn.hungtq.peace.dto.ShippingServiceOptionDto;

public class EbayItemManupulation {
  public Tuple<Boolean,String> addEbayItem(ApiContext ctx ,EbayItemDto itemDto ){ 
	  /*//itemDto = buildEbayItemDto(); */
	  ShippingDetailDto shippingDetailDto = new ShippingDetailDto();
	  shippingDetailDto.setIsuranceFee(2.8d);
	  shippingDetailDto.setIsuranceOption("Optional");
	  shippingDetailDto.setPaymentInstruction("eBay DotNet SDK test instruction.");
	  shippingDetailDto.setShippingType("Flat");
	  List<ShippingServiceOptionDto> lstShippingServiceOption = Arrays.asList(
	    		new ShippingServiceOptionDto("ShippingMethodStandard", 2d, 1d, 1d),
	    		new ShippingServiceOptionDto("ShippingMethodExpress", 2d, 1d, 1d));
	  shippingDetailDto.setListOfShippingServiceOption(lstShippingServiceOption);
	  itemDto.setShippingDetailDto(shippingDetailDto);
	  
	  ItemType item = buildItemFromDto(itemDto);  
	  AddItemCall addItemCall = new AddItemCall(ctx);
	  addItemCall.setPictureFiles(new String[]{"C:\\Users\\napt2017\\Desktop\\scientific-atomic-icon-65201.png"});
    
	  PictureDetailsType pictureDetailType = new PictureDetailsType();
	  pictureDetailType.setPhotoDisplay(PhotoDisplayCodeType.SITE_HOSTED_PICTURE_SHOW);
	  item.setPictureDetails(pictureDetailType); 
	  addItemCall.setItem(item);
	  
	  Tuple<Boolean,String> result ;
	  try {
	      //FeesType feeTypes = addItemCall.addItem();
	      addItemCall.addItem();
	      result =Tuple.make(true,item.getItemID());
	      
	 } catch (Exception e) { 
		 result =Tuple.make(false, e.getMessage());
	 } 
    
	  return result;
  }
  
  /**
   * 
   *  The buildEbayItemDto method
   *  Build the same data for addItem 
   * 
   * **/
  @SuppressWarnings("unused")
private EbayItemDto buildEbayItemDto(){
    EbayItemDto ebayItDto = new EbayItemDto();
    ebayItDto.setTitle("Title_"+System.currentTimeMillis());
    ebayItDto.setDescription("Description_"+System.currentTimeMillis());
    ebayItDto.setCountry("US");
    ebayItDto.setCurrency("USD");
    ebayItDto.setQuantity(1);
    ebayItDto.setLocation("San Jose");
    ebayItDto.setListingDuration("Days_1");
    ebayItDto.setCategoryId("11104");
    ebayItDto.setStartPrice(1d);
    ebayItDto.setReservePrice(2d);
    ebayItDto.setBuyNowPrice(4d);
    ebayItDto.setConditionId(1000);
    ebayItDto.setPaypalEmail("ngocanhk6apro@gmail.com");
    
    ReturnPolicyDto rpDto = new ReturnPolicyDto();
    rpDto.setRefund("MoneyBack");
    rpDto.setReturnsWithinOption("Days_14");
    rpDto.setReturnsAcceptedOption("ReturnsAccepted");
    rpDto.setShippingCostPaidByOption("Buyer"); 
    ebayItDto.setReturnPolicyDto(rpDto);
    
    ShippingDetailDto shippingDetailDto = new ShippingDetailDto();
    shippingDetailDto.setIsuranceFee(2.8d);
    shippingDetailDto.setIsuranceOption("Optional");
    shippingDetailDto.setPaymentInstruction("eBay DotNet SDK test instruction.");
    shippingDetailDto.setShippingType("Flat");
    
    List<ShippingServiceOptionDto> lstShippingServiceOption = Arrays.asList(
    		new ShippingServiceOptionDto("ShippingMethodStandard", 2d, 1d, 1d),
    		new ShippingServiceOptionDto("ShippingMethodExpress", 2d, 1d, 1d));
    shippingDetailDto.setListOfShippingServiceOption(lstShippingServiceOption);
    ebayItDto.setShippingDetailDto(shippingDetailDto);
    
    
    return ebayItDto;
  }
  
  
  
  private ItemType buildItemFromDto(EbayItemDto itemDto){
    ItemType itemType = new ItemType();
    
    //Settings
    itemType.setCurrency(itemDto.getCurrencyCodeType()); 
    itemType.setCountry(itemDto.getCountryCodeType());  
    
    BuyerPaymentMethodCodeType [] paymentMethods = new BuyerPaymentMethodCodeType[]{
        BuyerPaymentMethodCodeType.PAY_PAL
    };
    itemType.setPaymentMethods(paymentMethods);
    itemType.setRegionID("0");
    
    itemType.setTitle(itemDto.getTitle());
    itemType.setDescription(itemDto.getDescription());
    
    itemType.setQuantity(itemDto.getQuantity());
    itemType.setLocation(itemDto.getLocation());
    itemType.setListingDuration(itemDto.getListingDuration());
    
    CategoryType categoryType = new CategoryType();
    categoryType.setCategoryID(itemDto.getCategoryId());
    
    itemType.setPrimaryCategory(categoryType);
    
    AmountType startPrice = new AmountType();
    startPrice.setCurrencyID(itemType.getCurrency());
    startPrice.setValue(itemDto.getStartPrice());
    itemType.setStartPrice(startPrice);
    
    AmountType reservePrice = new AmountType();
    reservePrice.setCurrencyID(itemType.getCurrency());
    reservePrice.setValue(itemDto.getReservePrice());
    itemType.setReservePrice(reservePrice);
    
    AmountType buyItNow = new AmountType();
    buyItNow.setCurrencyID(itemType.getCurrency());
    buyItNow.setValue(itemDto.getBuyNowPrice());
    itemType.setBuyItNowPrice(buyItNow);
    
    ListingEnhancementsCodeType [] listingEhancementCodeType = new ListingEnhancementsCodeType[]{
        ListingEnhancementsCodeType.BOLD_TITLE
    };
    itemType.setListingEnhancement(listingEhancementCodeType); 
    itemType.setListingType(ListingTypeCodeType.CHINESE );
    
    BestOfferDetailsType bestOfferDetail = new BestOfferDetailsType();
    bestOfferDetail.setBestOfferEnabled(itemDto.isBestOfferEnable());
    itemType.setBestOfferDetails(bestOfferDetail);
    
    //If has second category type 
    if(itemDto.isHasSecondaryCategory()){
      CategoryType secondCategory = new CategoryType();
      secondCategory.setCategoryID(itemDto.getSecondaryCategoryId());
      itemType.setSecondaryCategory(secondCategory);
    }
    
    itemType.setPayPalEmailAddress(itemDto.getPaypalEmail());
    itemType.setApplicationData(itemDto.getApplicationData());
    itemType.setConditionID(itemDto.getConditionId());
    
    itemType.setShippingDetails(buildShippingDetail(itemDto.getShippingDetailDto()));
    itemType.setDispatchTimeMax(1);
    itemType.setReturnPolicy(buildReturnPolicy(itemDto.getReturnPolicyDto())); 
    
    return itemType;
  }

  private ReturnPolicyType buildReturnPolicy(ReturnPolicyDto returnPolicyDto) {
    ReturnPolicyType policy=new ReturnPolicyType();
    policy.setRefund(returnPolicyDto.getRefund());
    policy.setReturnsWithinOption(returnPolicyDto.getReturnsWithinOption());
    policy.setReturnsAcceptedOption(returnPolicyDto.getReturnsAcceptedOption());
    policy.setShippingCostPaidByOption(returnPolicyDto.getShippingCostPaidByOption());

    return policy;
  }

  private ShippingDetailsType buildShippingDetail(ShippingDetailDto shippingDetailDto) {
    ShippingDetailsType sdType = new ShippingDetailsType(); 
    
    SalesTaxType saleTaxType = new SalesTaxType();
    saleTaxType.setSalesTaxPercent(0.0825f);
    saleTaxType.setSalesTaxState("CA");
    sdType.setApplyShippingDiscount(true);
    sdType.setSalesTax(saleTaxType);
    
    AmountType at =new AmountType();
    at.setValue(shippingDetailDto.getIsuranceFee());
    at.setCurrencyID(shippingDetailDto.getCurrencyCodeType());
    sdType.setInsuranceFee(at);
    sdType.setInsuranceOption(shippingDetailDto.getIsuranceOptionCodeType());
    sdType.setPaymentInstructions(shippingDetailDto.getPaymentInstruction());
    sdType.setShippingType(shippingDetailDto.getShippingCodeType());
    
    //Get List shipping service option
    List<ShippingServiceOptionDto> lstShippingServiceOptionDto = shippingDetailDto.getListOfShippingServiceOption();
    ShippingServiceOptionsType [] ssOt = new ShippingServiceOptionsType[lstShippingServiceOptionDto.size()];
    int index =0;
    for(ShippingServiceOptionDto ssoDto : lstShippingServiceOptionDto){
    	ShippingServiceOptionsType st1 = new ShippingServiceOptionsType();
	    st1.setShippingService(ssoDto.getShippingServiceCodeType().value());
	    at = new AmountType();
	    at.setValue(ssoDto.getShippingServiceAddtionalCost());
	    at.setCurrencyID(ssoDto.getCurrencyCodeType());
	    st1.setShippingServiceAdditionalCost(at);
	    at = new AmountType();
	    at.setValue(ssoDto.getShippingServiceCost());
	    at.setCurrencyID(ssoDto.getCurrencyCodeType());
	    st1.setShippingServiceCost(at);
	    st1.setShippingServicePriority(index+1);
	    at = new AmountType();
	    at.setValue(ssoDto.getShippingInsuranceCost());
	    at.setCurrencyID(ssoDto.getCurrencyCodeType());
	    st1.setShippingInsuranceCost(at);
	    
	    ssOt[index] =st1;
	    index++;
    } 
    
    sdType.setShippingServiceOptions(ssOt);
    
    return sdType;
  }
}

package com.vn.hungtq.peace.controller;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.squareup.okhttp.MediaType;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.RequestBody;
import com.squareup.okhttp.Response;
import com.vn.hungtq.peace.common.AjaxResponseResult;

@Controller
public class EbayListingController {
	@RequestMapping(value="/Sell",method= RequestMethod.GET)
	public ModelAndView sell(){
		return new ModelAndView("pages/G_Sell");
	}
	
	@RequestMapping(value="/AddItem",method= RequestMethod.POST)
	public @ResponseBody AjaxResponseResult<String> addItem(){
		AjaxResponseResult<String> responseResult = new AjaxResponseResult<String>();
		responseResult.setStatus("OK");
		String data = ebayAddItem();
		responseResult.setExtraData(data);
		return responseResult;
	}
	
	private String ebayAddItem(){
		OkHttpClient client = new OkHttpClient();

		MediaType mediaType = MediaType.parse("text/xml; charset=utf-8");
		RequestBody body = RequestBody.create(mediaType, "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\"><soap:Header><RequesterCredentials xmlns=\"urn:ebay:apis:eBLBaseComponents\"><eBayAuthToken>AgAAAA**AQAAAA**aAAAAA**Kfy+WA**nY+sHZ2PrBmdj6wVnY+sEZ2PrA2dj6wFk4GlCpeLpQ+dj6x9nY+seQ**ERsEAA**AAMAAA**k9P1kSsjA4bmttTPr9wl4dYHabhTwoT9z+beCnMy56cHpvP6DX86BsGGN6bDEAgtUaeic235i+rR7SgBTAKaluHjIwfbVNkmTVBeMPOFDceO2BVF4ZhLYzJFgx57WY5R00PEAe5l6vg/wDgxmcTDpSnnW6qCgLZZRUR6N+gGcCmo2Lc20P/t7ls5nx/FIfBXXdVCFQ/NWcY7RAyxJkFXSuicISwX8LLT1GBL6fydER82RsaiFBuQvRB3om5EYNPG/djNQ8sc4Ss27AVsVl08ekyYpCzsPt3v1G0U/FXXCQ3GmEosFGIOKwopWTzLjBVFNrqXJ3oSgaptKq5kS6eqW0aq6Uu6NzUd6G4cUh9vWiD40BndcmIn78eESizWE4RVFgmgHC4TdAmXLSFMXVmD1KY/aGlYXjPel7fNPbQszKEki7xVsO5LtIHfOgKWw2Exr1szyINsLWziWgDVAYSWBf28jQMSerP7DhqdPRSki9PcD3gonH3ZuZIrevJ7GMIjWwg9BLGZ2h+g61IfKrTRYS0JLuKYexdWNWImPAnADEwaqSTPxr2Z32KdUppHoWBUifqVnLh2zCdFNreTBSAcJw057JEZ0+yOJAuPCa57nq4m3JOyR07mjuUgIUvVotswDgjfMGYK3o9h62sr7KjIDH+ONEZnYdFgmhtY6etkBByk6L2WhWowq46upHWds23SbnkHGDMCEmfr/pQs77LSuLPscNUL/in2JAT8+g83WbAf8IHqFnT68z7mZc0jWcuB</eBayAuthToken></RequesterCredentials></soap:Header><soap:Body><AddItemRequest xmlns=\"urn:ebay:apis:eBLBaseComponents\"><MessageID>eb876ffa-e54f-4b29-936a-296ab8404286</MessageID><Version>779</Version><Item><ApplicationData>my application data</ApplicationData><BuyItNowPrice currencyID=\"USD\">10</BuyItNowPrice><Country>US</Country><Currency>USD</Currency><Description>My item description.</Description><ListingDuration>Days_3</ListingDuration><ListingType>Chinese</ListingType><Location>San Jose</Location><PaymentMethods>PayPal</PaymentMethods><PayPalEmailAddress>my@test.com</PayPalEmailAddress><PrimaryCategory><CategoryID>11104</CategoryID></PrimaryCategory><Quantity>1</Quantity><RegionID>0</RegionID><ReservePrice currencyID=\"USD\">2</ReservePrice><ShippingDetails><ApplyShippingDiscount>true</ApplyShippingDiscount><InsuranceFee currencyID=\"USD\">2.8</InsuranceFee><InsuranceOption>Optional</InsuranceOption><PaymentInstructions>eBay DotNet SDK test instruction.</PaymentInstructions><ShippingServiceOptions><ShippingInsuranceCost currencyID=\"USD\">1</ShippingInsuranceCost><ShippingService>ShippingMethodStandard</ShippingService><ShippingServiceCost currencyID=\"USD\">1</ShippingServiceCost><ShippingServiceAdditionalCost currencyID=\"USD\">2</ShippingServiceAdditionalCost><ShippingServicePriority>1</ShippingServicePriority></ShippingServiceOptions><ShippingServiceOptions><ShippingInsuranceCost currencyID=\"USD\">1</ShippingInsuranceCost><ShippingService>ShippingMethodExpress</ShippingService><ShippingServiceCost currencyID=\"USD\">1</ShippingServiceCost><ShippingServiceAdditionalCost currencyID=\"USD\">2</ShippingServiceAdditionalCost><ShippingServicePriority>2</ShippingServicePriority><ExpeditedService>true</ExpeditedService></ShippingServiceOptions><ShippingType>Flat</ShippingType></ShippingDetails><StartPrice currencyID=\"USD\">1</StartPrice><Title>Olala"+System.currentTimeMillis()+"</Title><DispatchTimeMax>1</DispatchTimeMax><ReturnPolicy><Refund>MoneyBack</Refund><ReturnsWithinOption>Days_14</ReturnsWithinOption><ReturnsAcceptedOption>ReturnsAccepted</ReturnsAcceptedOption><ShippingCostPaidByOption>Buyer</ShippingCostPaidByOption></ReturnPolicy><ConditionID>1000</ConditionID></Item></AddItemRequest></soap:Body></soap:Envelope>");
		Request request = new Request.Builder()
		  .url("https://api.sandbox.ebay.com/wsapi?callname=AddItem&siteid=0&client=netsoap")
		  .post(body)
		  .addHeader("content-type", "text/xml; charset=utf-8")
		  .addHeader("soapaction", "\"\"")
		  .addHeader("cache-control", "no-cache")
		  .addHeader("postman-token", "4f6f704e-3136-5ddc-cb54-6570201cf137")
		  .build();

		try {
			Response response = client.newCall(request).execute();
			byte [] data = response.body().bytes();
			return new String(data);
		} catch (IOException e) { 
			e.printStackTrace();
		}
		
		return "";
	}
}

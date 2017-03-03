package com.vn.hungtq.peace.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List; 
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.stream.Collectors;


import javax.servlet.http.HttpServletRequest; 


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.vn.hungtq.peace.common.AjaxResponseResult;
import com.vn.hungtq.peace.common.CommonUtils;
import com.vn.hungtq.peace.dto.CountryGroupDto;
import com.vn.hungtq.peace.dto.CountryDto;
import com.vn.hungtq.peace.dto.EbayShippingAreaDto;
import com.vn.hungtq.peace.dto.EbayShippingMethodDto;
import com.vn.hungtq.peace.dto.NotShippingCountryConfigurationDto;
import com.vn.hungtq.peace.dto.NotShippingCountryDto;
import com.vn.hungtq.peace.dto.UserDto;
import com.vn.hungtq.peace.entity.Country;
import com.vn.hungtq.peace.entity.CountryGroup; 
import com.vn.hungtq.peace.entity.CountryUserMap;
import com.vn.hungtq.peace.entity.EbayAreaShippingMethodMap;
import com.vn.hungtq.peace.entity.EbaySettingLayoutConfiguration;
import com.vn.hungtq.peace.entity.EbayShippingArea;
import com.vn.hungtq.peace.entity.EbayShippingMethod;
import com.vn.hungtq.peace.entity.NotShippingCountry;
import com.vn.hungtq.peace.service.CountryDaoService; 
import com.vn.hungtq.peace.service.CountryUserMapDaoService;
import com.vn.hungtq.peace.service.EbayAreaShippingMethodMapDaoService;
import com.vn.hungtq.peace.service.EbaySettingLayoutConfigurationDaoService;
import com.vn.hungtq.peace.service.NotShippingCountryDaoService;

@Controller
public class EbayShippingSettingController { 
	
	@Autowired
	CountryDaoService countryDaoService; 
	
	@Autowired
	CountryUserMapDaoService countryUserMapDaoService;
	
	@Autowired
	NotShippingCountryDaoService notShippingCountryDaoService;
	
	@Autowired
	EbaySettingLayoutConfigurationDaoService ebaySettingLayoutConfigurationDaoService;
	
	@Autowired
	EbayAreaShippingMethodMapDaoService ebayAreaShippingMethodMapDaoService;
	
	@RequestMapping(value ="/SaveNotShippingCountry" ,method=RequestMethod.POST)
	public @ResponseBody AjaxResponseResult<String> saveNotShippingCountryConfiguration(@RequestBody NotShippingCountryConfigurationDto notShippingCountryConfig,HttpServletRequest request){
		AjaxResponseResult<String> responseResult = new AjaxResponseResult<String>();
		UserDto user = CommonUtils.getUserFromSession(request);
		countryUserMapDaoService.saveUserConfiguration(notShippingCountryConfig,user.getId());
		responseResult.setStatus("OK"); 
		return responseResult;
	} 
	
	@RequestMapping(value ="/GetNotShippingCountry" ,method=RequestMethod.GET)
	public @ResponseBody AjaxResponseResult<NotShippingCountryDto> getNotShippingCountry(HttpServletRequest request){ 
		
		//Response result
		AjaxResponseResult<NotShippingCountryDto> ajaxResult = new AjaxResponseResult<NotShippingCountryDto>();
		
		//Get user id
		UserDto user = CommonUtils.getUserFromSession(request);
		int userId = user.getId();
		
		//Get list of not shipping country 
		List<NotShippingCountry> lstNotShippingCountry = notShippingCountryDaoService.loadAllNotShippingCountry(); 
		if(lstNotShippingCountry.size()>0){ 
			
			//Java 8 stream api
			//Get list of country group id from list of not shipping country
			List<Integer> lstCountryGroupId = lstNotShippingCountry.stream()
																   .map(data ->data.getCountryGroupId())
																   .collect(Collectors.toList()); 
			
			//Get Map of country group with map of country 
			//Key is country groupid and value is the country 
			Map<CountryGroup, List<CountryUserMap>> mapGroupCountry = countryDaoService.getMapOfCountryByGroup(lstCountryGroupId,userId); 
			
			//Wrapping all to dto object then response to client
			//First create NotShippingCountryDto
			NotShippingCountryDto nscCountryDto = new NotShippingCountryDto();
			ajaxResult.setExtraData(nscCountryDto);
			
			List<CountryGroupDto> lstCoutryGroupDto =  mapGroupCountry.entrySet().stream().map(entries ->{ 
				//Get key and value
				CountryGroup countryGroup = entries.getKey();
				List<CountryUserMap> lstCountry  = entries.getValue();
				
				//Create dto object
				CountryGroupDto countryGroupDto = new CountryGroupDto();
				countryGroupDto.setId(countryGroup.getId());
				countryGroupDto.setName(countryGroup.getName());
				
				List<CountryDto> lstCountryDto = lstCountry.stream().map(countryUserMap ->{
					Country country = countryUserMap.getCountry();
					CountryDto countryDto = new CountryDto();
					countryDto.setId(country.getId());
					countryDto.setName(country.getName());
					countryDto.setUserId(userId);
					countryDto.setSelected(countryUserMap.getIsSelect());
					
					return countryDto;
				}).collect(Collectors.toList());
				
				countryGroupDto.setLstCountries(lstCountryDto); 
				return countryGroupDto;
			}).collect(Collectors.toList());
			
			nscCountryDto.setLstCountryGroup(lstCoutryGroupDto);
		}
		
		return ajaxResult;
	} 
	
	@RequestMapping(value="/GetLayoutAreaSetting/{layoutAreaId}",method =RequestMethod.GET)
	public @ResponseBody AjaxResponseResult<List<EbayShippingAreaDto>> getLayoutAreaSetting(@PathVariable("layoutAreaId") int layoutAreaId){
		
		//Get list ebay setting layout config 
		List<EbaySettingLayoutConfiguration> lstEbaySettingLayoutConfig = ebaySettingLayoutConfigurationDaoService.getLayoutSettingConfig(layoutAreaId);
		
		//The response data
		AjaxResponseResult<List<EbayShippingAreaDto>> ajaxResult = new AjaxResponseResult<>(); 
		
		//The list id of shipping area  
		List<Integer> lstShippingAreaIds = lstEbaySettingLayoutConfig.stream().map(ebaySettingLayoutConfig ->{
													return ebaySettingLayoutConfig.getEbayShippingArea().getId();
										    }).collect(Collectors.toList());
		
		//Get the area mapping with shipping method
		//Follow the list of shipping area id
		//It return the concurrent collection 
		//Because latter use it on concurrent context
		CopyOnWriteArrayList<EbayAreaShippingMethodMap> lstEbayAreaShippingMethodMap = ebayAreaShippingMethodMapDaoService.getShippingMethodFollowArea(lstShippingAreaIds);
		
		//The map of shipping area with shipping method
		Map<EbayShippingArea,List<EbayShippingMethod>> mapAreaWithShippingMethod = new HashMap<>();
		lstEbayAreaShippingMethodMap.stream().peek(s ->{
			EbayShippingArea area = s.getEbayShippingArea();
			EbayShippingMethod shipMethod = s.getEbayShippingMethod();
			
			if(mapAreaWithShippingMethod.containsKey(area)){
				mapAreaWithShippingMethod.get(area).add(shipMethod);
			}else{
				List<EbayShippingMethod> lstEbayShippingMethod = new ArrayList<>();
				lstEbayShippingMethod.add(shipMethod);
				mapAreaWithShippingMethod.put(area, lstEbayShippingMethod);
			}
		}).count();
		
		//Process lstEbayShippingAreaDto
		List<EbayShippingAreaDto> lstEbayShippingAreaDto =
		mapAreaWithShippingMethod.entrySet().stream().map(s->{
			EbayShippingArea area = s.getKey();
			List<EbayShippingMethod> lstShipMethod = s.getValue();
			
			EbayShippingAreaDto ebayShippingAreaDto = new EbayShippingAreaDto();
			ebayShippingAreaDto.setAreaName(area.getName());
			ebayShippingAreaDto.setLstEbayShippingMethods(lstShipMethod.stream()
																	   .map(sMethod->{
																				return new EbayShippingMethodDto(sMethod.getId(), sMethod.getName());
																		}).collect(Collectors.toList())); 
			
			return ebayShippingAreaDto;
		}).collect(Collectors.toList());
		
		//Set data to ajax result
		ajaxResult.setExtraData(lstEbayShippingAreaDto);
		return ajaxResult;
	}
}

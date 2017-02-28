package com.vn.hungtq.peace.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vn.hungtq.peace.common.AjaxResponseResult;
import com.vn.hungtq.peace.common.CommonUtils;
import com.vn.hungtq.peace.common.Tuple;
import com.vn.hungtq.peace.dto.UserDto;
import com.vn.hungtq.peace.dto.UserTemplateDto;
import com.vn.hungtq.peace.entity.UserTemplate;
import com.vn.hungtq.peace.service.UserTemplateDaoService;

@Controller
@Scope("session")
public class EbaySettingController {
	private final Logger logger = LoggerFactory.getLogger(EbaySettingController.class);
	
	@Autowired
	UserTemplateDaoService userTemplateDaoService;
	
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
	
	@RequestMapping("/SetEbayLogin")
	public ModelAndView actionSetEbayLogin(){
		return new ModelAndView("/pages/G_SetEbayLogin");
	}
	
	@RequestMapping("/ListResearchAll")
	public ModelAndView listSearchAll(){ 
		return new ModelAndView("/pages/G_ListResearchAll");
	}
	
	@RequestMapping(value ="/CustomTemplateUpload",method=RequestMethod.POST)
	public @ResponseBody AjaxResponseResult uploadTemplate(@RequestBody UserTemplateDto templateUploadDto,
											  HttpServletRequest request){ 
		Tuple<Boolean,String> validateResult = CommonUtils.tryToValidateUserTemplate(templateUploadDto);
		AjaxResponseResult ajaxResult = new AjaxResponseResult();
		
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
}

package com.vn.hungtq.peace.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EbaySettingController {
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
}

package com.vn.hungtq.peace.controller;
 
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vn.hungtq.peace.common.AjaxResponseResult;
import com.vn.hungtq.peace.dto.EbayProductSearch;

@Controller
public class EbayProductListController {
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
	public @ResponseBody AjaxResponseResult<List<EbayProductSearch>> getListSell(@PathVariable("type") int type){
		AjaxResponseResult<List<EbayProductSearch>> resposeResult = new AjaxResponseResult<List<EbayProductSearch>>();
		resposeResult.setStatus("OK"); 
		
		List<EbayProductSearch> lstEbayProductSearch =
		IntStream.range(1, 100).boxed().map(num->{
			return new EbayProductSearch("Title"+num, "EndTime"+num, "listPrice","USD", "Person"+num, "No", "No","No","No");
		}).collect(Collectors.toList());
		
		resposeResult.setExtraData(lstEbayProductSearch);
		return resposeResult; 
	}
}

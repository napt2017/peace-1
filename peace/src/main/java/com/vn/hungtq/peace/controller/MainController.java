package com.vn.hungtq.peace.controller;

import java.io.UnsupportedEncodingException;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.authentication.AuthenticationTrustResolverImpl;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriUtils;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.vn.hungtq.peace.common.AjaxResponseResult;
import com.vn.hungtq.peace.common.AmazonServiceInfo;
import com.vn.hungtq.peace.common.CommonUtils;
import com.vn.hungtq.peace.common.EbayServiceInfo;
import com.vn.hungtq.peace.common.ProductSearch;
import com.vn.hungtq.peace.common.RakutenServiceInfo;
import com.vn.hungtq.peace.common.YahooServiceInfo;
import com.vn.hungtq.peace.dto.AccountSettingDto;
import com.vn.hungtq.peace.dto.UserDto;
import com.vn.hungtq.peace.entity.AccountSetting;
import com.vn.hungtq.peace.entity.User;
import com.vn.hungtq.peace.service.AccountSettingDaoService;
import com.vn.hungtq.peace.service.UserDaoService;

@Controller
public class MainController {
	private final Logger logger = LoggerFactory.getLogger(MainController.class);

	private static final String VIEW_INDEX = "/pages/index";
	private static final String VIEW_HOME = "/pages/G_Home";
	private static final String VIEW_ACCESS_DENIED= "/pages/accessDenied";
	
	@Autowired
	AmazonServiceInfo amazonServiceInfo;

	@Autowired
	private UserDaoService userService;
	
	@Autowired
	private RakutenServiceInfo rakutenServiceInfomation;
	
	@Autowired
	private YahooServiceInfo yahooServiceInfo;
	
	@Autowired
	private EbayServiceInfo ebayServiceInfomation;
	
	@Autowired
	MessageSource messageSource;
	
	@Autowired
	AccountSettingDaoService accountSettingDaoService;
	
	@RequestMapping(value ="/", method = RequestMethod.GET)
	public String welcome(Locale locale, ModelMap model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		// Get user sso
		final Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication.getPrincipal() instanceof String) {
			return "redirect:/login";
		}
		org.springframework.security.core.userdetails.User userSSO = (org.springframework.security.core.userdetails.User) authentication.getPrincipal();
		
		// Get user from db
		User user = userService.findBySSO(userSSO.getUsername());
		
		// Assign to Dto
		UserDto userDto = new UserDto();
		userDto.setId(user.getId());
		userDto.setUsername(user.getUsername());
		model.addAttribute("formLogin", userDto);
		
		// Spring uses InternalResourceViewResolver and return back index.jsp
		return VIEW_HOME;

	}
	
	/**
	 * This method handles login GET requests.
	 * If users is already logged-in and tries to goto login page again, will be redirected to list page.
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage(Locale locale, ModelMap model) {
		if (isCurrentAuthenticationAnonymous()) {
			UserDto userDto = new UserDto();
			model.addAttribute("formLogin", userDto);
			return VIEW_INDEX;
	    } else {
	    	return "redirect:/";  
	    }
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute("formLogin") UserDto userDto,
			HttpServletRequest request,
			final RedirectAttributes redirectAttributes) {

		logger.debug("begin login: ", userDto.getUsername());

		User user = userService.findBySSO(userDto.getUsername());

		if (user != null) {
			userDto.setId(user.getId());
			request.getSession().setAttribute("user", userDto);
			return "redirect:/index";
		} else {
			redirectAttributes.addFlashAttribute("msg",
					"Username or password invalid!");
			redirectAttributes.addFlashAttribute("username",
					userDto.getUsername());
			return "redirect:/";
		}
	}
	
	@RequestMapping(value = { "/index" }, method = RequestMethod.GET)
	public String index(ModelMap model, HttpServletRequest request) {
		UserDto userDto = (UserDto) request.getSession().getAttribute("user");
		if (userDto == null) {
			return "redirect:/";
		}
		model.addAttribute("formLogin", userDto);
		// Spring uses InternalResourceViewResolver and return back index.jsp
		return VIEW_HOME;

	} 
	
	@RequestMapping("ContactUs")
	public ModelAndView contactUs(){
		return  new ModelAndView("/pages/G_Contract");
	}
	
	@RequestMapping("SetAccount")
	public ModelAndView setAccount(){
		return  new ModelAndView("/pages/G_SetAccount");
	}
	
	@RequestMapping(value ="/GetAccountSetting",method=RequestMethod.GET)
	public @ResponseBody AjaxResponseResult<AccountSettingDto> getAccountSetting(){
		AjaxResponseResult<AccountSettingDto> responseResult = new AjaxResponseResult<AccountSettingDto>();
		responseResult.setStatus("Ok");
		
		//Default set record id 
		responseResult.setRecordId(-1);
		
		//Get user id
		final Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		UserDto user = CommonUtils.getUserFromSession((org.springframework.security.core.userdetails.User)authentication.getPrincipal(), userService);
		int userId = user.getId();
		
		Optional<AccountSetting> optionalOfAccountSetting = accountSettingDaoService.loadAccountSettingByUser(userId);
		optionalOfAccountSetting.ifPresent(ac->{
			AccountSettingDto asDto = new AccountSettingDto();
			asDto.setAmazonAccessKey(ac.getAmazonAccessKey());
			asDto.setAmazoneId(ac.getAmazoneId());
			asDto.setAmazonSecretKey(ac.getAmazonSecretKey());
			asDto.setIsDeliver(ac.getIsDeliver());
			asDto.setIsImmediateStettlement(ac.getIsImmediateStettlement());
			asDto.setPaypalEmail(ac.getPaypalEmail());
			asDto.setEmail(user.getEmail());
			asDto.setId(ac.getId());
			
			responseResult.setRecordId(ac.getId());
			responseResult.setExtraData(asDto);  
		}); 
		
		return responseResult;
	}
	
	@RequestMapping(value="ChangeUserPasswordEmail",method = RequestMethod.POST)
	public @ResponseBody AjaxResponseResult<String> changeUserPasswordEmail(@RequestBody UserDto userDto){
		AjaxResponseResult<String> responseResult = new AjaxResponseResult<String>();
		responseResult.setStatus("OK");
		
		//Get current user from session
		final Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		UserDto user = CommonUtils.getUserFromSession((org.springframework.security.core.userdetails.User)authentication.getPrincipal(), userService);
		int userId = user.getId();
		
		//Encrypt password
		String encryptPassword = CommonUtils.encryptPassword(userDto.getPassword());
		
		//Load user from db
		User dbUser = userService.getUserById(userId);
		dbUser.setEmail(userDto.getEmail());
		dbUser.setPassword(encryptPassword);
		
		//Update
		userService.updateUser(dbUser);
		
		return responseResult;
	}
	
	@RequestMapping(value="SaveAccountSetting",method = RequestMethod.POST)
	public @ResponseBody AjaxResponseResult<String> saveAccountSetting(@RequestBody AccountSettingDto accountSettingDto){
		AjaxResponseResult<String> responseResult = new AjaxResponseResult<String>();
		responseResult.setStatus("OK");
		AccountSetting acSetting ;
		//Get user id
		final Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		UserDto user = CommonUtils.getUserFromSession((org.springframework.security.core.userdetails.User)authentication.getPrincipal(), userService);
		int userId = user.getId();
				
		Optional<AccountSetting> optionalOfAccoutSetting = accountSettingDaoService.loadAccountSettingByUser(userId);
		if(optionalOfAccoutSetting.isPresent()){
			acSetting = optionalOfAccoutSetting.get();
			acSetting.setAmazonAccessKey(accountSettingDto.getAmazonAccessKey());
			acSetting.setAmazoneId(accountSettingDto.getAmazoneId());
			acSetting.setAmazonSecretKey(accountSettingDto.getAmazonSecretKey());
			acSetting.setIsDeliver(accountSettingDto.getIsDeliver());
			acSetting.setIsImmediateStettlement(accountSettingDto.getIsImmediateStettlement());
			acSetting.setPaypalEmail(accountSettingDto.getPaypalEmail());
			acSetting.setId(accountSettingDto.getId());
			
			//Update to db
			accountSettingDaoService.updateAccountSetting(acSetting);
		}else{
			//Convert data
			acSetting = new AccountSetting();
			acSetting.setAmazonAccessKey(accountSettingDto.getAmazonAccessKey());
			acSetting.setAmazoneId(accountSettingDto.getAmazoneId());
			acSetting.setAmazonSecretKey(accountSettingDto.getAmazonSecretKey());
			acSetting.setIsDeliver(accountSettingDto.getIsDeliver());
			acSetting.setIsImmediateStettlement(accountSettingDto.getIsImmediateStettlement());
			acSetting.setPaypalEmail(accountSettingDto.getPaypalEmail());
			acSetting.setId(accountSettingDto.getId());
			acSetting.setUserId(userId);
			
			//Save to db
			accountSettingDaoService.saveAccountSetting(acSetting);
		} 
		
		return responseResult;
	}
	
	@RequestMapping(value ="/AmazoneGetServiceUrl/{keyword}",method=RequestMethod.POST)
	public @ResponseBody String amazoneGetServiceUrl(@PathVariable(value = "keyword") String keyword){
		return CommonUtils.buildAmazonServiceUrl(keyword,amazonServiceInfo);
	}
	
	@RequestMapping(value ="/EbayProductSearch/{keyword}",method=RequestMethod.GET)
	public @ResponseBody String ebaySearchProductByKeyword(@PathVariable(value = "keyword") String keyword){
		String productSearchUrl = CommonUtils.buildEbayServiceUrl(keyword, ebayServiceInfomation);
		logger.debug("The ebay service search url :" +productSearchUrl);
		return CommonUtils.getHTMLContent(productSearchUrl);
	}
	
	@RequestMapping(value ="/YahooProductSearch/{keyword}",method=RequestMethod.GET)
	public @ResponseBody String yahooSearchProductByKeyword(@PathVariable(value = "keyword") String keyword){
		String productSearchUrl = CommonUtils.buildYahooServiceUrl(keyword, yahooServiceInfo);
		logger.debug("yahoo appid:"+yahooServiceInfo.getAppid());
		logger.debug("The yahoo service search url :" +productSearchUrl);
		return CommonUtils.getHTMLContent(productSearchUrl);
	}
	
	@RequestMapping(value ="/RakutenProductSearch/{keyword}",method=RequestMethod.GET)
	public @ResponseBody List<ProductSearch> rakutenSearchProductByKeyword(@PathVariable(value = "keyword") String keyword){
		String finalUrl = MessageFormat.format(rakutenServiceInfomation.getServiceUrl(),rakutenServiceInfomation.getAppid(),keyword); 
		String responseContent = CommonUtils.getHTMLContent(finalUrl);
		
		if(!"".equals(responseContent)){
			JsonParser jsonParser = new JsonParser();
			JsonObject responseJsonObject = jsonParser.parse(responseContent).getAsJsonObject();
			JsonArray itemJsonArrayObject = responseJsonObject.getAsJsonArray("Items");
			
			int totalItem = itemJsonArrayObject.size();
			List<ProductSearch> lstProductSearch = new ArrayList<ProductSearch>(totalItem);
			
			for (int itemIndex = 0; itemIndex < totalItem; itemIndex++) {
				JsonObject itemJsonObject = (JsonObject)itemJsonArrayObject.get(itemIndex);
				itemJsonObject = itemJsonObject.getAsJsonObject("Item");
	
				String productName = itemJsonObject.get("itemName").getAsString();
				String price = itemJsonObject.get("itemPrice").getAsString();
				String exhibition = itemJsonObject.get("itemUrl").getAsString();
				String stock ="";
				
				JsonArray imageUrls = itemJsonObject.get("mediumImageUrls").getAsJsonArray();
				if(imageUrls.size()==0){
					imageUrls = itemJsonObject.get("smallImageUrls").getAsJsonArray(); 
				}
				//May be set default image here when product has not image -fix later
				String image = imageUrls.size()==0?"":imageUrls.get(0).getAsJsonObject().get("imageUrl").getAsString(); 
				lstProductSearch.add(new ProductSearch(image, productName, price, stock, exhibition)); 
			}
			
			return lstProductSearch;
		}else{
			System.out.println("Empty response content!!!");
		}
		
		return Collections.emptyList();
	} 
	
	 @RequestMapping(value="/CheckPassword/{rawPassword}", method = RequestMethod.GET)
	 public @ResponseBody AjaxResponseResult<Boolean> checkPassword(@PathVariable("rawPassword") String rawPassword){
		AjaxResponseResult<Boolean> responseResult = new AjaxResponseResult<Boolean>();
		responseResult.setStatus("OK");
		
		//Get user id
		final Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		UserDto user = CommonUtils.getUserFromSession((org.springframework.security.core.userdetails.User)authentication.getPrincipal(), userService);
		int userId = user.getId();
		
		//Decode password 
		try {
			rawPassword = UriUtils.decode(rawPassword, "UTF-8");
		} catch (UnsupportedEncodingException e) { 
			e.printStackTrace();
		}
		
		//Check
		boolean isCorrect = userService.isPasswordCorrect(userId, rawPassword);
		responseResult.setExtraData(isCorrect);
		
		return responseResult;		 
	 }
	
	
	/**
     * This method handles logout requests.
     * Toggle the handlers if you are RememberMe functionality is useless in your app.
     */
    @RequestMapping(value="/logout", method = RequestMethod.GET)
    public String logoutPage (HttpServletRequest request, HttpServletResponse response){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){    
            new SecurityContextLogoutHandler().logout(request, response, auth);
//            persistentTokenBasedRememberMeServices.logout(request, response, auth);
            SecurityContextHolder.getContext().setAuthentication(null);
        }
        return "redirect:/login?logout";
    }
    
	/**
	 * This method handles Access-Denied redirect.
	 */
	@RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
	public String accessDeniedPage(ModelMap model) {
		model.addAttribute("loggedinuser", getPrincipal());
		return VIEW_ACCESS_DENIED;
	}
	
	/**
	 * This method returns the principal[user-name] of logged-in user.
	 */
	private String getPrincipal(){
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails)principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}
	
	/**
	 * This method returns true if users is already authenticated [logged-in], else false.
	 */
	private boolean isCurrentAuthenticationAnonymous() {
	    final Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    AuthenticationTrustResolverImpl authenticationTrustResolver = new AuthenticationTrustResolverImpl();
	    
	    return authenticationTrustResolver.isAnonymous(authentication);
	}
	
	
}

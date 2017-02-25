package com.vn.hungtq.peace.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.vn.hungtq.peace.dto.UserDto;
import com.vn.hungtq.peace.entity.User;
import com.vn.hungtq.peace.service.UserDaoService;

@Controller
public class MainController {
	private final Logger logger = LoggerFactory.getLogger(MainController.class);

	private static final String VIEW_INDEX = "/pages/index";
	private static final String VIEW_HOME = "/pages/G_Home";

	@Autowired
	private UserDaoService userService;
	
	@RequestMapping(value ="/", method = RequestMethod.GET)
	public String welcome(Locale locale, ModelMap model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		UserDto userDto = new UserDto();
		model.addAttribute("formLogin", userDto);
		// Spring uses InternalResourceViewResolver and return back index.jsp
		return VIEW_INDEX;

	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute("formLogin") UserDto userDto,
			HttpServletRequest request,
			final RedirectAttributes redirectAttributes) {

		logger.debug("begin login: ", userDto.getUsername());

		User user = userService.getUserByUserAndPass(userDto.getUsername(),
				userDto.getPassword());
		if (user != null) {
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
}

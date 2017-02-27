package com.vn.hungtq.peace.controller;
  
import javax.servlet.http.HttpServletRequest;  

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Controller;    
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod; 
import org.springframework.web.bind.annotation.ResponseBody; 

import com.vn.hungtq.peace.common.CommonUtils;
import com.vn.hungtq.peace.common.GmailConfiguration;
import com.vn.hungtq.peace.common.PeaceContactEmail;
import com.vn.hungtq.peace.common.Tuple;
import com.vn.hungtq.peace.entity.Contact;
import com.vn.hungtq.peace.service.ContactDaoService;

/**
 * 
 *  The ContactControler class
 *  Handing the bussiness logic of user contact
 *  Save user contact to data base then send email
 *  to the user
 *  
 *  @author napt2017 
 * 
 * 
 * **/

@Controller 
public class ContactController {  
	
	@Autowired
	ContactDaoService contactDAO;
	
	@Autowired
	PeaceContactEmail peaceContactEmail;
	
	@Autowired
	GmailConfiguration gmailConfiguration;
	
	@RequestMapping(value = "/Contact",method=RequestMethod.POST)
	public @ResponseBody String actionContact(@RequestBody Contact contact, HttpServletRequest request){ 
		//Validate model data
		Tuple<Boolean,String> isVaild = CommonUtils.tryToValidateContactModel(contact);
		if(isVaild.getFirst()){ 
			
			//Save to database
			contactDAO.saveContact(contact); 
			
			//Send mail
			Tuple<Boolean,String> sendMailStatus = CommonUtils.sendEmailContact("Peac Contact Mail",contact,peaceContactEmail,gmailConfiguration);
			if(sendMailStatus.getFirst()){
				System.out.println("Send mail ok!");
				return "Success";
			}
			
			return sendMailStatus.getSecond();
		}
		
		return isVaild.getSecond();
	}  
}

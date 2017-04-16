package com.vn.hungtq.peace.service.impl;
 
import java.util.List;
 


import org.apache.commons.collections.CollectionUtils;

import com.vn.hungtq.peace.entity.UserTemplate;
import com.vn.hungtq.peace.service.UserTemplateDaoService;

public class UserTemplateDaoServiceImpl extends BaseDaoServiceImpl implements UserTemplateDaoService { 

	@Override
	public void saveUserTemplate(UserTemplate userTemplate) { 
		getCurrentSession().save(userTemplate); 
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<UserTemplate> getListTemplateOfUser(int userId) {
		return (List<UserTemplate>)getCurrentSession().createQuery("from UserTemplate where userId= ?")
														 .setParameter(0, userId)
														 .list(); 
	}

	@Override
	public UserTemplate getUserTemplateById(int templateId) {
		@SuppressWarnings("unchecked")
		List<UserTemplate> lstUserTemplate =  (List<UserTemplate>)getCurrentSession().createQuery("from UserTemplate where id= ?")
																					 .setParameter(0, templateId)
																					 .list(); 
		if(!CollectionUtils.isEmpty(lstUserTemplate)){
			return lstUserTemplate.get(0);
		}
		
		return null;
	}

	@Override
	public void updateUserTemplate(UserTemplate userTemplate) {
		getCurrentSession().update(userTemplate);
	}

	@Override
	public void updateDefaultTemplate(int id) {
		//Get last default template
		List<UserTemplate> lstUserTemplate = getCurrentSession().createQuery("from UserTemplate where isDefault = ?").setParameter(0,true).list();
		if(lstUserTemplate.size()>0){
			for(UserTemplate userTemplate : lstUserTemplate){
				userTemplate.setIsDefault(false);
				updateUserTemplate(userTemplate);
			}
		}

		//Get update user template
		UserTemplate updateDefaultTempate = getUserTemplateById(id);
		if(updateDefaultTempate!=null){
			updateDefaultTempate.setIsDefault(true);
			updateUserTemplate(updateDefaultTempate);
		}
	}
}

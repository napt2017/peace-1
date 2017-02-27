package com.vn.hungtq.peace.service;
 
import com.vn.hungtq.peace.entity.UserTemplate; 
import java.util.List;

public interface UserTemplateDaoService {
	void saveUserTemplate(UserTemplate userTemplate);
	List<UserTemplate> getListTemplateOfUser(int userId);
	UserTemplate getUserTemplateById(int templateId);
	void updateUserTemplate(UserTemplate userTemplate);
}

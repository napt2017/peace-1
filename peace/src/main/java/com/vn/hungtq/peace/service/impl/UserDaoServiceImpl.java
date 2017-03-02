package com.vn.hungtq.peace.service.impl;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.config.authentication.PasswordEncoderParser;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.vn.hungtq.peace.entity.User;
import com.vn.hungtq.peace.entity.UserRole;
import com.vn.hungtq.peace.service.UserDaoService;

public class UserDaoServiceImpl extends BaseDaoServiceImpl implements UserDaoService{
	static final Logger logger = LoggerFactory.getLogger(UserDaoServiceImpl.class);
	@Override
	public User findById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User findBySSO(String sso) {
		logger.info("SSO : {}", sso);
		Criteria crit = getCurrentSession().createCriteria(User.class);
		crit.add(Restrictions.eq("username", sso));
		User user = (User)crit.uniqueResult();
		if(user!=null){
			Hibernate.initialize(user.getUserRoles());
		}
		return user;
	}

	@Override
	public void save(User user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBySSO(String sso) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<User> findAllUsers() {
		// TODO Auto-generated method stub
		return null;
	}



}

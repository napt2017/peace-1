package com.vn.hungtq.peace.service.impl;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;

import com.vn.hungtq.peace.entity.User;
import com.vn.hungtq.peace.service.UserDaoService;

public class UserDaoServiceImpl extends BaseDaoServiceImpl implements UserDaoService{

	@Override
	public User getUserByUserAndPass(String username, String pass) {
		@SuppressWarnings("unchecked")
		List<User> users = (List<User>) getCurrentSession()
				.createQuery("from User where username = ? and password = ?")
				.setParameter(0, username)
				.setParameter(1, pass).list();
		if (CollectionUtils.isNotEmpty(users)) {
			return users.get(0);
		}
		return null;
	}

	@Override
	public User addUser() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User updateUser() {
		// TODO Auto-generated method stub
		return null;
	}

}

package com.vn.hungtq.peace.service;

import com.vn.hungtq.peace.entity.User;

public interface UserDaoService {
	public User getUserByUserAndPass(String username, String pass);
	public User addUser();
	public User updateUser();
}

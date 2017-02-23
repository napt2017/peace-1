package com.vn.hungtq.peace.service.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import com.vn.hungtq.peace.service.BaseDaoService;

@Transactional
public class BaseDaoServiceImpl implements BaseDaoService{
	SessionFactory sessionFactory; 
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Session getCurrentSession() {
		return this.sessionFactory.getCurrentSession();
	}

}

package com.vn.hungtq.peace.service;

import org.hibernate.Criteria;
import org.hibernate.Session;

public interface BaseDaoService {
	public Session getCurrentSession();
	Criteria createEntityCriteria(Class<?> c);
}

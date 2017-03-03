package com.vn.hungtq.peace.service.impl;

import java.util.List;

import com.vn.hungtq.peace.entity.NotShippingCountry;
import com.vn.hungtq.peace.service.NotShippingCountryDaoService;

public class NotShippingCountryDaoServiceImpl extends BaseDaoServiceImpl implements NotShippingCountryDaoService {

	@SuppressWarnings("unchecked")
	@Override
	public List<NotShippingCountry> loadAllNotShippingCountry() { 
		return getCurrentSession().createQuery("from NotShippingCountry where isActive =?").setParameter(0, true).list(); 
	} 
}

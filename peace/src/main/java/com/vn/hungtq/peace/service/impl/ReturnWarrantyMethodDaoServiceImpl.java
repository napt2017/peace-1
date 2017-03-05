package com.vn.hungtq.peace.service.impl;

import java.util.List;

import com.vn.hungtq.peace.entity.ReturnWarrantyMethod;
import com.vn.hungtq.peace.service.ReturnWarrantyMethodDaoService;

public class ReturnWarrantyMethodDaoServiceImpl extends BaseDaoServiceImpl implements ReturnWarrantyMethodDaoService {

	@SuppressWarnings("unchecked")
	@Override
	public List<ReturnWarrantyMethod> getAllReturnWarrantyMethod() {
		return getCurrentSession().createQuery("from ReturnWarrantyMethod").list();
	} 
}

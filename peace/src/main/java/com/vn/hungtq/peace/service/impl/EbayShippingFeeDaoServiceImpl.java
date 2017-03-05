package com.vn.hungtq.peace.service.impl;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;

import com.vn.hungtq.peace.common.Tuple;
import com.vn.hungtq.peace.entity.EbayShippingFee;
import com.vn.hungtq.peace.service.EbayShippingFeeDaoService;

public class EbayShippingFeeDaoServiceImpl extends BaseDaoServiceImpl implements EbayShippingFeeDaoService {

	@Override
	public Tuple<Boolean, EbayShippingFee> checkExistEbayShippingFee(int userId) {
		@SuppressWarnings("unchecked")
		List<EbayShippingFee> lstEbayShippingFee = getCurrentSession().createQuery("from EbayShippingFee where userId =?")
																	  .setParameter(0, userId)
																	  .list();
		if(!CollectionUtils.isEmpty(lstEbayShippingFee)){
			return Tuple.make(true, lstEbayShippingFee.get(0));
		}
		return Tuple.make(false, null);
	}

	@Override
	public void addEbayShippingFee(EbayShippingFee ebayShippingFee) {
		getCurrentSession().save(ebayShippingFee);
	}

	@Override
	public void upadateEbayShippingFee(EbayShippingFee ebayShippingFee) {
		getCurrentSession().update(ebayShippingFee);
	} 
}

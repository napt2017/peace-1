package com.vn.hungtq.peace.service.impl;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;

import com.vn.hungtq.peace.common.Tuple;
import com.vn.hungtq.peace.entity.EbayDeliveryMethod;
import com.vn.hungtq.peace.service.EbayDeliveryMethodDaoService;

public class EbayDeliveryMethodDaoServiceImpl extends BaseDaoServiceImpl implements EbayDeliveryMethodDaoService {

	@Override
	public void saveEbayDeliveryMethod(EbayDeliveryMethod ebayDeliverMethod) {
		 getCurrentSession().save(ebayDeliverMethod);
	}

	@Override
	public Tuple<Boolean, EbayDeliveryMethod> isExistDeliveryMethod(int userId) {
		@SuppressWarnings("unchecked")
		List<EbayDeliveryMethod> lstDeliveryMethod = getCurrentSession().createQuery("from EbayDeliveryMethod where userId =?")
																	    .setParameter(0, userId)
																	    .list();
		if(CollectionUtils.isEmpty(lstDeliveryMethod)){
			return Tuple.make(false, null);
		}
		
		return Tuple.make(true, lstDeliveryMethod.get(0));
	}

	@Override
	public void updateEbayDeliveryMethod(EbayDeliveryMethod ebayDeliverMethod) {
		getCurrentSession().update(ebayDeliverMethod);
	} 
}

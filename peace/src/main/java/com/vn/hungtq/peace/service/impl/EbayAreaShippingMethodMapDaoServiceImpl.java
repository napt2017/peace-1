package com.vn.hungtq.peace.service.impl;

import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.stream.Collectors;

import org.hibernate.Query;

import com.vn.hungtq.peace.common.CommonUtils;
import com.vn.hungtq.peace.entity.EbayAreaShippingMethodMap;
import com.vn.hungtq.peace.service.EbayAreaShippingMethodMapDaoService;

public class EbayAreaShippingMethodMapDaoServiceImpl extends BaseDaoServiceImpl implements EbayAreaShippingMethodMapDaoService {

	@SuppressWarnings("unchecked")
	@Override
	public CopyOnWriteArrayList<EbayAreaShippingMethodMap> getShippingMethodFollowArea(List<Integer> lstShippingAreaId) { 
		int size = lstShippingAreaId.size();
		String questionMark = CommonUtils.buildQuestionMark(size);
		String sqlQuery = "from EbayAreaShippingMethodMap where ebayShippingArea.id in "+questionMark;
		Query query  = getCurrentSession().createQuery(sqlQuery);
		for(int paramIndex = 0;paramIndex<size;paramIndex++){
			query.setParameter(paramIndex, lstShippingAreaId.get(paramIndex));
		}
		
		List<EbayAreaShippingMethodMap> lstTemp =  query.list(); 
		return lstTemp.stream().collect(Collectors.toCollection(CopyOnWriteArrayList::new));
	} 
}

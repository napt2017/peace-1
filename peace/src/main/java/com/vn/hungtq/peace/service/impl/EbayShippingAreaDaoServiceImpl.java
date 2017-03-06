package com.vn.hungtq.peace.service.impl;

import java.util.List; 

import org.hibernate.Query;

import com.vn.hungtq.peace.common.CommonUtils;
import com.vn.hungtq.peace.entity.EbayShippingArea;
import com.vn.hungtq.peace.service.EbayShippingAreaDaoService;

public class EbayShippingAreaDaoServiceImpl extends BaseDaoServiceImpl implements EbayShippingAreaDaoService {

	@SuppressWarnings("unchecked")
	@Override
	public List<EbayShippingArea> loadEbayShippingArea(List<Integer> lstShippingAreaIds) {
		int len = lstShippingAreaIds.size();
		String questionMark = CommonUtils.buildQuestionMark(len);
		String sqlQuery = "from EbayShippingArea where id in" +questionMark;
		Query query = getCurrentSession().createQuery(sqlQuery);
		for(int paramIndex =0;paramIndex<len;paramIndex++){
			query.setParameter(paramIndex, lstShippingAreaIds.get(paramIndex));
		}
		
		return  query.list(); 
	} 
}

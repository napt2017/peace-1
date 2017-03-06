package com.vn.hungtq.peace.service.impl;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;




import javassist.expr.NewArray;


import com.mchange.v2.collection.MapEntry;
import com.vn.hungtq.peace.common.Tuple;
import com.vn.hungtq.peace.entity.EbaySettingLayoutConfiguration;
import com.vn.hungtq.peace.entity.EbayShippingArea;
import com.vn.hungtq.peace.service.EbaySettingLayoutConfigurationDaoService;

public class EbaySettingLayoutConfigurationDaoServiceImpl extends BaseDaoServiceImpl implements EbaySettingLayoutConfigurationDaoService {

	@SuppressWarnings("unchecked")
	@Override
	public List<EbaySettingLayoutConfiguration> getLayoutSettingConfig(int layoutAreaId) {
		
		return getCurrentSession().createQuery("from EbaySettingLayoutConfiguration where layoutSettingArea.id =? order by order")
								  .setParameter(0, layoutAreaId)
								  .list(); 
	}

	@Override
	public List<EbayShippingArea> getEbayShippingAreaFollowLayoutArea(int layoutAreaId) {
		List<EbaySettingLayoutConfiguration> lstEbaySettingLayoutConfig= this.getLayoutSettingConfig(layoutAreaId); 
		return lstEbaySettingLayoutConfig.stream().map(s->s.getEbayShippingArea()).collect(Collectors.toList());
	}

	@Override
	public List<Tuple<Integer, EbayShippingArea>> getEbayShippingAreaOrder(int layoutAreaId) {
		List<EbaySettingLayoutConfiguration> lstEbaySettingLayoutConfig= this.getLayoutSettingConfig(layoutAreaId); 
		return lstEbaySettingLayoutConfig.stream().map(s->{
											return Tuple.make(s.getOrder(), s.getEbayShippingArea());
										 }).collect(Collectors.toList()); 
	} 
}

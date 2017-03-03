package com.vn.hungtq.peace.service.impl;

import java.util.List;

import com.vn.hungtq.peace.entity.EbaySettingLayoutConfiguration;
import com.vn.hungtq.peace.service.EbaySettingLayoutConfigurationDaoService;

public class EbaySettingLayoutConfigurationDaoServiceImpl extends BaseDaoServiceImpl implements EbaySettingLayoutConfigurationDaoService {

	@SuppressWarnings("unchecked")
	@Override
	public List<EbaySettingLayoutConfiguration> getLayoutSettingConfig(int layoutAreaId) {
		
		return getCurrentSession().createQuery("from EbaySettingLayoutConfiguration where layoutSettingArea.id =?")
								  .setParameter(0, layoutAreaId)
								  .list(); 
	} 
}

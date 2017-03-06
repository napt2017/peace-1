package com.vn.hungtq.peace.service;
import java.util.List; 

import com.vn.hungtq.peace.common.Tuple;
import com.vn.hungtq.peace.entity.EbaySettingLayoutConfiguration;
import com.vn.hungtq.peace.entity.EbayShippingArea;

public interface EbaySettingLayoutConfigurationDaoService {
	List<EbaySettingLayoutConfiguration> getLayoutSettingConfig(int layoutAreaId);
	List<EbayShippingArea> getEbayShippingAreaFollowLayoutArea(int layoutAreaId);
	List<Tuple<Integer, EbayShippingArea>> getEbayShippingAreaOrder(int layoutAreaId);
}

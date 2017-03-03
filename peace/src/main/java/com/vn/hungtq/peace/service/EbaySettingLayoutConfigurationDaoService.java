package com.vn.hungtq.peace.service;
import java.util.List;

import com.vn.hungtq.peace.entity.EbaySettingLayoutConfiguration;

public interface EbaySettingLayoutConfigurationDaoService {
	List<EbaySettingLayoutConfiguration> getLayoutSettingConfig(int layoutAreaId);
}

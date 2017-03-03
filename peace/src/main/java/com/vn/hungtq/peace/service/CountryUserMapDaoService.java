package com.vn.hungtq.peace.service;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import com.vn.hungtq.peace.dto.NotShippingCountryConfigurationDto;
import com.vn.hungtq.peace.entity.CountryUserMap;

public interface CountryUserMapDaoService {
	CopyOnWriteArrayList<CountryUserMap> getCountryMapWithUser(List<Integer> lstCountryGroupId,int userId);
	boolean isExistCountryMapWithUser(int userId);
	void defaultInitCountryMapWithUser(int userId,List<Integer> lstCountryGroupIds);
	void saveUserConfiguration(NotShippingCountryConfigurationDto notShippingCountryConfigurationDto,int userId);
	List<CountryUserMap> loadCountryUserMapFollowCountryIds(List<Integer> coutryId,int userId);
}

package com.vn.hungtq.peace.service;

import java.util.List;
import java.util.Map;

import com.vn.hungtq.peace.entity.Country;
import com.vn.hungtq.peace.entity.CountryGroup;
import com.vn.hungtq.peace.entity.CountryUserMap;

public interface CountryDaoService {
	Map<CountryGroup,List<CountryUserMap>> getMapOfCountryByGroup(List<Integer> lstCountryGroupId,int userId);
	List<Country> getCountriesFollowGroup(List<Integer> lstCountryGroupIds);
}

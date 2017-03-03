package com.vn.hungtq.peace.service;
import java.util.List;

import com.vn.hungtq.peace.entity.CountryGroup;

public interface CountryGroupDaoService {
	List<CountryGroup> getAllCountryGroup(List<Integer>lstCountryGroupIds);
}

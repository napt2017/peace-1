package com.vn.hungtq.peace.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList; 

import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;

import com.vn.hungtq.peace.common.CommonUtils;
import com.vn.hungtq.peace.entity.Country;
import com.vn.hungtq.peace.entity.CountryGroup;
import com.vn.hungtq.peace.entity.CountryUserMap;
import com.vn.hungtq.peace.service.CountryDaoService;
import com.vn.hungtq.peace.service.CountryUserMapDaoService;

public class CountryDaoServiceImpl extends BaseDaoServiceImpl implements CountryDaoService {
	
	@Autowired
	CountryUserMapDaoService countryUserMapDaoService; 
	
	@Override
	public Map<CountryGroup, List<CountryUserMap>> getMapOfCountryByGroup(List<Integer> lstCountryGroupId,int userId) {  
		CopyOnWriteArrayList<CountryUserMap> lstCountryUserMaps = countryUserMapDaoService.getCountryMapWithUser(lstCountryGroupId,userId);
		Map<CountryGroup, List<CountryUserMap>> tempMap = new HashMap<CountryGroup, List<CountryUserMap>>();
		lstCountryUserMaps.stream().peek(cum ->{
			Country country = cum.getCountry();
			CountryGroup cGroup = country.getCountryGroup();
			if(tempMap.containsKey(cGroup)){
				tempMap.get(cGroup).add(cum);
			}else{
				List<CountryUserMap> lstCountryUserMap = new ArrayList<>();
				lstCountryUserMap.add(cum);
				tempMap.put(cGroup, lstCountryUserMap);
			}
		}).count();
		
		return tempMap;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Country> getCountriesFollowGroup(List<Integer> lstCountryGroupIds) {
		int size = lstCountryGroupIds.size();
		String questionMark =CommonUtils.buildQuestionMark(size);
		String sqlQuery ="from Country where countryGroup.id in "+questionMark;
		Query query = getCurrentSession().createQuery(sqlQuery);
		for(int index = 0;index<size;index++){
			query.setParameter(index, lstCountryGroupIds.get(index));
		}
		
		return query.list(); 
	}

}

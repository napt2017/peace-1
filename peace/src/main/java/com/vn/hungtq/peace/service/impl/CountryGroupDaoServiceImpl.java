package com.vn.hungtq.peace.service.impl;

import java.util.List;

import org.hibernate.Query;

import com.vn.hungtq.peace.common.CommonUtils;
import com.vn.hungtq.peace.entity.CountryGroup;
import com.vn.hungtq.peace.service.CountryGroupDaoService;

public class CountryGroupDaoServiceImpl extends BaseDaoServiceImpl implements CountryGroupDaoService { 
	
	@SuppressWarnings("unchecked")
	@Override
	public List<CountryGroup> getAllCountryGroup(List<Integer> lstCountryGroupIds) { 
		String questionMark =CommonUtils.buildQuestionMark(lstCountryGroupIds.size());
		String sqlQuery = "from CountryGroup where id in"+questionMark; 
		Query query = getCurrentSession().createQuery(sqlQuery);
		
		for(int index=0;index<lstCountryGroupIds.size();index++){
			query.setParameter(index, lstCountryGroupIds.get(index));
		}
		
		return query.list();
	}

}

package com.vn.hungtq.peace.service.impl;

import java.util.List;

import org.hibernate.Query;

import com.vn.hungtq.peace.common.CommonUtils;
import com.vn.hungtq.peace.entity.TimeUnitMapping;
import com.vn.hungtq.peace.service.TimeUnitMappingDaoService;

public class TimeUnitMappingDaoServiceImpl extends BaseDaoServiceImpl implements TimeUnitMappingDaoService { 

	@SuppressWarnings("unchecked")
	@Override
	public List<TimeUnitMapping> loadTimeUnitMappingFollowIds(List<Integer> lstTimeUnitMappingIds) {
		int size = lstTimeUnitMappingIds.size();
		String questionMark = CommonUtils.buildQuestionMark(size);
		String sqlQuery = "from TimeUnitMapping where id in "+questionMark;
		Query query = getCurrentSession().createQuery(sqlQuery);
		for(int paramIndex=0;paramIndex<size;paramIndex++){
			query.setParameter(paramIndex, lstTimeUnitMappingIds.get(paramIndex));
		}
		return query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TimeUnitMapping> loadTimeUnitMappingFollowArea(int areaId) { 
		return getCurrentSession().createQuery("from TimeUnitMapping where useOnArea = ?").setParameter(0, areaId).list();
	} 
}

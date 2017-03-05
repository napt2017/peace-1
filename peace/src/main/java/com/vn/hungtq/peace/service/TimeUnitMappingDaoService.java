package com.vn.hungtq.peace.service;
import java.util.List;

import com.vn.hungtq.peace.entity.TimeUnitMapping;

public interface TimeUnitMappingDaoService {
	List<TimeUnitMapping> loadTimeUnitMappingFollowArea(int areaId);
	List<TimeUnitMapping> loadTimeUnitMappingFollowIds(List<Integer> lstTimeUnitMappingIds);
}

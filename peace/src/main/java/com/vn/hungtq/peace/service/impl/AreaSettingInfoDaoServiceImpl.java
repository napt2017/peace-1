package com.vn.hungtq.peace.service.impl;

import java.util.List;

import org.hibernate.Session; 

import com.vn.hungtq.peace.entity.AreaSettingInfo; 
import com.vn.hungtq.peace.service.AreaSettingInfoDaoService;

public class AreaSettingInfoDaoServiceImpl extends BaseDaoServiceImpl implements AreaSettingInfoDaoService {

	@Override
	public void batchInsertAreaSettingInfo(List<AreaSettingInfo> lstAreaSettingInfo) {
		//Transaction to batch insert --Cannot use batch-fix later
		Session session = sessionFactory.openSession();
		
		//Loop to add batch
		for(AreaSettingInfo areaSettingInfo:lstAreaSettingInfo){
			session.save(areaSettingInfo);
		} 
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AreaSettingInfo> loadAreaSettingInfoFollowUser(int userId,int areaId) {
		return getCurrentSession().createQuery("from AreaSettingInfo where userId =? and timeUnitMapping.useOnArea = ?")
								  .setParameter(0, userId)
								  .setParameter(1, areaId)
								  .list();
	}

	@Override
	public boolean isExistAreaSettingInfoOfUser(int userId,int areaId) {
		List<AreaSettingInfo> lstAreaSettingInfoOfUser = this.loadAreaSettingInfoFollowUser(userId,areaId);
		return lstAreaSettingInfoOfUser.size()>0;
	}

	@Override
	public void updateListAreaSettingInfo(List<AreaSettingInfo> lstAreaSettingInfo) {
		//Transaction to batch update --Cannot use batch-fix later
		Session session = sessionFactory.openSession();
		
		//Loop to add batch
		for(AreaSettingInfo areaSettingInfo:lstAreaSettingInfo){
			session.update(areaSettingInfo);
		} 
		
		session.flush();
	} 
}

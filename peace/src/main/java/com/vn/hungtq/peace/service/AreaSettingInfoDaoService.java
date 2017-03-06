package com.vn.hungtq.peace.service;

import java.util.List;

import com.vn.hungtq.peace.entity.AreaSettingInfo;

public interface AreaSettingInfoDaoService {
	void batchInsertAreaSettingInfo(List<AreaSettingInfo> lstAreaSettingInfo);
	List<AreaSettingInfo> loadAreaSettingInfoFollowUser(int userId,int areaId);
	boolean isExistAreaSettingInfoOfUser(int userId,int areaId);
	void updateListAreaSettingInfo(List<AreaSettingInfo> lstAreaSettingInfo);
}

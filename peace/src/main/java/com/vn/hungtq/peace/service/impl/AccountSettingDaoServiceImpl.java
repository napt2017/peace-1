package com.vn.hungtq.peace.service.impl;
import java.util.List;
import java.util.Optional;

import com.vn.hungtq.peace.entity.AccountSetting;
import com.vn.hungtq.peace.service.AccountSettingDaoService;

public class AccountSettingDaoServiceImpl extends BaseDaoServiceImpl implements AccountSettingDaoService {

	@Override
	public Optional<AccountSetting> loadAccountSettingByUser(int userId) {
		@SuppressWarnings("unchecked")
		List<AccountSetting> lstAcountSetting = getCurrentSession().createQuery("from AccountSetting where userId =?").setParameter(0, userId).list();
		if(lstAcountSetting.size()>0){
			return Optional.of(lstAcountSetting.get(0));
		} 
		
		return Optional.empty();
	}

	@Override
	public void saveAccountSetting(AccountSetting accountSetting) {
		getCurrentSession().save(accountSetting);
	}

	@Override
	public void updateAccountSetting(AccountSetting accountSetting) {
		getCurrentSession().update(accountSetting);
	} 
}

package com.vn.hungtq.peace.service;

import java.util.Optional;

import com.vn.hungtq.peace.entity.AccountSetting;

public interface AccountSettingDaoService {
	Optional<AccountSetting> loadAccountSettingByUser(int userId);
	void saveAccountSetting(AccountSetting accountSetting);
	void updateAccountSetting(AccountSetting accountSetting);
}

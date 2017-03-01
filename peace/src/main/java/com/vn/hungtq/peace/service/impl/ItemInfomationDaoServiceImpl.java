package com.vn.hungtq.peace.service.impl;

import com.vn.hungtq.peace.entity.ItemInfomation;
import com.vn.hungtq.peace.service.ItemInfomationDaoService;

public class ItemInfomationDaoServiceImpl extends BaseDaoServiceImpl implements ItemInfomationDaoService {

	@Override
	public void addItemInfomation(ItemInfomation itemInfomation) {
		 getCurrentSession().save(itemInfomation);
	}

}

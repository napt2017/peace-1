package com.vn.hungtq.peace.service;

import com.vn.hungtq.peace.entity.ItemInfomation;

public interface ItemInfomationDaoService {
	void addItemInfomation(ItemInfomation itemInfomation);
	ItemInfomation getItemInfomationByUserId(int  userId);
	void updateItemInfomation(ItemInfomation itemInfomation);
}

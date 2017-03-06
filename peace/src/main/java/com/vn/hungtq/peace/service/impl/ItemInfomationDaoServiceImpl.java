package com.vn.hungtq.peace.service.impl;

import java.util.List;

import org.apache.commons.collections.CollectionUtils; 
 
import com.vn.hungtq.peace.entity.ItemInfomation;
import com.vn.hungtq.peace.service.ItemInfomationDaoService;

public class ItemInfomationDaoServiceImpl extends BaseDaoServiceImpl implements ItemInfomationDaoService { 
	
	@Override
	public void addItemInfomation(ItemInfomation itemInfomation) {
		 getCurrentSession().save(itemInfomation);
	}

	@Override
	public ItemInfomation getItemInfomationByUserId(int userId) {   
		@SuppressWarnings("unchecked") 
		List<ItemInfomation> lstItemInfos = (List<ItemInfomation>) getCurrentSession()
				.createQuery("from ItemInfomation where userId=?")
				.setParameter(0, userId).list();
		if (CollectionUtils.isNotEmpty(lstItemInfos)) {
			return lstItemInfos.get(0);
		} 
		return null; 
	}

	@Override
	public void updateItemInfomation(ItemInfomation itemInfomation) {
		 getCurrentSession().update(itemInfomation);
	} 
}

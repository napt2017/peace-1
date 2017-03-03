package com.vn.hungtq.peace.service;

import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import com.vn.hungtq.peace.entity.EbayAreaShippingMethodMap;

public interface EbayAreaShippingMethodMapDaoService {
	CopyOnWriteArrayList<EbayAreaShippingMethodMap> getShippingMethodFollowArea(List<Integer> lstShippingAreaId);
}

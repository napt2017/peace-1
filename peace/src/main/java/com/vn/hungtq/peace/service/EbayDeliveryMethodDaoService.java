package com.vn.hungtq.peace.service;

import com.vn.hungtq.peace.common.Tuple;
import com.vn.hungtq.peace.entity.EbayDeliveryMethod;

public interface EbayDeliveryMethodDaoService {
	void saveEbayDeliveryMethod(EbayDeliveryMethod ebayDeliverMethod);
	void updateEbayDeliveryMethod(EbayDeliveryMethod ebayDeliverMethod);
	Tuple<Boolean,EbayDeliveryMethod> isExistDeliveryMethod(int userId);
}

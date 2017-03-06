package com.vn.hungtq.peace.service;

import com.vn.hungtq.peace.common.Tuple;
import com.vn.hungtq.peace.entity.EbayShippingFee;

public interface EbayShippingFeeDaoService {
	Tuple<Boolean,EbayShippingFee> checkExistEbayShippingFee(int userId);
	void addEbayShippingFee(EbayShippingFee ebayShippingFee);
	void upadateEbayShippingFee(EbayShippingFee ebayShippingFee);
}

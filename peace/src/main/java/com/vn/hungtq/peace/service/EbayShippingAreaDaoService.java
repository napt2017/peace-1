package com.vn.hungtq.peace.service;

import java.util.List; 

import com.vn.hungtq.peace.entity.EbayShippingArea;

public interface EbayShippingAreaDaoService {
	List<EbayShippingArea> loadEbayShippingArea(List<Integer> lstShippingAreaIds);
}

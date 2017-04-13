package com.vn.hungtq.peace.service;
import java.util.List;
import java.util.Optional;

import com.vn.hungtq.peace.entity.StockRegistorEntity;

public interface StockRegistorDaoService {
	List<StockRegistorEntity> getAllStockRegistor();
	Optional<StockRegistorEntity> getStockRegistorById(int id);
	void deleteStockRegistors(List<Integer> lstId);
	void updateStockRegistor(StockRegistorEntity stockRegistor);
	void saveStockRegistor(StockRegistorEntity stockRegistor);
}

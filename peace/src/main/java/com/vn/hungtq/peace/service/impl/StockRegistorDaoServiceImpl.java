package com.vn.hungtq.peace.service.impl;

import java.util.List;
import java.util.Optional;

import org.hibernate.Query;

import com.vn.hungtq.peace.common.CommonUtils;
import com.vn.hungtq.peace.entity.StockRegistorEntity;
import com.vn.hungtq.peace.service.StockRegistorDaoService;

public class StockRegistorDaoServiceImpl extends BaseDaoServiceImpl implements StockRegistorDaoService {

	@SuppressWarnings("unchecked")
	@Override
	public List<StockRegistorEntity> getAllStockRegistor() { 
		return getCurrentSession().createQuery("from StockRegistorEntity").list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public Optional<StockRegistorEntity> getStockRegistorById(int id) { 
		List<StockRegistorEntity> lstStockRegistors = getCurrentSession().createQuery("from StockRegistorEntity where id = ?")
																		 .setParameter(0, id)
																		 .list();
		if(lstStockRegistors.size()>0){
			return Optional.of(lstStockRegistors.get(0));
		}
		
		return Optional.empty();
	}

	@Override
	public void deleteStockRegistors(List<Integer> lstId) { 
		int len = lstId.size();
		if(len>0){
			String questionMark = CommonUtils.buildQuestionMark(len);
			Query query = getCurrentSession().createQuery("Delete from StockRegistorEntity WHERE id in "+questionMark);
			for(int paramIndex=0;paramIndex<len;paramIndex++){
				query.setParameter(paramIndex, lstId.get(paramIndex));
			}
			
			query.executeUpdate();
		}
	}

	@Override
	public void updateStockRegistor(StockRegistorEntity stockRegistor) { 
		Optional<StockRegistorEntity> optStockRegister = getStockRegistorById(stockRegistor.getId());
		optStockRegister.ifPresent(dbStockRegistor->{
			dbStockRegistor.setBuyPrice(stockRegistor.getBuyPrice());
			dbStockRegistor.setLogicCheck(stockRegistor.getLogicCheck());
			dbStockRegistor.setNote(stockRegistor.getNote());
			dbStockRegistor.setProductName(stockRegistor.getProductName());
			dbStockRegistor.setStock(stockRegistor.getStock());
			dbStockRegistor.setStoreName(stockRegistor.getStoreName());
			getCurrentSession().update(dbStockRegistor);
		});
	}

	@Override
	public void saveStockRegistor(StockRegistorEntity stockRegistor) { 
		getCurrentSession().save(stockRegistor);		
	}

}

package com.vn.hungtq.peace.service.impl;

import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.stream.Collectors;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.vn.hungtq.peace.common.CommonUtils; 
import com.vn.hungtq.peace.dto.NotShippingCountryConfigurationDto;
import com.vn.hungtq.peace.entity.Country;
import com.vn.hungtq.peace.entity.CountryUserMap;
import com.vn.hungtq.peace.entity.User;
import com.vn.hungtq.peace.service.CountryDaoService;
import com.vn.hungtq.peace.service.CountryUserMapDaoService;
import com.vn.hungtq.peace.service.UserDaoService;

public class CountryUserMapDaoServiceImpl extends BaseDaoServiceImpl implements CountryUserMapDaoService{

	private final Logger logger = LoggerFactory.getLogger(CountryUserMapDaoServiceImpl.class);
	
	@Autowired
	UserDaoService userService;
	
	@Autowired
	CountryDaoService countryDaoService;
	
	
	@SuppressWarnings("unchecked")
	@Override
	public CopyOnWriteArrayList<CountryUserMap> getCountryMapWithUser(List<Integer> lstCountryGroupId,int userId) { 
		if(!this.isExistCountryMapWithUser(userId)){
			this.defaultInitCountryMapWithUser(userId,lstCountryGroupId);
		}
		
		String questionMark = CommonUtils.buildQuestionMark(lstCountryGroupId.size());
		String sqlQuery = "FROM CountryUserMap WHERE user.id =? AND country.countryGroup.id IN "+questionMark;
		Query query = getCurrentSession().createQuery(sqlQuery);
		logger.debug("Get country map with user query[#napt01]:" +query.getQueryString());
		query.setParameter(0, userId);
		int paramIndex=1;
		for(Integer countryGroupId :lstCountryGroupId){
			query.setParameter(paramIndex++, countryGroupId);
		} 
		
		List<CountryUserMap> lstCountryUserMap = query.list();
		return lstCountryUserMap.stream().collect(Collectors.toCollection(CopyOnWriteArrayList::new));
	}

	@Override
	public boolean isExistCountryMapWithUser(int userId) {
		return getCurrentSession().createQuery("from CountryUserMap where user.id =?")
								  .setParameter(0, userId)
								  .list()
								  .size()>0; 
	}

	@Override
	public void defaultInitCountryMapWithUser(int userId ,List<Integer> lstCountryGroupIds) { 
		//Get user by id
		User user = userService.getUserById(userId);
		List<Country> lstCountries = countryDaoService.getCountriesFollowGroup(lstCountryGroupIds);
		
		
		//Transaction to batch insert
		Session session = sessionFactory.openSession();
		Transaction tx = session.getTransaction(); 
		
		//Loop to add batch
		for(Country country:lstCountries){
			session.save(new CountryUserMap(country, user));
		}
		
		//Commit to db
		tx.commit();
		session.close();
	}

	@Override
	public void saveUserConfiguration(NotShippingCountryConfigurationDto notShippingCountryConfigurationDto,int userId) {
		
		//Get list of country id
		List<Integer> lstCountryId = notShippingCountryConfigurationDto.getLstCountryConfigurations()
																	   .stream()
																	   .map(s ->s.getCountryId())
																	   .collect(Collectors.toList());
		
		//Get List of country user map follow countryId and userId
		List<CountryUserMap> lstCountryUserMap = this.loadCountryUserMapFollowCountryIds(lstCountryId, userId);
		
		//May be use batch update????? -fix later
		Session session = getCurrentSession();    
		
		//Loop to update
		lstCountryUserMap.stream().forEach(cum ->{
			notShippingCountryConfigurationDto.getLstCountryConfigurations()
											  .stream()
											  .forEach(nscConfig  ->{
				
				if(cum.getCountry().getId().equals(nscConfig.getCountryId())){
					cum.setIsSelect(nscConfig.isSelected());
					session.update(cum);
				} 
			});
		});  
		
		session.flush();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CountryUserMap> loadCountryUserMapFollowCountryIds(List<Integer> lstCountryId, int userId) {
		int size = lstCountryId.size();
		String questionMark = CommonUtils.buildQuestionMark(size);
		String sqlQuery = "from CountryUserMap where user.id= ? and country.id in "+questionMark;
		Query query = getCurrentSession().createQuery(sqlQuery);
		query.setParameter(0, userId);
		int paramIndex =1;
		for(Integer countryId :lstCountryId){
			query.setParameter(paramIndex++, countryId);
		}
		
		return query.list();
	} 
}

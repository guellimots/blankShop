package com.blankShop.frontEnd.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blankShop.frontEnd.repository.advertisingsRepository;
import com.blankShop.frontEnd.service.advertisingService;
import com.blankShop.model.advertising;

@Service
public class advertisingsServiceImpl implements advertisingService{
	
	@Autowired
	advertisingsRepository adDao;
	
	public List<advertising> findNewAds(){
		
		List<advertising> adList=adDao.findAds();
		return adList;
		
	};
	
	

}

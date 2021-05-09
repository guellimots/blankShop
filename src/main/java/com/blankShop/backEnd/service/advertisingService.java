package com.blankShop.backEnd.service;

import java.util.List;
import com.blankShop.model.advertising;

public interface advertisingService {

	public boolean save(advertising ad);
	
	public List<advertising> findAll();
	
	public advertising findAdid(Integer id);
	
	public byte[] findByImg(Integer id);
	
	public advertising updateImgDetail(advertising ad);
	

}

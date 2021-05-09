package com.blankShop.backEnd.service.Impl;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.blankShop.backEnd.repository.AdvertistingRepository;
import com.blankShop.backEnd.service.advertisingService;
import com.blankShop.model.advertising;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;

@Service
public class advertisingServiceImpl implements advertisingService {

	@Autowired
	AdvertistingRepository adrpository;
	
	Logger logger = LogManager.getLogger(getClass());
	
	@Override
	public boolean save(advertising ad){
		try {
			logger.info("開始執行新增廣告Service");
			adrpository.save(ad);	
			return true;
		}catch(Exception e) {
			logger.error("新增廣告發生錯誤:"+e);
		}finally {
			logger.info("新增廣告Service執行完畢");
		}
		return false;
	}

	@Override
	public List<advertising> findAll() {
		logger.info("開始查詢所有廣告資料");
		return adrpository.findAll();
	}

	@Override
	public byte[] findByImg(Integer id) {
		logger.info("開始查詢廣告圖檔");
		return adrpository.findAllImg(id);
	}

	@Override
	public advertising updateImgDetail(advertising ad) {
		logger.info("開始更新廣告狀態");
		return adrpository.save(ad);
	}

	@Override
	public advertising findAdid(Integer id) {
		Optional<advertising> ad = null;
		try {
			logger.info("開始查詢"+id.toString()+"資訊");
			ad = adrpository.findById(id);
			return ad.get();
		}catch(Exception e) {
			logger.error("查詢"+id.toString()+"發生錯誤:"+e);
		}finally {
			logger.info("查詢"+id.toString()+"資訊完畢");
		}
		return ad.get();
		
	}

}

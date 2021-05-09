package com.blankShop.backEnd.service.Impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.blankShop.backEnd.model.Message;
import com.blankShop.backEnd.repository.AdminMessageRepository;
import com.blankShop.backEnd.repository.checkempRepository;
import com.blankShop.backEnd.service.AdminMessageService;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;

@Service
public class AdminMessageServiceImpl implements AdminMessageService {

	@Autowired
	AdminMessageRepository amrepository;
	
	@Autowired
	checkempRepository checkemprepository;
	
	Logger logger = LogManager.getLogger(getClass());
	
	@Override
	public boolean insertMessage(Message msg) {	
		try {
			logger.info("開始新增公告訊息");
			msg.setCreateUser("SYSTEM");
			amrepository.save(msg);
			return true;
		}catch(Exception e) {
			logger.error("新增公告訊息發生錯誤:"+e);
		}finally {
			logger.info("新增公告訊息，執行完畢");
		}
		return false;
	}

	@Override
	public Message findMessage() {
		return amrepository.findmsg();
	}

}

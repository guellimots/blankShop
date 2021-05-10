package com.blankShop.backEnd.service.Impl;

import java.util.Date;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.blankShop.model.Member;
import com.blankShop.backEnd.model.Order;
import com.blankShop.backEnd.repository.AdvertMailRepository;
import com.blankShop.backEnd.repository.OrderRepository;
import com.blankShop.backEnd.service.orderService;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;

@Service
public class orderServiceImpl implements orderService {

	@Autowired
	OrderRepository orderRepository; 
	
	@Autowired
	AdvertMailRepository AMRepository;
	
	
	Logger logger = LogManager.getLogger(getClass());
	
	@Override
	public List<Order> findAll() {
		logger.info("開始查詢所有訂單資料");
		return orderRepository.findAll();
	}

	@Override
	public Order updateorders(Order orders) {
		logger.info("開始更新訂單狀態");
		return orderRepository.save(orders);
	}

	@Override
	public Order findorderid(Integer orderIdentity) {
		Optional<Order> od = null;
		try {
			logger.info("開始查詢"+orderIdentity.toString()+"訂單產品資訊");
			od = orderRepository.findById(orderIdentity);
			return od.get();
		}catch(Exception e) {
			logger.error("查詢"+orderIdentity.toString()+"訂單產品資訊發生錯誤:"+e);
		}finally {
			logger.info("查詢"+orderIdentity.toString()+"訂單產品資訊完畢");
		}
		return od.get();
	}

	@Override
	public Member findMemberId(Integer memberId) {
		Optional<Member> member = null;
		try {
			logger.info("開始查詢"+memberId.toString()+"會員資訊");
			member = AMRepository.findById(memberId);
			return member.get();
		}catch(Exception e) {
			logger.error("查詢"+memberId.toString()+"訂單會員資訊發生錯誤:"+e);
		}finally {
			logger.info("查詢"+memberId.toString()+"會員資訊完畢");
		}
		return member.get();
	}

	@Override
	public Integer findtodaytotalPrice() {
		logger.info("開始查詢今日銷售總額");
		return orderRepository.finddaytotal();
	}

	@Override
	public Integer findtodaytotalorder() {
		logger.info("開始查詢今日訂單數量");
		return orderRepository.findtodayordertotal();
	}
	
	@Override
	public List<Order> latestOrder(Date day1,Date day2) {
		logger.info("開始查詢訂單天數數量");
		return orderRepository.findByCreateDateBetween(day1,day2);
	}

}

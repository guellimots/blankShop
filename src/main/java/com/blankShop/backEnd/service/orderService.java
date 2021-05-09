package com.blankShop.backEnd.service;

import java.util.Date;
import java.util.List;

import com.blankShop.backEnd.model.Order;
import com.blankShop.model.Member;
import com.blankShop.model.Orders;
import com.blankShop.model.advertising;

public interface orderService {

	public Order updateorders(Order orders);
	public List<Order> findAll();
	public Order findorderid(Integer orderIdentity);
	public Member findMemberId(Integer memberId);
	public Integer findtodaytotalPrice();
	public Integer findtodaytotalorder();
	public List<Order> latestOrder(Date day1,Date day2);
}

package com.blankShop.frontEnd.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blankShop.frontEnd.model.OrderDTO;
import com.blankShop.frontEnd.repository.OrdersRepository;
import com.blankShop.frontEnd.service.OrderService;
import com.blankShop.model.Orders;


@Service
public class OrdersServiceImpl implements OrderService {

	@Autowired
	OrdersRepository orderDao;

	@Override
	public List<OrderDTO> getOrdersbyMemberId(Integer memberId) {
		
		List<Orders> od = orderDao.findOrders(memberId);
		System.out.println(od.size());
		List<OrderDTO> dtos= new ArrayList<OrderDTO>();
		for (int i = 0; i <od.size(); i++) {
			OrderDTO dto = new OrderDTO ();
			dto.setOrderIdentity(od.get(i).getOrderIdentity());
			dto.setOrderId(od.get(i).getOrderId());
			dto.setProductname(od.get(i).getProduct().getProductName());
			dto.setPrice(od.get(i).getPrice());
			dto.setAmount(od.get(i).getAmount());
			dto.setCreateDate(od.get(i).getCreateDate());
			dto.setOrderStatus(od.get(i).getOrderStatus());
			dto.setImgpath(od.get(i).getProduct().getProductImgDir1());
			dto.setAddress(od.get(i).getAddress());
			dtos.add(dto);
			System.out.println(dtos);
		}
		return dtos;
	}
	public Orders getimgbyid(Integer id) {
		return orderDao.findById(id).get();
		
	}
	
	public Orders insertOrders(Orders orders) {

		return orderDao.save(orders);
	}
	
	public Integer findOrderId() {
		return orderDao.findOrderId();
	}
	
	
	
	
	
}
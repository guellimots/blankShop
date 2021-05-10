package com.blankShop.frontEnd.service;

import java.util.List;
import com.blankShop.frontEnd.model.OrderDTO;
import com.blankShop.model.Orders;


public interface OrderService {

	List<OrderDTO> getOrdersbyMemberId(Integer orderId);
	public Orders getimgbyid(Integer id);
	public Orders insertOrders(Orders orders);
	public Integer findOrderId();

}
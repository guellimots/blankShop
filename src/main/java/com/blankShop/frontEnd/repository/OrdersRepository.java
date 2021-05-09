package com.blankShop.frontEnd.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.blankShop.model.Orders;

public interface OrdersRepository extends JpaRepository<Orders, Integer> {
	//@Query(value="select a.orderId,b.productName,a.price,a.amount,a.orderStatus,a.createDate from Orders as a inner join Product as b on b.typeId=a.typeId where a.memberId=?1" ,nativeQuery = true)
	@Query(value="select * from Orders where memberId=?1" ,nativeQuery = true)
	List<Orders> findOrders(Integer memberId);
	
	@Query(value="select top 1 orderId from Orders order by orderId desc", nativeQuery = true)
	Integer findOrderId();


}

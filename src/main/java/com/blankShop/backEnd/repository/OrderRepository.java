package com.blankShop.backEnd.repository;


import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.blankShop.backEnd.model.Order;


public interface OrderRepository extends JpaRepository<Order, Integer> {

	@Query(value = "select sum(price) from Orders where DATEDIFF(DD,createDate,GETDATE())=0", nativeQuery = true)
	public Integer finddaytotal();
	
	@Query(value = "select count(orderIdentity) from Orders where DATEDIFF(DD,createDate,GETDATE())=0", nativeQuery = true)
	public Integer findtodayordertotal();
	
	@Query(value = "select * FROM Orders WHERE createDate >= :day2 and createDate <= :day1", nativeQuery = true)
	public List<Order> findByCreateDateBetween(Date day1,Date day2);
}

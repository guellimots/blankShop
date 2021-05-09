package com.blankShop.backEnd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.blankShop.backEnd.model.Message;

public interface AdminMessageRepository extends JpaRepository<Message, Integer> {

	@Query(value = "SELECT Top 1* FROM messageAdmin order by createDate desc", nativeQuery = true)
	public Message findmsg();
	
	
}

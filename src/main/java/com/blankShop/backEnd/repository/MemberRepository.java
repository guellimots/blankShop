package com.blankShop.backEnd.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.blankShop.model.Member;

public interface MemberRepository extends JpaRepository<Member, Integer> {
	
	@Query(value="select count(*) from Member ",nativeQuery = true)
	public Integer findallmember();

}

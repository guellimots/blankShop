package com.blankShop.backEnd.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.blankShop.backEnd.model.Member01;


public interface MemberDaoImpl extends JpaRepository<Member01, Integer>{
	List<Member01> findAllByMemberNameLike(String name);

}

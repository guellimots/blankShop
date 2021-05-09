package com.blankShop.frontEnd.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.blankShop.model.Member;


public interface MembersRepository extends JpaRepository<Member, Integer> {
	//public Member findByEmail(String email);
	
	public Optional<Member> findByEmail(String email);
	
}

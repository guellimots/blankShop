package com.blankShop.backEnd.service;

import java.util.List;


import com.blankShop.backEnd.model.Member01;

public interface MemberService {
	Member01 save(Member01 member);
	void delete(Integer emeberId);
	void update(Member01 member);
	List<Member01> getAllMember();
	Member01 get(Integer memberId);
	List<Member01> searchMems(String memberName);
	public Integer findallMember();

}

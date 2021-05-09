package com.blankShop.frontEnd.service;

import com.blankShop.model.Member;

public interface MemberService {

	Member save(Member bean);


	Member update(Member bean);

	Member getMemberbyId(Integer id);

	Member getMemberbyEmail(String email);

	boolean checkMemberbyEmail(String email);
}
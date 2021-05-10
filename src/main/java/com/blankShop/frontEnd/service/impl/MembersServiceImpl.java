package com.blankShop.frontEnd.service.impl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blankShop.frontEnd.repository.MembersRepository;
import com.blankShop.frontEnd.service.MemberService;
import com.blankShop.model.Member;

@Service
public class MembersServiceImpl implements MemberService {
	@Autowired
	MembersRepository memberDao;

	@Override
	public Member save(Member bean) {
		return memberDao.save(bean);
	}

	@Override
	public Member update(Member bean) {
		return memberDao.save(bean);
	}

	@Override
	public Member getMemberbyId(Integer id) {
		try {
			Optional<Member> optional = memberDao.findById(id);
			Member member = null;
				member = optional.get();

				return member;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
			
		}
		
	}

	@Override
	public Member getMemberbyEmail(String email) {
		Member member = memberDao.findByEmail(email).get();
		return member;

	}

	@Override
	public boolean checkMemberbyEmail(String email) {
		Optional<Member> check = memberDao.findByEmail(email);
		if (check.isPresent()) {
			return true;
		} else
			return false;
	}
}

package com.blankShop.backEnd.service.Impl;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blankShop.backEnd.repository.MemberDaoImpl;
import com.blankShop.backEnd.repository.MemberRepository;
import com.blankShop.backEnd.service.MemberService;
import com.blankShop.backEnd.model.Member01;
@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDaoImpl memberDao;
	
	@Autowired
	MemberRepository memberrepository;
	
	@Override
	public Member01 save(Member01 member) {
		return memberDao.save(member);
	}
	@Override
	public void delete(Integer memberId) {
		memberDao.deleteById(memberId);
	}
	@Override
	public void update(Member01 member) {
		memberDao.save(member);
	}
	@Override
	public List<Member01> getAllMember(){
		return memberDao.findAll();
		
	}
	@Override
	public Member01 get(Integer memberId) {
		Optional<Member01> optional = memberDao.findById(memberId);
		Member01 member = null;
		if (optional.isPresent()) {
			member = optional.get();
		} else {
			throw new RuntimeException("Member(MemberId=" + memberId + ")不存在");
		}
		return member;
	}
	@Override
	public List<Member01> searchMems(String name){
        //记得加 %  %
        return memberDao.findAllByMemberNameLike("%"+name+"%");	
	}
	@Override
	public Integer findallMember() {
		return memberrepository.findallmember();
	}

	
}

package com.blankShop.backEnd.service;

import java.util.List;

import com.blankShop.model.Mail;
import com.blankShop.model.Member;

public interface advertMailPushService {
	public boolean sendMailPush(Mail mail);
	public List<Member> FindAllMember();
	public Member findMemberId(Integer memberId);
}

package com.blankShop.backEnd.service.Impl;

import java.io.File;
import java.util.List;
import java.util.Optional;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import com.blankShop.backEnd.repository.AdvertMailRepository;
import com.blankShop.backEnd.service.advertMailPushService;
import com.blankShop.model.Mail;
import com.blankShop.model.Member;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;


@Service
public class advertMailPushServiceImpl implements advertMailPushService {

	@Autowired
	JavaMailSender javaMailSender;
	
	@Autowired
	AdvertMailRepository AMRepository;
	
	Logger logger = LogManager.getLogger(getClass());
	
	//發送廣告
	@Override 
	public boolean sendMailPush(Mail mail) {

		try {
			logger.info("開始執行Mail Push功能");
			MimeMessage mg = javaMailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mg,true);	
			String strbase64 = mail.getFile();
			helper.setTo(mail.getTo());
			helper.setFrom(mail.getFrom());
			helper.setSubject(mail.getSubject());
			helper.setText(mail.getContent()+"<br>"+"<html><body><img src='cid:image'></body></html>",true);
			FileSystemResource res = new FileSystemResource(new File("C:\\blankShop_demo\\blankshop_advertisting\\"+strbase64));
			helper.addInline("image", res);
			javaMailSender.send(mg);	
		}catch(MessagingException e) {
			e.printStackTrace();
			logger.error("執行Mail Push功能發生錯誤:"+e);
			return false;
		}finally {
			logger.info("執行Mail Push功能完畢");
		}
		return true;
	}

	//顯示所有會員
	@Override
	public List<Member> FindAllMember() {
		return AMRepository.findAll();
	}

	//查詢個別會員email
	@Override
	public Member findMemberId(Integer memberId) {
		Optional<Member> member=null;
		try {
			logger.info("開始查詢"+memberId.toString()+"會員email資訊");
			member = AMRepository.findById(memberId);
			return member.get();
		}catch(Exception e) {
			logger.error("查詢"+memberId.toString()+"會員email發生錯誤:"+e);
		}finally {
			logger.info("查詢"+memberId.toString()+"會員email資訊完畢");
		}
		return member.get();
	}

}

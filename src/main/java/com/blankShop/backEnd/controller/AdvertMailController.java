package com.blankShop.backEnd.controller;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.blankShop.backEnd.service.advertMailPushService;
import com.blankShop.model.Mail;
import com.blankShop.model.Member;

@Controller
@RequestMapping("/AdvertMailPage")
public class AdvertMailController {
	
	@Autowired
	advertMailPushService mailpushservice;
	
	Logger logger = LogManager.getLogger(getClass());
	
	@GetMapping("/AdvertMailMain")
	public String procseeOrdersPage() {
		return "advertMailPush";
	}
	
	
	//發送廣告
	@PostMapping("/sendMail")
	public String processSendMail(@RequestParam("mailto") String To, @RequestParam("mailfrom") String from,
			@RequestParam("mailsubject") String subject, @RequestParam("content") String conetnt, @RequestParam("image") MultipartFile file, Model m) {
		String result ="";
		try {					
			String image = file.getOriginalFilename();
			Mail mail = new Mail();
			mail.setTo(To);
			mail.setFrom(from);
			mail.setSubject(subject);
			mail.setContent(conetnt);
			mail.setFile(image);
			boolean sendresult = mailpushservice.sendMailPush(mail);
			if(sendresult == true) {
				result="廣告已送出";
			}else {
				result="廣告送出失敗";
			}
		}catch(Exception e) {
			e.printStackTrace();
			logger.error("發送email錯誤:"+e.toString());
		}
		
		m.addAttribute("sendrs",result);
		return "advertMailPush";
	}
	
	//顯示所有會員資料
	@GetMapping("/MemberMailMain")
	@ResponseBody
	public List<Member> processfindallMember() {
		return mailpushservice.FindAllMember();
	}
	
	//尋找會員資料
	@GetMapping("/findMemberMail/{memberId}")
	@ResponseBody
	public Member getMemberId(@PathVariable Integer memberId){
		return mailpushservice.findMemberId(memberId);
	}
	
}

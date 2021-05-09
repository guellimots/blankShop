package com.blankShop.frontEnd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.blankShop.frontEnd.service.MailService;
import com.blankShop.frontEnd.service.MemberService;
import com.blankShop.model.Member;

@Controller
@RequestMapping("frontEnd")
@SessionAttributes({"useremail"})
public class MailController {
	private final static String FROM_MAIL = "blankshopcompany@gmail.com";
	private String TO_MAIL;
	
	@Autowired
	MemberService memberService;
	@Autowired
	MailService mailService;


	// email頁面→寄信controller(內文包含連結)
	@PostMapping("/sendEmail")
	public String sendEmail(@RequestParam String email, Model m) {
		Member member = memberService.getMemberbyEmail(email);
		TO_MAIL = member.getEmail();
		String html = "<h3>請點選下方連結重設您的密碼</h3>" + 
				"<a href='http://localhost:8080/blankShop/frontEnd/resetpassword"
				+"?useremail="+email
				+ "'><h4>點我點我</h4></a>"
				+ "<div><img width='640' style='max-width:100%' src='cid:p1'/></div>";
		String[] imgUrlArr = { "C:\\git\\logo\\blankShop.png" };
		String[] valArr = { "p1" };
		mailService.sendMailWithImg(FROM_MAIL, TO_MAIL, "blankShop-密碼重設", html, imgUrlArr, valArr);
		m.addAttribute("useremail" ,email);
		return"index";
		
	}

	// user點選連結→跳轉到resetpwd的jsp
		@GetMapping("/resetpassword")
		public String transToResetpassword(String useremail, Model m) {
			m.addAttribute("useremail", useremail);
			return "resetpassword";
		}

	// user填完送出後→跳轉到登入頁面
	@PostMapping("/resetPwdController")
	public String editpassword(@RequestParam String email, @RequestParam(name = "new-pwd") String password,
			@RequestParam(name = "confirm-pwd") String passwordforcheck) {
		Member member = memberService.getMemberbyEmail(email);

		if (password.equals(passwordforcheck)) {
			member.setPassword(password);
			memberService.save(member);
			System.out.println("一樣");
		} else {
			System.out.println("密碼不一樣");
		}
		return "login";
	}

}

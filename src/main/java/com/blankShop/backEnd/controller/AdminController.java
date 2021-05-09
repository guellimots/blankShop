package com.blankShop.backEnd.controller;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import com.blankShop.model.Employee;
import com.blankShop.backEnd.model.Membertotal;
import com.blankShop.backEnd.model.Message;
import com.blankShop.backEnd.service.AdminMessageService;
import com.blankShop.backEnd.service.MemberService;
import com.blankShop.backEnd.service.checkempService;
import com.blankShop.backEnd.service.employeeService;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;


@Controller
@RequestMapping("/backEnd")
public class AdminController {
	@Autowired
	employeeService empService;
	
	@Autowired
	checkempService checkempservice;
	
	@Autowired
	AdminMessageService amservice;
	
	@Autowired
	MemberService memberservice;
	
	Logger logger = LogManager.getLogger(getClass());
	
	Integer empid = null;
	
	@GetMapping("/login")
	public String Login() {
		logger.info("進入登入畫面");
		return "loginmain";
	}
	
	//登出
	@GetMapping("/logout")
	public String Logout(SessionStatus state,HttpServletRequest request) {
		state.setComplete();
		HttpSession session = request.getSession(false);
		session.removeAttribute("email");
		session.invalidate();
		logger.info("系統登出");
		return "redirect:/backEnd/login";
	}
	
	//檢查職等權限(首頁)
	@GetMapping("/checkemprank/{empId}")
	@ResponseBody
	public boolean checkEmpRank(@PathVariable Integer empId) {
		empid = empId;
		logger.info("檢查"+empid.toString()+"權限");
		return checkempservice.checkempid(empId);
	}
	
	//檢查職等權限(換頁使用)
	@GetMapping("/disablebutton")
	@ResponseBody
	public boolean checkEmpRank() {
		return checkempservice.checkempid(empid);
	} 
	
	//讀取員工姓名
	@GetMapping("/getEmpname")
	@ResponseBody
	public String processgetEmpName() {
		return checkempservice.getempname(empid);
	}
	
	//登入判斷
	@GetMapping("/BlankShop_Admin")
	public String procseemainPage(@RequestParam(name = "account") String email, @RequestParam(name = "password") String password, Model model){
		logger.info("開始執行登入檢核---"+"帳號:"+email.toString()+"密碼:"+password.toString());
		Map<String, String> errormsg = new HashMap<String, String>();
		model.addAttribute("errormsg", errormsg);
		if (errormsg != null && !errormsg.isEmpty()) {
			logger.warn(email.toString()+"登入有問題");
			return "redirect:/backEnd/login";
		}
		boolean checkResult = empService.checkemail(email, password);		
		Employee emp = empService.findemployee(email);
		if (checkResult == true) {
			logger.info("檢核成功"+emp.getEmpName().toString());
			model.addAttribute("empname", emp.getEmpName());
			model.addAttribute("empid", emp.getEmpId());
			model.addAttribute("emprank", emp.getRankTitle());
			if(emp.getEmpimg()!=null) {
				byte[] base64 = Base64Utils.encode(emp.getEmpimg());
				String empimg= new String(base64);
				model.addAttribute("empimg", "data:image/png;base64," + empimg);
			}else {
				//若無圖片給預設圖檔，並依照身分證第二位判斷性別
				int gender = emp.getPersonID().indexOf("1");
				if(gender == 1) {
					model.addAttribute("empimg", "/blankShop/img/backEnd/unknow_male.jpg");
				}else {
					model.addAttribute("empimg", "/blankShop/img/backEnd/unknow_female.jpg");
				}				
			}
			return "AdminPage";
		}
		logger.error("警告: 帳號或密碼輸入有誤"+email.toString()+"或"+password.toString());
		errormsg.put("msg", "警告: 帳號或密碼輸入有誤");
		return "loginmain";
	}
	
	//顯示公告訊息
	@GetMapping("/showannouncement")
	@ResponseBody
	public Message processgetMsg(){			
		return amservice.findMessage();
	}
	
	//新增公告
	@PostMapping("/InsertMessage")
	@ResponseBody
	public boolean InsertMsg(Message msg) {
		return amservice.insertMessage(msg);
	}
	
	//顯示會員人數
	@GetMapping("/getallMember")
	@ResponseBody
	public Integer getDayTotalorder(Membertotal member) {
		Integer allmember = memberservice.findallMember();
		if(allmember != null) {
			member.setTotalMember(allmember);
		}else {
			member.setTotalMember(0);
		}		
		return member.getTotalMember();
	}
	
}

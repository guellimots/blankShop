package com.blankShop.backEnd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.blankShop.backEnd.model.MemAge;
import com.blankShop.backEnd.service.MemberService;
import com.blankShop.backEnd.service.employeeService;
import com.blankShop.backEnd.service.orderService;

@Controller
@RequestMapping("/chart")
public class chartController {
	
	@Autowired
	employeeService employeeService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	orderService orderservice;
	
	@GetMapping(value="/chart01")
	public String chart01() {
		return "chart_01";
	}
	

}

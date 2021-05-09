package com.blankShop.frontEnd.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blankShop.frontEnd.service.MemberService;
import com.blankShop.frontEnd.service.OrderService;
import com.blankShop.frontEnd.service.ProductService;
import com.blankShop.model.Member;
import com.blankShop.model.Orders;
import com.blankShop.model.Product;

@Controller
@RequestMapping("/frontEnd")
public class OrdersController {
	@Autowired
	OrderService orderService;

	@Autowired
	MemberService memberService;
	@Autowired
	ProductService productService;

	@PostMapping("/insertOrders")
	@ResponseBody
	public Orders insertOrders(
		@RequestParam Integer typeId,
		@RequestParam Integer price, 
		@RequestParam Integer amount, 
		@RequestParam String paymentInfo,
		@RequestParam String ezShip,
		Orders order, HttpSession session) {
		Integer id = (Integer) session.getAttribute("memberId");
		Member testmb = memberService.getMemberbyId(id);
		Product testpt = productService.findTypeId(typeId);
		Integer oid = (orderService.findOrderId()+1);
		System.out.println(oid);
		Orders od = new Orders();
		if("-".equals(ezShip)) {
			od.setAddress(testmb.getAddress());
			od.setMember(testmb);
			od.setOrderId(oid);
			od.setProduct(testpt);
			od.setPrice(price);
			od.setAmount(amount);
			od.setPaymentInfo(paymentInfo);
			Integer editStock = (testpt.getStockNumber()-amount);
			testpt.setStockNumber(editStock);
			return orderService.insertOrders(od);
		}
		else {
			od.setAddress(ezShip);
			od.setMember(testmb);
			od.setOrderId(oid);
			od.setProduct(testpt);
			od.setPrice(price);
			od.setAmount(amount);
			od.setPaymentInfo(paymentInfo);
			Integer editStock = (testpt.getStockNumber()-amount);
			testpt.setStockNumber(editStock);
			return orderService.insertOrders(od);
		}
		
		

	}
	@PostMapping("/ezShip")
	public String ezShip(@RequestParam String stName
			, @RequestParam String stAddr
			, @RequestParam String stTel
			,@RequestParam("webPara") Integer ezid
			,HttpSession session,Model m) {
		//Integer memberId = (Integer) session.getAttribute("memberId");
		Member member = memberService.getMemberbyId(ezid);
		session.setAttribute("memberId", ezid);
		m.addAttribute("Member", member);
		m.addAttribute("stName",stName);
		m.addAttribute("stAddr",stAddr);
		m.addAttribute("stTel",stTel);
		//m.addAttribute("id", memberId);
		return "my-account";
	}

}

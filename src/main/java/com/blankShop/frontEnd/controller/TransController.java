package com.blankShop.frontEnd.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.blankShop.frontEnd.service.ProductService;
import com.blankShop.model.Product;

@Controller
@RequestMapping("/frontEnd")



public class TransController {
	
	
	@Autowired
	ProductService pdService;

	//未登入前首頁
	@GetMapping("/indexPage")
	public String loadIndex(Model m) {
		
		ArrayList<Product> result=new ArrayList<Product>();

		List<Integer> bestSellers = pdService.bestsellers();

		if (bestSellers.size() != 0) {

			for (Integer best : bestSellers) {
				List<Product> pdList = pdService.findByProductID(best);
				if(pdList.size()!=0) {
					result.add(pdList.get(0));
				}
			}
		}
		
		for (int i=0; i<result.size();i++) {
			if (result.get(i).getSalePrice()==0) {
				result.get(i).setSalePrice(result.get(i).getProductPrice());
				result.get(i).setProductPrice(null);
			}
		}
		
		m.addAttribute("bestSellers", result);
		
		
		return "index";
	}
	@GetMapping("/")
	public String tran() {
		return "login";
	}
	//登入頁面
	@GetMapping("/loginPage")
	public String loadLogin() {
		return "login";
	}
	//登入後首頁
	@GetMapping("/welcomePage")
	public String loadWelcome(Model m) {
		
		ArrayList<Product> result=new ArrayList<Product>();

		List<Integer> bestSellers = pdService.bestsellers();

		if (bestSellers.size() != 0) {

			for (Integer best : bestSellers) {
				List<Product> pdList = pdService.findByProductID(best);
				if(pdList.size()!=0) {
					result.add(pdList.get(0));
				}
			}
		}
		
		for (int i=0; i<result.size();i++) {
			if (result.get(i).getSalePrice()==0) {
				result.get(i).setSalePrice(result.get(i).getProductPrice());
				result.get(i).setProductPrice(null);
			}
		}
		
		m.addAttribute("bestSellers", result);
		
		
		return "welcome";
	}
	//註冊頁面
	@GetMapping("/tranToRegister")
	public String register(@RequestParam(required = false) String status, Model m) {
		if ("fail".equals(status)) 
		m.addAttribute("alertmsg","fail");
		else if("good".equals(status))
		m.addAttribute("alertmsg","good");	
		else	
		m.addAttribute("alertmsg","");
		//m.addAttribute("firstTime","first");
		return "register";
	}

	// 登入頁面的忘記密碼→跳轉到忘記密碼的頁面(輸入email)
	@GetMapping("transToForgetPassword")
	public String transToForgetPassword() {
		return "forgetpassword";
	}
	//檢視購物車頁面
	@GetMapping("/viewcart")
	public String transToViewCart() {
		return "viewcart";
	}
}

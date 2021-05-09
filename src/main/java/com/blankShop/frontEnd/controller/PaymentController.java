package com.blankShop.frontEnd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.blankShop.frontEnd.config.PaypalPaymentIntent;
import com.blankShop.frontEnd.config.PaypalPaymentMethod;
import com.blankShop.frontEnd.model.OrderDTO;
import com.blankShop.frontEnd.service.MemberService;
import com.blankShop.frontEnd.service.PaypalService;
import com.blankShop.frontEnd.util.URLUtils;
import com.blankShop.model.Member;
import com.paypal.api.payments.CartBase;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;

@Controller
@RequestMapping("frontEnd")
public class PaymentController {

	public static final String PAYPAL_SUCCESS_URL = "pay/success";
	public static final String PAYPAL_CANCEL_URL = "pay/cancel";

	private Logger log = LoggerFactory.getLogger(getClass());
	
	CartBase cb= new CartBase();
	
	
	@Autowired
	private PaypalService paypalService;
	@Autowired
	private MemberService memberService;
	
	OrderDTO orderDto =new OrderDTO();
	
	@GetMapping("/checkout")
	public String checkout() {
		return "checkout";
	}
	 
	@RequestMapping(method = RequestMethod.POST, value = "pay")
	public String pay(@RequestParam String stName
			, @RequestParam String stAddr
			, HttpServletRequest request
			, OrderDTO dto, HttpSession session) {

		//session.getAttribute("memberId");
		
		String cancelUrl = URLUtils.getBaseURl(request) + "/frontEnd/" + PAYPAL_CANCEL_URL;
		String successUrl = URLUtils.getBaseURl(request) + "/frontEnd/" + PAYPAL_SUCCESS_URL;
		try {
			Payment payment = paypalService.createPayment(
					 (double)dto.getTotalPrice(),
					"TWD", PaypalPaymentMethod.paypal, 
					PaypalPaymentIntent.sale, 
					stName+"-"+stAddr, 
					cancelUrl,
					successUrl);
			orderDto.setEzAdd(stAddr);
			orderDto.setEzName(stName);
			
		
			cb.setDescription(stName+"-"+stAddr);
			System.out.println("11111111111");
			System.out.println("CBBBBBB===="+cb.getDescription());
			System.out.println("DTOO====="+orderDto.getEzName()+orderDto.getEzAdd());
			System.out.println(payment.getId());
			
			for (Links links : payment.getLinks()) {
				if (links.getRel().equals("approval_url")) {
					return "redirect:" + links.getHref();
				}
			}
		} catch (PayPalRESTException e) {
			log.error(e.getMessage());
		}
		
		return "redirect:/viewcart";
	}

	@RequestMapping(method = RequestMethod.GET, value = PAYPAL_CANCEL_URL)
	public String cancelPay() {
		return "cancel";
	}

	@RequestMapping(method = RequestMethod.GET, value = PAYPAL_SUCCESS_URL)
	public String successPay(@RequestParam("paymentId") String paymentId
			, @RequestParam("PayerID") String payerId
			,OrderDTO dto, Model m) {
		try {
			Payment payment = paypalService.executePayment(paymentId, payerId);
			if (payment.getState().equals("approved")) {
				System.out.println("22222222222");
				System.out.println("CBBBBBB===="+cb.getDescription());
				System.out.println("DTOO====="+orderDto.getEzName()+orderDto.getEzAdd());
				System.out.println(cb.getDescription()+"=========================");
				m.addAttribute("paymentId", paymentId);
				m.addAttribute("description",cb.getDescription());
				return "success";
			}
		} catch (PayPalRESTException e) {
			log.error(e.getMessage());
		}
	
		return "redirect:/frontEnd/checkout";
	}

	@ModelAttribute
	public void showMember(Model model, HttpSession session) {
		Integer id = (Integer) session.getAttribute("memberId");
		Member mb = memberService.getMemberbyId(id);
		model.addAttribute("Member", mb);
		System.out.println(mb.getAddress());
	}
}

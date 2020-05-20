package com.saw.good.payment.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.saw.good.member.model.vo.Member;
import com.saw.good.payment.model.service.PaymentService;
@Controller
public class PaymentController {
	
	@Autowired
	private PaymentService service;
	
	@Autowired
	Logger logger;
	
	@RequestMapping("/payment/paymentView")
	public ModelAndView paymentView(ModelAndView mv,@SessionAttribute("loginMember") Member m){
		
		String userId = m.getUserId();
		List<Map<String,String>> list = service.selectPayment(userId);
		System.out.println(list);
		mv.addObject("list",list);
		mv.setViewName("payment/payment");
		return mv;
	}
}

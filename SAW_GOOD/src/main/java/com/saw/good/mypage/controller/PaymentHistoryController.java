package com.saw.good.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PaymentHistoryController {

	@RequestMapping("/mypage/ph.do")
	public String ph() {
		return "/mypage/paymentHistory";
	}
	
	
}

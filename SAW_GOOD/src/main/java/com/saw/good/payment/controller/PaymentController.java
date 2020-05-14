package com.saw.good.payment.controller;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class PaymentController {
	@Autowired
	Logger logger;
	
	@RequestMapping("/payment/paymentView")
	public ModelAndView paymentView(ModelAndView mv) {
		System.out.println("들어오냐");
		mv.setViewName("payment/payment");
		return mv;
	}
}

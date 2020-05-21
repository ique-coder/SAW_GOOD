package com.saw.good.mypage.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.saw.good.mypage.model.service.phService;

@Controller
public class PaymentHistoryController {

	@Autowired
	private phService service;
	
	
	@RequestMapping("/mypage/ph.do")
	public ModelAndView ph(ModelAndView mv, String userId) {

//		List<Map<String,String>> product = service.product(userId);
		
		mv.setViewName("/mypage/paymentHistory");
		
		return mv;
	}
	
	@RequestMapping("/mypage/phMain.do")
	public String main() {
		return "/mypage/phMain";
	}
	
	@RequestMapping("/mypage/moveSub")
	public ModelAndView subMove(ModelAndView mv, String status) {
		
		System.out.println(status);
		
		switch (status) {
		case "product":
			mv.setViewName("redirect:/mypage/ph.do");
			break;
		case "funding" :
			break;
		case "action" :
			break;
		}
		
		return mv;
	}
//	public String subMove(String status) {
//		System.out.println(status);
//		return "/mypage/paymentHistory";
//	}
	
}

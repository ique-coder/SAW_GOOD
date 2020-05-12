package com.saw.good.auction.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AuctionController {
	@RequestMapping("/auction/list")
	public ModelAndView auctionList(ModelAndView mv) {
		System.out.println("들어오냐;");
		mv.setViewName("auction/auctionList");
		return mv;
		
	}
	
//	@RequestMapping("/funding/detail")
//	public ModelAndView fundingDetail(ModelAndView mv) {
//		mv.setViewName("funding/detail");
//		return mv;
//	}
}

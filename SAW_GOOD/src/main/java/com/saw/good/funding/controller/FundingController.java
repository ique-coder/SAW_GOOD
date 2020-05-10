package com.saw.good.funding.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FundingController {

	@RequestMapping("/funding/list")
	public ModelAndView fundingList(ModelAndView mv) {
		
		mv.setViewName("funding/list");
		return mv;
		
	}
	
	@RequestMapping("/funding/detail")
	public ModelAndView fundingDetail(ModelAndView mv) {
		mv.setViewName("funding/detail");
		return mv;
	}
	
}

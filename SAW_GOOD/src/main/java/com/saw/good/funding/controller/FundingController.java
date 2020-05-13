package com.saw.good.funding.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.saw.good.funding.model.service.FundingService;
import com.saw.good.funding.model.vo.Funding;

@Controller
public class FundingController {

	@Autowired
	FundingService service;
	
	@Autowired
	Logger logger;
	
	@RequestMapping("/funding/list")
	public ModelAndView fundingList(ModelAndView mv) {
		int numPerPage = 20;
		List<Funding> list = service.selectList(numPerPage);
		
		mv.addObject("list",list);
		
		mv.setViewName("funding/list");
		return mv;
		
	}
	
	@RequestMapping("/funding/detail")
	public ModelAndView fundingDetail(ModelAndView mv,Funding item) {
		
		Funding f = service.selectItem(item.getFdNo());
		
		mv.addObject("f",f);
		mv.setViewName("funding/detail");
		return mv;
	}
	
}

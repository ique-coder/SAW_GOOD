package com.saw.good.admin.funding.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.saw.good.admin.funding.model.service.AdminFundingService;
import com.saw.good.common.PageFactory;

@Controller
public class AdminFundingController {
	
	@Autowired
	private AdminFundingService service;
	
	
	@RequestMapping("/admin/funding")
	public ModelAndView funding(ModelAndView mv
			,@RequestParam(value="cPage",defaultValue="1") int cPage,@RequestParam(value="numPerPage",defaultValue="10") int numPerPage) {
		
		List<Map<String,String>> fundingDisAgree=service.selectFundingDisAgree(cPage,numPerPage);
		List<Map<String,String>> fundingAgree=service.selectFundingAgree(cPage,numPerPage);

		int disAgTotal=service.countFundingDisAgree();
		int agTotal=service.countFundingAgree();

		String disAgPageBar=PageFactory.getPage(disAgTotal, cPage, numPerPage, "funding");
		String agPageBar=PageFactory.getPage(agTotal, cPage, numPerPage, "funding");
		
		//펀딩에 참여한 목표금액 도달 여부
		List<Map<String,String>> targetPrice=service.sumPartPrice();
		
		mv.addObject("fundingDisAgree", fundingDisAgree);
		mv.addObject("fundingAgree", fundingAgree);
		mv.addObject("disAgPageBar", disAgPageBar);
		mv.addObject("agPageBar", agPageBar);
		mv.addObject("targetPrice", targetPrice);
		mv.setViewName("admin/funding/fundingManager");
		return mv;
	}
	
	@RequestMapping("/admin/fundingView")
	public String fundingView() {
		return "admin/funding/fundingView";
	}

}

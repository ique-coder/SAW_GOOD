package com.saw.good.admin.funding.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminFundingController {
	
	@RequestMapping("/admin/funding")
	public String funding() {
		return "admin/funding/fundingManager";
	}
	
	@RequestMapping("/admin/fundingView")
	public String fundingView() {
		return "admin/funding/fundingView";
	}

}

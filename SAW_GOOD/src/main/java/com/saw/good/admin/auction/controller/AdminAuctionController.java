package com.saw.good.admin.auction.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.saw.good.admin.auction.model.service.AdminAuctionService;

@Controller
public class AdminAuctionController {
	
	@Autowired
	private AdminAuctionService service;

	@RequestMapping("/admin/auction")
	public String AuctionList() {
		
		return "admin/auction/auctionManager";
	}
}

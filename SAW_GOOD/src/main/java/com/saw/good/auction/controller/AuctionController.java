package com.saw.good.auction.controller;

import java.util.List;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.saw.good.auction.model.service.AuctionService;
import com.saw.good.auction.model.vo.Auction;


@Controller
public class AuctionController {

	@Autowired
	AuctionService service;
	
	@Autowired
	Logger logger;
	@RequestMapping("/auction/list")
	public ModelAndView auctionList(ModelAndView mv) {

		List<Auction> list = service.selectAcList();
		System.out.println(list);
		mv.addObject("list",list);
		mv.setViewName("auction/auctionList");
		return mv;
		
	}
	
//	@RequestMapping("/funding/detail")
//	public ModelAndView fundingDetail(ModelAndView mv) {
//		mv.setViewName("funding/detail");
//		return mv;
//	}
}

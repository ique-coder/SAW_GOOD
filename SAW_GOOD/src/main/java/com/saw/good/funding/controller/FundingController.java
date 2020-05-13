package com.saw.good.funding.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.saw.good.funding.model.service.FundingService;
import com.saw.good.funding.model.vo.FDMember;
import com.saw.good.funding.model.vo.Funding;

@Controller
public class FundingController {

	@Autowired
	FundingService service;
	
	@Autowired
	Logger logger;
	
	@RequestMapping("/funding/list")
	public ModelAndView fundingList(ModelAndView mv) {
		//인기있는 아이템 9개 가져오기 (상단 노출)
		int high = 9;
		List<Funding> highList = service.selectHighList(high);
		
		//데이터 20개씩 가져오기
		int numPerPage = 20;
		List<Funding> list = service.selectList(numPerPage);
		
		mv.addObject("highList",highList);
		mv.addObject("list",list);
		
		mv.setViewName("funding/list");
		return mv;
		
	}
	
	@RequestMapping("/funding/detail")
	public ModelAndView fundingDetail(ModelAndView mv,Funding item) {
		
		Funding f = service.selectItem(item.getFdNo());
		List<FDMember> list = service.selectMemberList(item.getFdNo());
		Map<String,Integer> map = service.selectPriceCount(item.getFdNo());
		
		mv.addObject("f",f);
		mv.addObject("list",list);
		mv.addObject("map",map);
	
		mv.setViewName("funding/detail");
		return mv;
	}
	
}

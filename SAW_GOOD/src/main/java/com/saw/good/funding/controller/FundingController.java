package com.saw.good.funding.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.saw.good.common.PageFactory;
import com.saw.good.funding.model.service.FundingService;
import com.saw.good.funding.model.vo.FDMember;
import com.saw.good.funding.model.vo.FDReword;
import com.saw.good.funding.model.vo.Funding;
import com.saw.good.member.model.vo.Member;
import com.saw.good.payment.service.PaymentService;

@Controller
public class FundingController {

	
	PaymentService payservice;
	
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
		//제품, 사람수 총 참여가격 포함
		
		Funding f = service.selectItem(item.getFdNo());
		//해당 제품에 참여한 사람 목록
		List<FDMember> list = service.selectMemberList(item.getFdNo());
		//해당 제품에 참여한 사람 수 , 총 가격 / 비활성: 서브쿼리로 변경 
		//Map<String,Integer> map = service.selectPriceCount(item.getFdNo());
		
		//리워드목록 불러오기
		List<FDReword> reword = service.selectRewordList(item.getFdNo());
		
		mv.addObject("f",f);
		mv.addObject("list",list);
		mv.addObject("reword",reword);
		mv.setViewName("funding/detail");
		
		return mv;
	}
	
	@RequestMapping("/funding/patronage/step1")
	public ModelAndView fundingPatronage(ModelAndView mv,FDMember m ,@SessionAttribute ("loginMember") Member member) {
	
		//로그인 한 상태에서 후원할 수있도록 수정 
		//결제 후 db에 추가하는 것
		//m.setUserId((String)session.getAttribute("loginMember").get);
		
		m.setUserId(member.getUserId());
		System.out.println(m);
		int result = service.insertFDMember(m);
		
		if(result>0) {
			System.out.println(" 구매성공" );
		}else {
			System.out.println(" 구매실패" );
		}
		return mv;
	}
	
	@RequestMapping("/funding/patronage/step2")
	public ModelAndView fundingPatronageEnd(ModelAndView mv) {
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("/funding/detail/partList.ajax")
	public Map<String,Object> fundingPartList(ModelAndView mv ,@RequestParam int fdNo, @RequestParam int cPage) {
		
		int numPerPage = 5;
		System.out.println(fdNo+" "+cPage);
		
		List<FDMember> list = service.selectFDMemberList(fdNo,cPage,numPerPage);
	
		int count = service.selectFDMemberCount(fdNo);
		
		Map<String,Object> map = new HashMap();
		map.put("list",list);
		map.put("pageBar", PageFactory.getPageForAjax(count,cPage,numPerPage));
		map.put("count",count);
		return map;
		
	}
	
	@RequestMapping("/funding/enroll/step1")
	public ModelAndView enrollFunding(ModelAndView mv) {
		
		mv.setViewName("funding/enrollView");
		return mv;
	}
	
}

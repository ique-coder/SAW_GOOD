package com.saw.good.funding.controller;

import java.util.List;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.saw.good.funding.model.service.FundingService;
import com.saw.good.funding.model.vo.Comment;
import com.saw.good.funding.model.vo.FDMember;
import com.saw.good.funding.model.vo.FDReword;
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
		//제품, 사람수 총 참여가격 포함
		
		Funding f = service.selectItem(item.getFdNo());
		//해당 제품에 참여한 사람 목록
		List<FDMember> list = service.selectMemberList(item.getFdNo());
		//해당 제품에 참여한 사람 수 , 총 가격 / 비활성: 서브쿼리로 변경 
		//Map<String,Integer> map = service.selectPriceCount(item.getFdNo());
		
		//리워드목록 불러오기
		List<FDReword> reword = service.selectRewordList(item.getFdNo());
		
		// 댓글 리스트 가져오기 - castle
		List<Comment> commentList = service.selectComment(item.getFdNo());
		// re댓글 리스트 가져오기 - castle
		List<Comment> reCommentList = service.selectReComment(item.getFdNo());
		
		mv.addObject("f",f);
		mv.addObject("list",list);
		mv.addObject("reword",reword);
		mv.addObject("commentList", commentList);
		mv.addObject("reCommentList", reCommentList);
		mv.setViewName("funding/detail");
		return mv;
	}
	
	@RequestMapping("/funding/patronage/step1")
	public ModelAndView fundingPatronage(ModelAndView mv, FDReword r) {
		System.out.println("1111");
		System.out.println(r);
		//로그인 한 상태에서 후원할 수있도록 수정 
		//결제 후 db에 추가하는 것
		
		return mv;
	}
	
}

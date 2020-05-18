package com.saw.good.funding.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.saw.good.funding.model.service.FundingReviewService;
import com.saw.good.funding.model.vo.Comment;

@Controller
public class FundingReviewController {

	@Autowired
	FundingReviewService service;
	
	@Autowired
	Logger logger;
	
	@RequestMapping("/funding/commentAjax.do")
	public ModelAndView reviewAjax(String commentStatus, Comment comment, ModelAndView mv) {
		
		boolean check = service.reviewAjax(commentStatus, comment);
		Comment returnComment = null;
		
		// 이걸로 구분하자.
		String frontString = commentStatus.substring(0, 2);
		
		if(check && commentStatus.equals("insert")) {
			returnComment = service.reviewReturn(comment, "new");			
		} else if(check && commentStatus.equals("reInsert")) {
			returnComment = service.reviewReturn(comment, "re");
		} else {
			returnComment = service.reviewReturn(comment, "");
		}
		
		System.out.println(returnComment.getCommentDate());
		
		mv.setViewName("jsonView");
		mv.addObject("check", check);
		mv.addObject("comment", returnComment);
		
		return mv;
	}
	
	
}

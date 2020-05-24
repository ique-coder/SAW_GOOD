package com.saw.good.mypage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.saw.good.member.model.vo.Member;
import com.saw.good.mypage.model.service.phService;

@Controller
public class PaymentHistoryController {

	@Autowired
	private phService service;
	
	
	@RequestMapping("/mypage/ph.do")
	public ModelAndView ph(ModelAndView mv, @SessionAttribute("loginMember") Member m) {

		String userId = m.getUserId();
		
		List<Map<String,String>> list = service.product(userId);
		
		mv.addObject("list", list);
		mv.addObject("member",m);
		mv.setViewName("/mypage/paymentHistory");
		
		return mv;
	}
	
	@RequestMapping("/mypage/auction.do")
	public ModelAndView auction(ModelAndView mv, @SessionAttribute("loginMember") Member m) {

		String userId = m.getUserId();
		
		List<Map<String,String>> list = service.auction(userId);
		
		mv.addObject("list", list);
		mv.addObject("member",m);
		mv.setViewName("/mypage/auctionPH");
		
		return mv;
	}
	
	@RequestMapping("/mypage/funding.do")
	public ModelAndView funding(ModelAndView mv, @SessionAttribute("loginMember") Member m) {

		String userId = m.getUserId();
		
		List<Map<String,String>> list = service.funding(userId);
		
		mv.addObject("list", list);
		mv.addObject("member",m);
		mv.setViewName("/mypage/fundingPH");
		
		return mv;
	}
	
	
	@RequestMapping("/mypage/buyOk")
	public ModelAndView buyOk(ModelAndView mv, @SessionAttribute("loginMember") Member m, HttpServletRequest request) {
		
		String userId = m.getUserId();
		int phno = Integer.parseInt(request.getParameter("phno"));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("phno", phno);
		
		int result = service.buyOk(map);
		if(result > 0) {
			map.put("status", 5);
			int status = service.status(map);
		}
		
		mv.setViewName("redirect:/mypage/ph.do");
		
		return mv;
	}
	
	@RequestMapping("/mypage/extend")
	public ModelAndView extend(ModelAndView mv, @SessionAttribute("loginMember") Member m, HttpServletRequest request) {
		
		String userId = m.getUserId();
		int phno = Integer.parseInt(request.getParameter("phno"));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("phno", phno);
		
		int result = service.extend(map);
		if(result > 0) {
			map.put("status", 3);
			int status = service.status(map);
		}
		
		mv.setViewName("redirect:/mypage/ph.do");
		
		return mv;
	}
	
	@RequestMapping("/mypage/review")
	public ModelAndView review(ModelAndView mv, HttpServletRequest request) {
		
		int productNo = Integer.parseInt(request.getParameter("productNo"));
		
		mv.addObject("no", productNo);
		mv.setViewName("redirect:/product/productView");

		return mv;
		
	}
}

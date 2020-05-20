package com.saw.good.cart.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.saw.good.cart.model.service.CartService;
import com.saw.good.member.model.vo.Member;

@Controller
public class CartController {
	
	@Autowired
	private CartService service;

	@RequestMapping("/payment/cart")
	public ModelAndView cart(ModelAndView mv,@SessionAttribute("loginMember") Member m) {
		
		String userId=m.getUserId();
		List<Map<String,String>> list=service.selectCart(userId);
		
		mv.addObject("list", list);
		mv.setViewName("cart/cart");
		return mv;
	}
}

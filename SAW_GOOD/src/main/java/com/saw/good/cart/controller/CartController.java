package com.saw.good.cart.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.saw.good.cart.model.service.CartService;

@Controller
public class CartController {
	
	@Autowired
	private CartService service;

	@RequestMapping("/product/cart")
	public ModelAndView cart(ModelAndView mv,String userId) {
		
		List<Map<String,String>> list=service.selectCart(userId);
		
		mv.addObject("list", list);
		mv.setViewName("cart/cart");
		return mv;
	}
}

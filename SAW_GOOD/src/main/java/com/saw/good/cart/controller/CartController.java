package com.saw.good.cart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.saw.good.cart.model.service.CartService;
import com.saw.good.member.model.vo.Member;

@Controller
public class CartController {
	
	@Autowired
	private CartService service;

	@RequestMapping("/payment/cart")
	public ModelAndView cart(ModelAndView mv,@SessionAttribute("loginMember") Member m,
			@RequestParam(value="no",required=false,defaultValue="0")int no, @RequestParam(value="amount",required=false,defaultValue="0") int amount
			,@RequestParam(value="price",required=false,defaultValue="") String price) {
		
		Map map = new HashMap();
		//Product p = service.selectProductView(no);
		if(no!=0 && price!="" && amount!=0 ) {
			String temp = price.replaceAll("[^0-9]", "");
			map.put("member", m);
			map.put("no", no);
			map.put("amount", amount);
			map.put("price", temp);
			int result = service.insertCart(map);
		}
		String userId=m.getUserId();
		List<Map<String,String>> list=service.selectCart(userId);
		
		mv.addObject("list", list);
		mv.setViewName("cart/cart");
		return mv;
	}
	
	@RequestMapping("/payment/deleteCart")
	public ModelAndView deleteCart(String[] productNo,ModelAndView mv,
			@SessionAttribute("loginMember") Member m) {
		String userid=m.getUserId();
		String msg="";
		int result=0;
		
		try {
			result=service.deleteCart(productNo,userid);
		}catch(RuntimeException e) {
			msg="선택한 상품삭제를 실패 하였습니다.";
		}
		if(result>0) {
			msg="선택한 상품을 삭제 하였습니다.";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("loc", "/payment/cart");
		mv.setViewName("admin/common/msg");
		
		return mv;
	}
	
}

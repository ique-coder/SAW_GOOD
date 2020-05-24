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
import com.saw.good.cart.model.vo.Cart;
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
		int result = 0;
		Cart data = null;
		String msg="";
		String loc="";
		
		if(no!=0 && price!="" && amount!=0 ) {
			String temp = price.replaceAll("[^0-9]", "");
			map.put("member", m);
			map.put("no", no);
			map.put("amount", amount);
			map.put("price", temp);
			try {
				data = service.selectData(map);
				if(data == null) {					
					result = service.insertCart(map);
				}else {
					msg="선택한 상품은 이미 장바구니에 담겨있습니다.";
					loc = "/product/productView?no="+no;
				}
			}catch(RuntimeException e) {
				msg="선택한 상품을 장바구니에 담는데 실패 하였습니다.";
				loc = "/product/productView?no="+no;
			}
			if(result>0) {
				msg="선택한 상품을 장바구니에 담았습니다.";
				loc = "/cart/cart";
			}
			
		}
		String userId=m.getUserId();
		List<Map<String,String>> list=service.selectCart(userId);
		
		mv.addObject("list", list);
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		
		return mv;
	}
	@RequestMapping("/cart/cart")
	public ModelAndView cartView(ModelAndView mv,@SessionAttribute("loginMember") Member m) {
		
		
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
		mv.addObject("loc", "/cart/cart");
		mv.setViewName("admin/common/msg");
		
		return mv;
	}
	
}

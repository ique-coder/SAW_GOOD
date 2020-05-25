package com.saw.good.furniture.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.saw.good.common.PageFactory;
import com.saw.good.furniture.model.service.FurnitureService;
import com.saw.good.member.model.vo.Member;
import com.saw.good.product.model.vo.Product;

@Controller
public class FurnitureController {
	@Autowired
	private FurnitureService service;
	@Autowired
	private Logger logger;
	
	@RequestMapping("/furniture/furniture.do")
	public ModelAndView furniture(@SessionAttribute("loginMember") Member m, ModelAndView mv) {
		
		String userId = m.getUserId();
		
		if(userId != null) {
			List<Map<String, Object>> cartList = service.cart(userId);
			mv.addObject("cart", cartList);
			int count = 0;
			for(Map<String, Object> str : cartList) {
				
				count+=(int)((BigDecimal)str.get("CARTCOUNT")).longValue();
//				for(String key : str.keySet()) {
//					count += Integer.parseInt(str.get(key));
//				}
			}
			mv.addObject("count", count);
		}
		
		mv.setViewName("furniture/furniture");
		
		
		return mv;
	}
	
	@RequestMapping("/furniture/category.do")
	@ResponseBody
	public ModelAndView category(ModelAndView mv, String categoryName, 
			@RequestParam(value="cPage",defaultValue="1") 
			int cPage,@RequestParam(value="numPerPage",defaultValue="10") int numPerPage,
			HttpServletResponse response) {
		// categoryName이 여러개면 나눠서 검색해줘야 해서 나눠준다.
		Map<String, String> categoryNames = new HashMap<String, String>();
		String[] arr = categoryName.split(",");
		// 추가해줌
		categoryNames.put("1", arr[0]);
		if(arr.length>1) {
			categoryNames.put("2", arr[1]);
		}
		categoryNames.put("size",String.valueOf(arr.length));
		// DB로 보냄
		List<Product> list = service.category(categoryNames);
		logger.debug(""+list);
		
		
		// paging 처리
		// count 받아오기
		int totalData = service.totalData(categoryNames); 
		String pages = PageFactory.getPage(totalData, cPage, numPerPage, "category.do");
		
		// modelAndView에 추가해줌
		mv.addObject("productList", list);
		mv.setViewName("jsonView");
		mv.addObject("pages", pages);
		
		response.setCharacterEncoding("UTF-8");
		
		return mv;
	}
	
	@RequestMapping("/furniture/addCart.do")
	public ModelAndView addCart(@SessionAttribute("loginMember") Member m, ModelAndView mv, HttpServletRequest request) {
		
		String userId = m.getUserId();
		String[] nos = request.getParameterValues("productNo");
		
		HashMap<String,String> productNo = new HashMap();
		
		for(int i=0; i<nos.length; i++) {
			int count = 0;
			for(int j=0; j<nos.length; j++) {
				if(nos[i].equals(nos[j])) {
					count++;
				}
			}
			productNo.put(nos[i], count+"");
		}
		
		boolean deleteCart = service.deleteCart(userId);
		
		if(deleteCart) {
			for(String key : productNo.keySet()) {
				Map<String,Object> product = new HashMap();
				product.put("userId", userId);
				product.put("no", key);
				product.put("amount", productNo.get(key));
				int result = service.insertCart(product);
			}
		}

		mv.setViewName("redirect:/cart/cart");
		
		return mv;
	}

}

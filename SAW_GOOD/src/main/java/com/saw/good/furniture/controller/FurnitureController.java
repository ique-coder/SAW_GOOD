package com.saw.good.furniture.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.saw.good.common.PageFactory;
import com.saw.good.furniture.model.service.FurnitureService;
import com.saw.good.product.model.vo.Product;

@Controller
public class FurnitureController {
	@Autowired
	private FurnitureService service;
	@Autowired
	private Logger logger;
	
	@RequestMapping("/furniture/furniture.do")
	public String furniture() {
		//mv.setViewName("furniture/furniture");
		return "furniture/furniture";
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

}

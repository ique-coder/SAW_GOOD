package com.saw.good.index.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.saw.good.index.model.service.IndexService;

@Controller
public class IndexAjaxController {
	
	@Autowired
	private IndexService service;
	
	@RequestMapping("/index.do")
	public ModelAndView index(ModelAndView mv, HttpServletResponse response) {
		
		List<Map<String, String>> newProduct = service.newProduct();
		List<Map<String, String>> newFunding = service.newFunding();
		List<Map<String, String>> newAuction = service.newAuction();
		
		mv.addObject("np", newProduct);
		mv.addObject("nF", newFunding);
		mv.addObject("nA", newAuction);
		mv.setViewName("jsonView");
		
		response.setCharacterEncoding("utf-8");
		
		return mv;
	}

}

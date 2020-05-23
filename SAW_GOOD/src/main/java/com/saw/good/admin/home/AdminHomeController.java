package com.saw.good.admin.home;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.saw.good.admin.home.model.service.AdminHomeService;

@Controller
public class AdminHomeController {
	
	@Autowired
	private AdminHomeService service;
	
	@RequestMapping("/admin")
	public ModelAndView adminHome(ModelAndView mv,HttpSession session) {
		
		//가장많이 팔린 상품 top5
		List<Map<String,String>> list=service.selectTopFive();
		//하루 판매량
		int[] total=service.totalPrice();
		for(int i : total) {
			System.out.println(i);
		}
		mv.addObject("totalPrice", total);
		mv.addObject("topfive", list);
		mv.setViewName("admin/home");
		return mv;
	}
}

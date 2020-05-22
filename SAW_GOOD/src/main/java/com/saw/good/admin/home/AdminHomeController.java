package com.saw.good.admin.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminHomeController {
	
	@RequestMapping("/admin")
	public ModelAndView adminHome(ModelAndView mv) {
		
		mv.setViewName("admin/home");
		return mv;
	}
}

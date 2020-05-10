package com.saw.good.furniture.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FurnitureController {
	
	@RequestMapping("/furniture/furniture.do")
	public String furniture() {
		return "furniture/furniture";
	}
}

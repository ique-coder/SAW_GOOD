package com.saw.good.admin.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminProductController {
	
	@RequestMapping("/admin/productRegist")
	public String productRegist() {
		
		return "admin/product/productRegist";
	}
	
	@RequestMapping("/admin/productManager")
	public String productManager() {
		
		return "admin/product/productManager";
	}
	
	@RequestMapping("/admin/productUpdate")
	public String productUpdate() {
		
		return "admin/product/productUpdate";
	}
}

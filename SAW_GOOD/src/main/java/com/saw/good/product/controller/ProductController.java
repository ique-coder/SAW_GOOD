package com.saw.good.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {
	
	@RequestMapping("/product/detail")
		public String productDetail() {
			return "product/productList";
	}
	
}

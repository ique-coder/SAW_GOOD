package com.saw.good.admin.product.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.saw.good.admin.product.model.service.AdminProductService;
import com.saw.good.common.PageFactory;

@Controller
public class AdminProductController {
	
	@Autowired
	private AdminProductService service;
	
	//상품등록 페이지 이동
	@RequestMapping("/admin/productRegist")
	public String productRegist() {
		
		return "admin/product/productRegist";
	}
	
	//상품관리 페이지 이동
	@RequestMapping("/admin/productManager")
	public ModelAndView productManager(ModelAndView m,
			@RequestParam(value="cPage",defaultValue="1") int cPage,@RequestParam(value="numPerPage",defaultValue="10") int numPerPage) {
		
		List<Map<String,String>> list=service.selectProduct(cPage,numPerPage);
		int totalData=service.countProduct();
		String pageBar=PageFactory.getPage(totalData, cPage, numPerPage, "productManager");
		
		m.addObject("list", list);
		m.addObject("pageBar", pageBar);
		m.addObject("numPerPage", numPerPage);
		m.addObject("cPage", cPage);
		m.setViewName("admin/product/productManager");
		return m;
	}
	
	//상품수정 페이지 이동
	@RequestMapping("/admin/productUpdate")
	public String productUpdate() {
		
		return "admin/product/productUpdate";
	}
	

	
	
	
	
	
	
	
	
	
	
}

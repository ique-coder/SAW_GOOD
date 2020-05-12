package com.saw.good.admin.product.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.saw.good.admin.home.AdminProduct;
import com.saw.good.admin.product.model.service.AdminProductService;
import com.saw.good.common.PageFactory;

@Controller
public class AdminProductController {
	
	@Autowired
	private AdminProductService service;
	
	@Autowired
	private Logger logger;
	
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
	public ModelAndView productUpdate(int productno,ModelAndView m) {
		
		Map<String,String> pro=service.oneProduct(productno);
		
		m.addObject("product", pro);
		m.setViewName("admin/product/productUpdate");
		return m;
	}
	//상품 삭제
	@RequestMapping("/admin/productDelete")
	public ModelAndView deleteProduct(int productno,ModelAndView m) {
		
		int result=service.deleteProduct(productno);
		
		String msg=result>0?"삭제성공":"삭제실패";
		String loc="/admin/productManager";
		m.addObject("msg", msg);
		m.addObject("loc", loc);
		m.setViewName("admin/common/msg");
		
		return m;
	}
	//선택상품 삭제
	@RequestMapping("/admin/checkDelete")
	public ModelAndView checkDelete(AdminProduct a,ModelAndView m) {
		
		int result=service.checkDelete(a);
		
		String msg=result==a.getProcheck().length?"삭제성공":"삭제실패";
		String loc="/admin/productManager";
		m.addObject("msg", msg);
		m.addObject("loc", loc);
		m.setViewName("admin/common/msg");

		return m;
	}
	
	@RequestMapping("/admin/searchProduct")
	public ModelAndView searchProduct(AdminProduct a,ModelAndView m,
			@RequestParam(value="cPage",defaultValue="1") int cPage,@RequestParam(value="numPerPage",defaultValue="10") int numPerPage) {
		//통합검색
		List<Map<String,String>> list=service.searchProduct(cPage,numPerPage,a);
		int totalData=service.countSearchProduct(a);
		String pageBar=PageFactory.getPage(totalData, cPage, numPerPage, "searchProduct");
		
		m.addObject("list", list);
		m.addObject("pageBar", pageBar);
		m.addObject("numPerPage", numPerPage);
		m.addObject("cPage", cPage);
		m.setViewName("admin/product/productManager");
		return m;
		
	}
	
	
	
	
	
	
	
	
	
	
}

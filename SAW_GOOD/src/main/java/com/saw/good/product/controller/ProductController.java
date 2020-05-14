package com.saw.good.product.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.saw.good.common.PageFactory;
import com.saw.good.common.ProductCategoryPage;
import com.saw.good.common.ProductFinderPage;
import com.saw.good.product.model.service.ProductService;
import com.saw.good.product.model.vo.Product;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService service;
	
	@RequestMapping("/product/productList")
	public ModelAndView memberManager(@RequestParam(value="cPage",defaultValue="1") int cPage,
							@RequestParam(value="numPerPage",defaultValue="9") int numPerPage,
							ModelAndView m) {
		
		List<Map<String,String>> list =service.selectProduct(cPage,numPerPage);
		int totalData=service.countProduct();
		String pageBar=PageFactory.getPage(totalData, cPage, numPerPage, "productList");
		
		m.addObject("list", list);
		m.addObject("pageBar", pageBar);
		m.addObject("numPerPage", numPerPage);
		m.addObject("cPage", cPage);
		m.setViewName("product/productList");
		return m;
	}
	@RequestMapping("/product/productView")
	public ModelAndView productView(int no,ModelAndView mv) {
		
		Product p=service.selectProductView(no);
		
		mv.addObject("product", p);
		mv.setViewName("product/detail");
		return mv;
	}
	
	@RequestMapping("/product/searchProduct")
	public ModelAndView searchMember(String keyword,ModelAndView m,
					@RequestParam(value="cPage",defaultValue="1") int cPage,
						@RequestParam(value="numPerPage",defaultValue="9") int numPerPage,
						HttpServletResponse response) {
		Map<String,String> map=new HashMap();
		
		response.setCharacterEncoding("UTF-8");
		map.put("keyword",keyword);
		
		List<Map<String,String>> list=service.searchProduct(cPage,numPerPage,map);
		int totalData=service.countSearchProduct(map); 
		
		String pageBar=ProductFinderPage.getPage(totalData, cPage, numPerPage, keyword, "searchProduct");
		
		System.out.println(numPerPage);
		System.out.println(keyword);
		m.addObject("list", list);
		m.addObject("pageBar", pageBar);
		m.addObject("keyword", keyword);
		m.addObject("numPerPage", numPerPage);
		m.addObject("cPage", cPage);
		m.setViewName("product/productList");
		return m;
	}
	@RequestMapping("/product/productCategory")
	public ModelAndView productCategory(ModelAndView mv,String[] category,
			@RequestParam(value="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerPage",defaultValue="9") int numPerPage) {
		
		List<String> ca=new ArrayList();
		for(int i=0;i<category.length;i++) {
			ca.add(category[i]);
		}
		Map<String,Object> map=new HashMap();
		map.put("category", ca);
		List<Map<String,Object>> list=service.searchCategory(cPage,numPerPage,map);
		int totalData=service.countSearchCategory(map); 
		
		String pageBar=ProductCategoryPage.getPage(totalData, cPage, numPerPage, category, "searchCategory");
		
		mv.addObject("list", list);
		mv.addObject("pageBar", pageBar);
		mv.addObject("category", category);
		mv.addObject("numPerPage", numPerPage);
		mv.addObject("cPage", cPage);
		mv.setViewName("product/productList");
		
		return mv;
	}
	@RequestMapping("/qna/qnaForm")
	public String qnaForm(Product p) {
		return "product/qnaWrite";
	}
	@RequestMapping("/photo/upload")
	public ModelAndView photoUpload(ModelAndView mv) {
		
		return mv;
	}
	
}

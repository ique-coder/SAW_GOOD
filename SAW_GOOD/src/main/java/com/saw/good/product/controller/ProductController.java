package com.saw.good.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.saw.good.common.PageFactory;
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
	@ResponseBody
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
	
}

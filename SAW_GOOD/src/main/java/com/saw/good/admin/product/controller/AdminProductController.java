package com.saw.good.admin.product.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
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
	public ModelAndView searchProduct(AdminProduct a,ModelAndView m,HttpServletRequest request,
			@RequestParam(value="category",defaultValue="") String[] category,@RequestParam(value="brand",defaultValue="") String[] brand,
			@RequestParam(value="productprice",defaultValue="0") int productprice,@RequestParam(value="produtname",defaultValue="") String productname,
			@RequestParam(value="cPage",defaultValue="1") int cPage,@RequestParam(value="numPerPage",defaultValue="1") int numPerPage) {
		//통합검색
		List<Map<String,String>> list=service.searchProduct(cPage,numPerPage,a);
		int totalData=service.countSearchProduct(a);
		String pageBar="";
		int totalPage=(int)Math.ceil((double)totalData/numPerPage);
		
		int pageBarSize=5;
		
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
	
		pageBar+="<div id='pageBar'>";
		//이전
		if(pageNo==1) {
			pageBar+="<span><</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/admin/searchProduct?cPage="+(pageNo-1)+"&numPerPage="+numPerPage;
			pageBar+="&produtname="+productname;
			for(String c : category) {
				pageBar+="&category="+c;
			}
			for(String b : brand) {
				pageBar+="&brand="+b;
			}
			pageBar+="&productprice="+productprice;
			pageBar+="'><</a> ";
		}
		//숫자
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<span class='cPage'>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getContextPath()+"/admin/searchProduct?cPage="+pageNo+"&numPerPage="+numPerPage;
				pageBar+="&produtname="+productname;
				for(String c : category) {
					pageBar+="&category="+c;
				}
				for(String b : brand) {
					pageBar+="&brand="+b;
				}
				pageBar+="&productprice="+productprice;
				pageBar+="'>"+pageNo+"</a> ";
			}
			pageNo++;
		}
		
		//다음
		if(pageNo>totalPage) {
			pageBar+="<span>></span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/admin/searchProduct?cPage="+pageNo+"&numPerPage="+numPerPage;
			pageBar+="&produtname="+productname;
			for(String c : category) {
				pageBar+="&category="+c;
			}
			for(String b : brand) {
				pageBar+="&brand="+b;
			}
			pageBar+="&productprice="+productprice;
			pageBar+="'>></a>";
		}
		pageBar+="</div>";
		
		m.addObject("list", list);
		m.addObject("pageBar", pageBar);
		m.addObject("numPerPage", numPerPage);
		m.addObject("cPage", cPage);
		m.addObject("productname", productname);
		m.addObject("brand", brand);
		m.addObject("productprice", productprice);
		m.setViewName("admin/product/productManager");
		return m;
		
	}
	
	@ResponseBody
	@RequestMapping("/admin/productRegistEnd")
	public ModelAndView productRegistEnd(ModelAndView mv,
			MultipartHttpServletRequest request,HttpSession session) throws Exception{
		System.out.println(request.getParameter("productName"));
		System.out.println(request.getParameter("productPrice"));
		System.out.println(request.getParameter("productContent"));
		
		List<MultipartFile> fileList = new ArrayList<MultipartFile>();

		String path=session.getServletContext().getRealPath("/resources/upload/product");

		mv.setViewName("jsonView");
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
}

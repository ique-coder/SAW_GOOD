package com.saw.good.product.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.saw.good.common.PageFactory;
import com.saw.good.common.ProductCategoryPage;
import com.saw.good.common.ProductFinderPage;
import com.saw.good.common.QnaPage;
import com.saw.good.product.model.service.ProductService;
import com.saw.good.product.model.vo.Product;
import com.saw.good.product.model.vo.ProductQna;
import com.saw.good.product.model.vo.ProductReview;

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
	public ModelAndView productView(@RequestParam(value="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerPage",defaultValue="10") int numPerPage,
			int no,ModelAndView mv) {
		
		Product p=service.selectProductView(no);
		List<ProductQna> pq=service.selectProductQna(no,cPage,numPerPage);
		
		int totalQna=service.countQna(no);
		String pageBar=QnaPage.getPage(no,totalQna, cPage, numPerPage, "productView");
		
		List<ProductReview> pr=service.selectProductReview(no,cPage,numPerPage);
		int totalReview=service.countReview(no);
		String repageBar=QnaPage.getPage(no,totalReview, cPage, numPerPage, "productView");
		int fivestarCnt=service.countFive(no);
		int fourstarCnt=service.countFour(no);
		int threestarCnt=service.countThree(no);
		int twostarCnt=service.countTwo(no);
		int onestarCnt=service.countOne(no);
		
		mv.addObject("fiveStar", fivestarCnt);
		mv.addObject("fourStar", fourstarCnt);
		mv.addObject("threeStar", threestarCnt);
		mv.addObject("twoStar", twostarCnt);
		mv.addObject("oneStar", onestarCnt);
		mv.addObject("pageBar", pageBar);
		mv.addObject("repageBar", repageBar);
		mv.addObject("numPerPage", numPerPage);
		mv.addObject("cPage", cPage);
		mv.addObject("product", p);
		mv.addObject("qna", pq);
		mv.addObject("review", pr);
		mv.addObject("totalReview", totalReview);
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
	public ModelAndView qnaForm(int no, ModelAndView mv) {
		
		Product p=service.selectProductView(no);
		
		mv.addObject("product", p);
		mv.setViewName("product/qnaWrite");
		return mv;
	}
	@RequestMapping("/qna/qnaReply")
	public ModelAndView qnaReply(int no, ModelAndView mv, int qna, String title) {
		
		Product p=service.selectProductView(no);
		
		mv.addObject("product", p);
		mv.addObject("qnaNo", qna);
		mv.addObject("title", title);
		mv.setViewName("product/qnaReply");
		return mv;
	}
	@RequestMapping("/qna/qnaReplyEnd")
	public ModelAndView qnaReply(ModelAndView mv, @RequestParam Map map) {
		
		int result = service.insertReplyQna(map);
		System.out.println(map);
		
		String msg=(result>0)?"등록성공":"등록실패";
		String loc=(result>0)?"/product/productView?no="+map.get("productNo"):"/qna/qnaReply";
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		return mv;
	}
	@RequestMapping("/qna/qnaBoardEnd")
	public ModelAndView photoUpload(ModelAndView mv, @RequestParam Map map) {
		
		int result = service.insertQna(map);
		
		String msg=(result>0)?"등록성공":"등록실패";
		String loc=(result>0)?"/product/productView?no="+map.get("productNo"):"/qna/qnaForm";
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		return mv;
	}
	@RequestMapping("/qna/qnaRock")
	@ResponseBody
	public ModelAndView qnaRock(@RequestParam(value="pass") String pass, int no,
				String content, HttpServletResponse response, ModelAndView mv) {
		
		ProductQna qna=service.selectQnaCheck(no);
		boolean flag = false;
		if(pass.equals(qna.getQnaPass())) {
			flag = true;
		}
		response.setCharacterEncoding("UTF-8");
		mv.addObject("flag", flag);
		mv.addObject("pass", pass);
		mv.addObject("content", content);
		mv.setViewName("jsonView");
		return mv;
	}
	@RequestMapping("/review/reviewEnd")
	public ModelAndView imgUpload(ModelAndView mv, 
			MultipartHttpServletRequest request, @RequestParam Map map) {
		
		int result = service.insertReview(map);
		String msg=(result>0)?"등록성공":"등록실패";
		String loc="/product/productView?no="+map.get("no");
		
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		return mv;
	}
	@RequestMapping("/review/reviewImg")
	@ResponseBody
	public ModelAndView reviewUpload(ModelAndView mv,
			MultipartFile uploadfile, HttpSession session,
			HttpServletResponse response) throws Exception{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
		
		//폴더경로 찾기
		String path=session.getServletContext().getRealPath("/resources/upload/review");
		String originalpd="";
		String renamepd="";
		
		//폴더경로 없으면 생성
		File fileDir = new File(path); 
		if (!fileDir.exists()) { fileDir.mkdirs(); }
		//상품 썸네일 이미지
		if(!uploadfile.isEmpty()) {
			int rnd=(int)(Math.random()*1000);
			originalpd=uploadfile.getOriginalFilename();
			String ext=originalpd.substring(originalpd.lastIndexOf("."));
			renamepd=sdf.format(System.currentTimeMillis())+"_"+rnd+ext;
			uploadfile.transferTo(new File(fileDir+"/"+renamepd));
		}
		
		response.setCharacterEncoding("UTF-8");
		mv.addObject("original", originalpd);
		mv.addObject("renamed", renamepd);
		mv.setViewName("jsonView");
		
		return mv;
	}
	@RequestMapping("/review/deleteImg")
	@ResponseBody
	public ModelAndView deleteImg(ModelAndView mv,
			String rename, HttpSession session)throws Exception{
		
		//폴더경로 찾기
		String path=session.getServletContext().getRealPath("/resources/upload/review");
		System.out.println(rename);
		File fileDir = new File(path);
		File delete=new File(fileDir+"/"+rename);
		if(delete.exists()) {
			delete.delete();
		}
		
		mv.setViewName("jsonView");
		return mv;
	}
	@RequestMapping("/search/searchForm")
	public String searchForm() {
		return "product/searchForm";
	}
	
}


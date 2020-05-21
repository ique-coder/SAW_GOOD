package com.saw.good.admin.auction.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.saw.good.admin.auction.model.service.AdminAuctionService;
import com.saw.good.common.PageFactory;

@Controller
public class AdminAuctionController {
	
	@Autowired
	private AdminAuctionService service;
	
	//옥션 미리보기
	@RequestMapping("/admin/auctionView")
	public ModelAndView auctionView(ModelAndView mv,int acno) {
		
		Map<String,String> map=service.selectOneAuction(acno);
		
		mv.addObject("auc", map);
		mv.setViewName("admin/auction/auctionView");
		return mv;
	}
	//옥션 동의 페이지
	@RequestMapping("admin/auctionAgreeList")
	public ModelAndView auctionAgreeList(ModelAndView mv,@RequestParam(value="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerPage",defaultValue="10") int numPerPage) {
		
		List<Map<String,String>> list=service.selectAuctionAgree(cPage,numPerPage);
		int totalData=service.countAuctionAgree();
		
		String pageBar=PageFactory.getPage(totalData, cPage, numPerPage, "auctionAgreeList");
		
		mv.addObject("auclist", list);
		mv.addObject("pageBar", pageBar);
		mv.addObject("cPage", cPage);
		mv.addObject("numPerPage", numPerPage);
		mv.setViewName("admin/auction/auctionDisAgree");
		return mv;
	}
	//옥션 비동의 페이지
	@RequestMapping("admin/auctionDisAgreeList")
	public ModelAndView auctionDisAgreeList(ModelAndView mv,@RequestParam(value="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerPage",defaultValue="10") int numPerPage) {
		
		List<Map<String,String>> list=service.selectAuctionDisAgree(cPage,numPerPage);
		int totalData=service.countAuctionDisAgree();
		
		String pageBar=PageFactory.getPage(totalData, cPage, numPerPage, "auctionDisAgreeList");
		
		mv.addObject("auclist", list);
		mv.addObject("pageBar", pageBar);
		mv.addObject("cPage", cPage);
		mv.addObject("numPerPage", numPerPage);
		mv.setViewName("admin/auction/auctionDisAgree");
		return mv;
	}
	//옥션 비동의 페이지 검색
	@RequestMapping("/admin/auctionDisAgreeSearch")
	public ModelAndView auctionDisAgreeSearch(ModelAndView mv,
			HttpServletRequest request,
			@RequestParam(value="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerPage",defaultValue="10") int numPerPage,
			@RequestParam(value="searchType",defaultValue="") String searchType,
			@RequestParam(value="keyword",defaultValue="") String keyword,
			@RequestParam(value="enrollDate",defaultValue="") String enrollDate,
			@RequestParam(value="rank",defaultValue="") String rank,
			@RequestParam(value="category",defaultValue="") String[] category,
			@RequestParam(value="brand",defaultValue="") String[] brand) {
		
		Map<String,Object> map=new HashMap();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		map.put("enrollDate", enrollDate);
		map.put("rank", rank);
		if(category.length==0) {
			map.put("category", null);
		}else {
			map.put("category", category);
		}
		if(brand.length==0) {
			map.put("brand", null);
		}else {
			map.put("brand", brand);
		}
		
		List<Map<String,String>> list=service.selectDisAgreeSearch(map,cPage,numPerPage);
		int disAgTotal=service.countDisAgreeSearch(map);
		
		int totalPage=(int)Math.ceil((double)disAgTotal/numPerPage);
		int pageBarSize=5;
		
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		String dagPageBar="";
		
		dagPageBar+="<div id='pageBar'>";
		//이전
		if(pageNo==1) {
			dagPageBar+="<span><</span>";
		}else {
			dagPageBar+="<a href='"+request.getContextPath()+"/admin/auctionDisAgreeSearch?cPage="+(pageNo-1)+"&numPerPage="+numPerPage;
			dagPageBar+="&searchType="+searchType;
			dagPageBar+="&keyword="+keyword;
			dagPageBar+="&enrollDate="+enrollDate;
			dagPageBar+="&rank="+rank;
			for(String c : category) {
				dagPageBar+="&category="+c;
			}
			for(String b : brand) {
				dagPageBar+="&brand="+b;
			}
			dagPageBar+="'><</a> ";
		}
		//숫자
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				dagPageBar+="<span class='cPage'>"+pageNo+"</span>";
			}else {
				dagPageBar+="<a href='"+request.getContextPath()+"/admin/auctionDisAgreeSearch?cPage="+pageNo+"&numPerPage="+numPerPage;
				dagPageBar+="&searchType="+searchType;
				dagPageBar+="&keyword="+keyword;
				dagPageBar+="&enrollDate="+enrollDate;
				dagPageBar+="&rank="+rank;
				for(String c : category) {
					dagPageBar+="&category="+c;
				}
				for(String b : brand) {
					dagPageBar+="&brand="+b;
				}
				dagPageBar+="'>"+pageNo+"</a> ";
			}
			pageNo++;
		}
		
		//다음
		if(pageNo>totalPage) {
			dagPageBar+="<span>></span>";
		}else {
			dagPageBar+="<a href='"+request.getContextPath()+"/admin/auctionDisAgreeSearch?cPage="+pageNo+"&numPerPage="+numPerPage;
			dagPageBar+="&searchType="+searchType;
			dagPageBar+="&keyword="+keyword;
			dagPageBar+="&enrollDate="+enrollDate;
			dagPageBar+="&rank="+rank;
			for(String c : category) {
				dagPageBar+="&category="+c;
			}
			for(String b : brand) {
				dagPageBar+="&brand="+b;
			}
			dagPageBar+="'>></a>";
		}
		dagPageBar+="</div>";
		
		mv.addObject("auclist",list );
		mv.addObject("pageBar", dagPageBar);
		mv.addObject("cPage",cPage);
		mv.addObject("numPerPage", numPerPage);
		mv.addObject("searchType", searchType);
		mv.addObject("keyword", keyword);
		mv.addObject("category",category );
		mv.addObject("brand", brand);
		mv.addObject("rank", rank);
		mv.addObject("enrollDate", enrollDate);
		mv.setViewName("admin/auction/auctionDisAgree");
		return mv;
	}
	
	//옥션승인
	@RequestMapping("/admin/agreeOneAuction")
	public ModelAndView agreeOneAuction(ModelAndView mv,int acno) {
		
		String msg="";
		int result=0;
		try {
			result=service.updateAgreeOneAuction(acno);
		}catch(RuntimeException e) {
			msg="경매승인을 실패하였습니다.";
		}
		
		if(result>0) {
			msg="경매를 승인하였습니다.";
		}
		mv.addObject("msg", msg);
		mv.addObject("loc", "/admin/auctionDisAgreeList");
		mv.setViewName("admin/common/msg");
		return mv;
	}
	
	//옥션거부
	@RequestMapping("/admin/disagreeOneAuction")
	public ModelAndView disagreeOneAuction(ModelAndView mv,int acno) {
		
		String msg="";
		int result=0;
		try {
			result=service.updateDisagreeOneAuction(acno);
		}catch(RuntimeException e) {
			msg="경매거부를 실패하였습니다.";
		}
		if(result>0) {
			msg="경매를 거부하였습니다.";
		}
		mv.addObject("msg", msg);
		mv.addObject("loc", "/admin/auctionDisAgreeList");
		mv.setViewName("admin/common/msg");
		return mv;
	
	}
	
	//체크 승인
	@RequestMapping("/admin/checkAgreeAuction")
	public ModelAndView checkAgreeAuction(ModelAndView mv,String[] aucCheck) {
		
		String msg="";
		int result=0;
		try {
			result=service.updateCheckAgreeAuc(aucCheck);
		}catch(RuntimeException e) {
			msg="선택한 경매 승인을 실패하였습니다.";
		}
		
		if(result>0) {
			msg="선택한 경매를 승인하였습니다.";
		}
		mv.addObject("msg", msg);
		mv.addObject("loc", "/admin/auctionDisAgreeList");
		mv.setViewName("admin/common/msg");
		return mv;
	}
	
	//체크 거부
	@RequestMapping("/admin/checkDisgreeAuction")
	public ModelAndView checkDisgreeAuction(ModelAndView mv,String[] aucCheck) {
		
		String msg="";
		int result=0;
		try {
			result=service.updateCheckDisagreeAuc(aucCheck);
		}catch(RuntimeException e) {
			msg="선택한 경매거부를 실패하였습니다.";
		}
		
		if(result>0) {
			msg="선택한 경매를 거부하였습니다.";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("loc", "/admin/auctionDisAgreeList");
		mv.setViewName("admin/common/msg");
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

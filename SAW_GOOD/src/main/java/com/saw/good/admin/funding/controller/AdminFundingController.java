package com.saw.good.admin.funding.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.saw.good.admin.funding.model.service.AdminFundingService;
import com.saw.good.common.FinderPageFactory;
import com.saw.good.common.PageFactory;

@Controller
public class AdminFundingController {
	@Autowired
	private AdminFundingService service;

	@Autowired
	private Logger logger;

	@RequestMapping("/admin/fundingDisAgreeList")
	public ModelAndView fundingDisAgree(ModelAndView mv
			,@RequestParam(value="cPage",defaultValue="1") int cPage,@RequestParam(value="numPerPage",defaultValue="10") int numPerPage) {

		List<Map<String,String>> fundingDisAgree=service.selectFundingDisAgree(cPage,numPerPage);

		int disAgTotal=service.countFundingDisAgree();

		String disAgPageBar=PageFactory.getPage(disAgTotal, cPage, numPerPage, "fundingDisAgreeList");

		//펀딩에 참여한 목표금액 도달 여부
		List<Map<String,String>> targetPrice=service.sumPartPrice();

		mv.addObject("fundingDisAgree", fundingDisAgree);
		mv.addObject("disAgPageBar", disAgPageBar);
		mv.addObject("targetPrice", targetPrice);
		mv.addObject("cPage",cPage);
		mv.addObject("numPerPage", numPerPage);
		mv.setViewName("admin/funding/fundingDisAgree");
		return mv;
	}

	@RequestMapping("/admin/fundingDisAgreeSearch")
	public ModelAndView fundingDisAgreeSearch(ModelAndView mv,
			@RequestParam(value="cPage",defaultValue="1") int cPage,@RequestParam(value="numPerPage",defaultValue="10") int numPerPage,
			@RequestParam String searchType, @RequestParam String keyword) {
		Map<String,String> map=new HashMap();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		List<Map<String,String>>  fundingDisAgree = service.searchFundingDAg(cPage,numPerPage,map);

		int disAgTotal=service.countsearchFundingDAg(map);

		String disAgPageBar =FinderPageFactory.getPage(disAgTotal, cPage, numPerPage, searchType, keyword, "fundingDisAgreeSearch");

		mv.addObject("fundingDisAgree", fundingDisAgree);
		mv.addObject("disAgPageBar", disAgPageBar);
		mv.addObject("cPage",cPage);
		mv.addObject("numPerPage", numPerPage);
		mv.addObject("searchType", searchType);
		mv.addObject("keyword", keyword);
		mv.setViewName("admin/funding/fundingDisAgree");
		return mv;
	}

	@RequestMapping("/admin/fundingAgreeList")
	public ModelAndView fundingAgree(ModelAndView mv,@
			RequestParam(value="cPage",defaultValue="1") int cPage,@RequestParam(value="numPerPage",defaultValue="10") int numPerPage) {

		List<Map<String,String>> fundingAgree=service.selectFundingAgree(cPage,numPerPage);

		int agTotal=service.countFundingAgree();

		String agPageBar=PageFactory.getPage(agTotal, cPage, numPerPage, "fundingAgreeList");

		//펀딩에 참여한 목표금액 도달 여부
		List<Map<String,String>> targetPrice=service.sumPartPrice();

		mv.addObject("fundingAgree", fundingAgree);
		mv.addObject("agPageBar", agPageBar);
		mv.addObject("targetPrice", targetPrice);
		mv.addObject("cPage",cPage);
		mv.addObject("numPerPage", numPerPage);
		mv.setViewName("admin/funding/fundingAgree");
		return mv;
	}
	@RequestMapping("/admin/fundingAgreeSearch")
	public ModelAndView fundingAgreeSearch(ModelAndView mv,HttpServletRequest request,
			@RequestParam(value="searchType",defaultValue="") String searchType,
			@RequestParam(value="keyword",defaultValue="") String keyword,
			@RequestParam(value="category",defaultValue="") String[] category,
			@RequestParam(value="hasexpired",defaultValue="") String hasexpired,
			@RequestParam(value="enrollDate",defaultValue="") String enrollDate,
			@RequestParam(value="cPage",defaultValue="1") int cPage,
			@RequestParam(value="numPerPage",defaultValue="10") int numPerPage) {
		System.out.println(searchType);
		System.out.println(keyword);
		System.out.println(hasexpired);
		System.out.println(enrollDate);
		System.out.println(category.length);
		
		Map<String,Object> map=new HashMap();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		map.put("enrollDate",enrollDate);
		map.put("hasexpired",hasexpired);
		if(category.length==0) {
			map.put("category",null);
		}else {
			map.put("category",category);
		}
		
		List<Map<String,String>> fundingAgree=service.fundingAgreeSearch(map,cPage,numPerPage);
		int agTotal=service.countsearchFundingAg(map);
		
		String agPageBar="";
		int totalPage=(int)Math.ceil((double)agTotal/numPerPage);
		
		int pageBarSize=5;
		
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		agPageBar+="<div id='pageBar'>";
		//이전
		if(pageNo==1) {
			agPageBar+="<span><</span>";
		}else {
			agPageBar+="<a href='"+request.getContextPath()+"/admin/fundingAgreeSearch?cPage="+(pageNo-1)+"&numPerPage="+numPerPage;
			agPageBar+="&searchType="+searchType;
			agPageBar+="&keyword="+keyword;
			for(String c : category) {
				agPageBar+="&category="+c;
			}
			agPageBar+="&enrollDate="+enrollDate;
			agPageBar+="&hasexpired="+hasexpired;
			agPageBar+="'><</a> ";
		}
		//숫자
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				agPageBar+="<span class='cPage'>"+pageNo+"</span>";
			}else {
				agPageBar+="<a href='"+request.getContextPath()+"/admin/fundingAgreeSearch?cPage="+pageNo+"&numPerPage="+numPerPage;
				agPageBar+="&searchType="+searchType;
				agPageBar+="&keyword="+keyword;
				for(String c : category) {
					agPageBar+="&category="+c;
				}
				agPageBar+="&enrollDate="+enrollDate;
				agPageBar+="&hasexpired="+hasexpired;
				agPageBar+="'>"+pageNo+"</a> ";
			}
			pageNo++;
		}
		
		//다음
		if(pageNo>totalPage) {
			agPageBar+="<span>></span>";
		}else {
			agPageBar+="<a href='"+request.getContextPath()+"/admin/fundingAgreeSearch?cPage="+pageNo+"&numPerPage="+numPerPage;
			agPageBar+="&searchType="+searchType;
			agPageBar+="&keyword="+keyword;
			for(String c : category) {
				agPageBar+="&category="+c;
			}
			agPageBar+="&enrollDate="+enrollDate;
			agPageBar+="&hasexpired="+hasexpired;
			agPageBar+="'>></a>";
		}
		agPageBar+="</div>";
		
		mv.addObject("fundingAgree",fundingAgree );
		mv.addObject("agPageBar", agPageBar);
		mv.addObject("cPage",cPage);
		mv.addObject("numPerPage", numPerPage);
		mv.addObject("searchType", searchType);
		mv.addObject("keyword", keyword);
		mv.addObject("category",category );
		mv.addObject("hasexpired", hasexpired);
		mv.setViewName("admin/funding/fundingAgree");
		return mv;
	}

	@RequestMapping("/admin/agreeFunding")
	public ModelAndView agreeFunding(ModelAndView mv,int fdno) {

		int result=service.updateAgreeFunding(fdno);

		String msg=result>0?"펀딩을 동의 하였습니다":"펀딩동의를 실패하였습니다.";
		mv.addObject("msg", msg);
		mv.addObject("loc", "/admin/fundingDisAgreeList");
		mv.setViewName("admin/common/msg");
		return mv;
	}

	@RequestMapping("/admin/disAgreeFunding")
	public ModelAndView disAgreeFunding(ModelAndView mv,int fdno) {
		int result=service.updateDisAgreeFunding(fdno);

		String msg=result>0?"펀딩을 거부 하였습니다":"펀딩 거부를 실패하였습니다.";
		mv.addObject("msg", msg);
		mv.addObject("loc", "/admin/fundingDisAgreeList");
		mv.setViewName("admin/common/msg");
		return mv;
	}

	@RequestMapping("/admin/checkAgreeFunding")
	public ModelAndView checkAgreeFunding(ModelAndView mv,@RequestParam(value="fundcheck") List<String> list) {
		Map<String,Object> map=new HashMap();
		map.put("fundcheck", list);
		int result=service.updateCheckAgree(map);

		String msg=(result==list.size())?"선택한 펀딩을 승인 하였습니다":"선택한 펀딩 승안을 실패하였습니다.";
		mv.addObject("msg", msg);
		mv.addObject("loc", "/admin/fundingDisAgreeList");
		mv.setViewName("admin/common/msg");
		return mv;
	}

	@RequestMapping("/admin/checkDisAgreeFunding")
	public ModelAndView checkDisAgreeFunding(ModelAndView mv,@RequestParam(value="fundcheck") List<String> list) {

		Map<String,Object> map=new HashMap();
		map.put("fundcheck", list);
		int result=service.updateCheckDisAgree(map);

		String msg=(result==list.size())?"선택한 펀딩을 거부 하였습니다":"선택한 펀딩 거부를 실패하였습니다.";
		mv.addObject("msg", msg);
		mv.addObject("loc", "/admin/fundingDisAgreeList");
		mv.setViewName("admin/common/msg");
		return mv;
	}

	@RequestMapping("/admin/fundingView")
	public ModelAndView fundingView(ModelAndView mv,int fdno) {

		Map<String,String> fd=service.selectOneFunding(fdno);
		List<Map<String, String>> subImg=service.selectSubImg(fdno);
		mv.addObject("funding", fd);
		mv.addObject("subImg", subImg);
		mv.setViewName("admin/funding/fundingView");
		return mv;
	}

}
package com.saw.good.admin.member.controller;


import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.saw.good.admin.member.model.service.AdminMemberService;
import com.saw.good.common.FinderPageFactory;
import com.saw.good.common.PageFactory;
import com.saw.good.common.encrypt.AESEncrypt;
import com.saw.good.member.model.vo.Member;

@Controller
public class AdminMemberController {
	
	@Autowired
	private AdminMemberService service;
	
	@Autowired
	private AESEncrypt aes;
	
	@RequestMapping("/admin/memberManager")
	public ModelAndView memberManager(@RequestParam(value="cPage",defaultValue="1") int cPage,
							@RequestParam(value="numPerPage",defaultValue="10") int numPerPage,
							HttpServletRequest request,ModelAndView m) {
		
		List<Member> list =service.selectMember(cPage,numPerPage);
		for(Member mem : list) {
			try {
				mem.setEmail(aes.decrypt(mem.getEmail()));
				mem.setPhone(aes.decrypt(mem.getPhone()));
				mem.setAddress1(aes.decrypt(mem.getAddress1()));
				mem.setAddress2(aes.decrypt(mem.getAddress2()));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		int totalData=service.countMember();
		String pageBar=PageFactory.getPage(totalData, cPage, numPerPage, "memberManager");
		
		m.addObject("list", list);
		m.addObject("pageBar", pageBar);
		m.addObject("numPerPage", numPerPage);
		m.addObject("cPage", cPage);
		m.setViewName("admin/member/memberManager");
		return m;
	}
	
	@RequestMapping("/admin/deleteMember")
	public ModelAndView deleteMember(String id,ModelAndView m) {
		
		int result=service.deleteMember(id);
		String msg=result>0?"삭제성공":"삭제실패";
		
		m.addObject("msg", msg);
		m.addObject("loc", "/admin/memberManager");
		m.setViewName("admin/common/msg");
		return m;
	}
	
	@RequestMapping("/admin/searchMember")
	public ModelAndView searchMember(String searchType,String keyword,ModelAndView m,
					@RequestParam(value="cPage",defaultValue="1") int cPage,
						@RequestParam(value="numPerPage",defaultValue="10") int numPerPage) {
		Map<String,String> map=new HashMap();
		map.put("searchType", searchType);
		map.put("keyword",keyword);
		
		List<Member> list=service.searchMember(cPage,numPerPage,map);
		for(Member mem : list) {
			try {
				mem.setEmail(aes.decrypt(mem.getEmail()));
				mem.setPhone(aes.decrypt(mem.getPhone()));
				mem.setAddress1(aes.decrypt(mem.getAddress1()));
				mem.setAddress2(aes.decrypt(mem.getAddress2()));
				System.out.println(mem.getEmail());
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		int totalData=service.countSearchMember(map); 
		
		String pageBar=FinderPageFactory.getPage(totalData, cPage, numPerPage, searchType, keyword, "searchMember");
		
		System.out.println(numPerPage);
		System.out.println(searchType);
		System.out.println(keyword);
		m.addObject("list", list);
		m.addObject("pageBar", pageBar);
		m.addObject("searchType", searchType);
		m.addObject("keyword", keyword);
		m.addObject("numPerPage", numPerPage);
		m.addObject("cPage", cPage);
		m.setViewName("admin/member/memberManager");
		return m;
	}
	
	@RequestMapping("/admin/checkdeleteMember")
	public ModelAndView checkdeleteMember(String[] memberCk,ModelAndView m) {
		
		List<String> mb=new ArrayList();
		for(int i=0;i<memberCk.length;i++) {
			mb.add(memberCk[i]);
		}
		int result=service.checkdeleteMember(mb);
		int num=memberCk.length;
		String msg=result==num?"삭제성공":"삭제실패";
		m.addObject("msg", msg);
		m.addObject("loc", "/admin/memberManager");
		m.setViewName("admin/common/msg");
		return m;
	}
	
}

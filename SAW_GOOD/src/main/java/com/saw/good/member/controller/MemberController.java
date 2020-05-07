package com.saw.good.member.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.saw.good.common.encrypt.AESEncrypt;
import com.saw.good.member.model.service.MemberService;
import com.saw.good.member.model.vo.Member;

@Controller
public class MemberController {
	
//	@Autowired
//	private BCryptPasswordEncoder pwEncoder;
	@Autowired
	private MemberService service;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	@Autowired
	private AESEncrypt aesEncrypt;
	
	@RequestMapping("/signup")
	public String goSignup() {
		return "member/signup";
	}
	
	@RequestMapping(value="/signup/checkId.do", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView checkId(@RequestParam("userId") String id,ModelAndView mv) throws IOException {
		System.out.println(id);
		Member m  = service.selectId(id);
		boolean flag = m!=null?false:true;
		
		System.out.println(flag);
		mv.addObject("flag", flag);
		mv.setViewName("jsonView");
		return mv;
	}
	@RequestMapping("/member/signup.do")
	public ModelAndView signUp(Member m, ModelAndView mv ) {
		System.out.println(""+m);
		
		m.setPassword(pwEncoder.encode(m.getPassword()));
		m.setEmail(aesEncrypt.encrypt(m.getEmail()));
		m.setPostCode(aesEncrypt.encrypt(m.getPostCode()));
		m.setAddress2(aesEncrypt.encrypt(m.getAddress2()));
		m.setPhone(aesEncrypt.encrypt(m.getPhone()));
		
		int result = service.insertMember(m);
		
		
		return mv;
	}

}

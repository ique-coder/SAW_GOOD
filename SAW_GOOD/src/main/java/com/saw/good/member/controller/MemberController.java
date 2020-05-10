package com.saw.good.member.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.saw.good.common.encrypt.AESEncrypt;
import com.saw.good.common.encrypt.SHA256;
import com.saw.good.email.Email;
import com.saw.good.email.service.MailService;
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
	
	@Autowired
	private Email e;
	
	@Autowired
	private MailService eService;
	
	@Autowired
	JavaMailSender mailSender;
	
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
	@RequestMapping(value="/member/signup.do", method=RequestMethod.POST)
	public ModelAndView signUp(Member m, ModelAndView mv ) {
		System.out.println(""+m);
		
		Member m2 = new Member();
		m2.setUserId(m.getUserId());
		m2.setEmail(m.getEmail());
		
		//암호화하기
		m.setPassword(pwEncoder.encode(m.getPassword()));
		m.setEmail(aesEncrypt.encrypt(m.getEmail()));
		m.setPostCode(aesEncrypt.encrypt(m.getPostCode()));
		m.setAddress2(aesEncrypt.encrypt(m.getAddress2()));
		m.setPhone(aesEncrypt.encrypt(m.getPhone()));
		
		
		int result = service.insertMember(m);
		String msg;
		//주소 바꾸기!!!!!!!!!!!!!=================================================
		//데이터 넣기 성공하면 메일전송 
		if(result>0) {
			
			boolean flag = sendEmail(m2);
			if(flag) msg="회원가입 성공! 메일보내기 성공!";
			else msg="회원가입은 성공했으나 메일보내기에 실패하였습니다. 관리자에게 문의하세요.";
			
		}else {
			msg = "회원가입 실패";
		}
		mv.addObject("msg", msg);
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	
	@RequestMapping("/member/mail.do")
	public boolean sendEmail(Member m) {
		
		//mailVo에 데이터 넣기 
		String sha256 = SHA256.getSHA256(m.getUserId());
		e.setUserEmail(m.getEmail());
		e.setTitle("SAW GOOD 회원가입 인증 메일입니다.");
		e.setContent(
				System.getProperty("line.separator")+
				System.getProperty("line.separator")
				+"SAW GOOD을 이용해 주셔서 감사합니다.<br>"
				+ "이메일 인증을 완료하시면 바로 이용 가능합니다!<br>"
				+"<a href='"+e.getHost()+"/member/access.do?userId="+m.getUserId()+"&code="+sha256+" ' style='color:#3C5946;'>이메일 인증하기</a>"
				
				);
		
		return eService.send(e);
	}
	
	@RequestMapping("/member/access.do")
	public ModelAndView allowMember(@RequestParam(required=false)String userId,@RequestParam(required=false)String code, ModelAndView mv) {
		
		
		String msg ;
		if (userId!=null && code !=null) {
			String sha256 = SHA256.getSHA256(userId);
			boolean isRight = (sha256.equals(code)) ? true : false;
			System.out.println(isRight);
			System.out.println(code);
			System.out.println(userId);
			System.out.println(sha256);
			if(isRight) {
				int result = service.updateMember(userId);
				if(result>0)msg="이메일 승인이 완료되었습니다! 바로 이용 가능합니다.";
				else msg="이메일 인증에 실패하였습니다. 관리자에게 문의하세요";
			}else {
				msg = "잘못된 접근입니다. 이메일을 다시 확인하세요";
			}
		}else {
			msg = "잘못된 접근입니다.";
		}
		
		mv.addObject( "msg", msg);
		mv.setViewName("common/msg");
		return mv;
	}
	

}

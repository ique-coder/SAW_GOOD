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
	
	//회원가입
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
		m.setAddress1(aesEncrypt.encrypt(m.getAddress2()));
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

	//승원 로그인멤버 정보 불러오기 
	@RequestMapping("/member/info.do")
	public ModelAndView memberInfo(Member m, ModelAndView mv) {
		
		String userId="skmb1230";
		Member mem = service.loginMemberInfo(userId);
		try {
			mem.setPhone(aesEncrypt.decrypt(mem.getPhone()));
			mem.setPostCode(aesEncrypt.decrypt(mem.getPostCode()));
			mem.setAddress1(aesEncrypt.decrypt(mem.getAddress1()));
			mem.setAddress2(aesEncrypt.decrypt(mem.getAddress2()));
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("mem",mem);
		mv.setViewName("member/memberInfor");
		return mv;
	}
	//승원 로그인멤버 정보 업데이트하기
	@RequestMapping("/member/memberUpdate")
	public ModelAndView memberInfoUpdate(Member m, ModelAndView mv) {
		//암호화하기

			m.setPostCode(aesEncrypt.encrypt(m.getPostCode()));
			m.setAddress1(aesEncrypt.encrypt(m.getAddress1()));
			m.setAddress2(aesEncrypt.encrypt(m.getAddress2()));
			m.setPhone(aesEncrypt.encrypt(m.getPhone()));
			System.out.println(m);
			int result = service.updateMemberInfo(m);
			String msg;
			//주소 바꾸기!!!!!!!!!!!!!=================================================
			//데이터 넣기 성공하면 메일전송 
			if(result>0) {
				
			    msg="회원수정 성공하였습니다.";
				
			}else {
				msg = "회원가입 실패하였습니다.";
			}
			mv.addObject("msg", msg);
			mv.setViewName("common/msg");
//			
			return mv;
	}
	//승원 비밀번호 변경하기
	@RequestMapping("/member/passwordUpdate")
	public ModelAndView passwordUpdate(Member m, ModelAndView mv) {
	
		
		//암호화하기
		m.setPassword(pwEncoder.encode(m.getPassword()));

		int result = service.updatePassword(m);
		String msg;
		//주소 바꾸기!!!!!!!!!!!!!=================================================
		//데이터 넣기 성공하면 메일전송 
		if(result>0) {
			
		    msg="비밀번호 변경을 성공하였습니다.";
			
		}else {
			msg = "비밀번호 변경에 실패하였습니다.";
		}
		mv.addObject("msg", msg);
		mv.setViewName("common/msg");
//		
		return mv;
	}
	//ajax 사업자번호 검사
	@RequestMapping(value="/member/checkBusiness.do", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView businessChek(@RequestParam("businessNumber") String bsNum,ModelAndView mv) throws IOException {
//		System.out.println(bsNo);
		String bsNo =  aesEncrypt.encrypt(bsNum);
		System.out.println(bsNo);
		Member m  = service.selectBusinessNumber(bsNo);
		boolean flag = m!=null?false:true;
		
//		System.out.println(flag);
		mv.addObject("flag", flag);
		mv.setViewName("jsonView");
		return mv;
	}
	//승원 사업자번호 추가하기
		@RequestMapping("/member/sellerUpdate")
		public ModelAndView bsNoUpdate(Member m, ModelAndView mv) {
		
			System.out.println(m);
			//암호화하기
			m.setBusinessNumber((aesEncrypt.encrypt(m.getBusinessNumber())));

			int result = service.updateBsNo(m);
			String msg;
			//주소 바꾸기!!!!!!!!!!!!!=================================================
			//데이터 넣기 성공하면 메일전송 
			if(result>0) {
				
			    msg="판매회원등급으로 되었습니다.";
				
			}else {
				msg = "판매회원등급에 실패하였습니다.";
			}
			mv.addObject("msg", msg);
			mv.setViewName("common/msg");
//			
			return mv;
		}


}

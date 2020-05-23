package com.saw.good.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.saw.good.common.encrypt.AESEncrypt;
import com.saw.good.common.encrypt.SHA256;
import com.saw.good.email.Email;
import com.saw.good.email.service.MailService;
import com.saw.good.member.model.service.MemberService;
import com.saw.good.member.model.vo.Member;

@Controller
@SessionAttributes(value = { "loginMember" })
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

	// 회원가입
	@RequestMapping(value = "/signup/checkId.do", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView checkId(@RequestParam("userId") String id, ModelAndView mv) throws IOException {
		System.out.println(id);
		Member m = service.selectId(id);
		boolean flag = m != null ? false : true;

		System.out.println(flag);
		mv.addObject("flag", flag);
		mv.setViewName("jsonView");
		return mv;
	}

	@RequestMapping(value = "/member/signup.do", method = RequestMethod.POST)
	public ModelAndView signUp(Member m, ModelAndView mv) {
	


		Member m2 = new Member();
		m2.setUserId(m.getUserId());
		m2.setEmail(m.getEmail());
		System.out.println(m);
		// 암호화하기
		m.setPassword(pwEncoder.encode(m.getPassword()));
		m.setEmail(aesEncrypt.encrypt(m.getEmail()));
		m.setPostCode(aesEncrypt.encrypt(m.getPostCode()));
		m.setAddress1(aesEncrypt.encrypt(m.getAddress1()));
		m.setAddress2(aesEncrypt.encrypt(m.getAddress2()));
		m.setPhone(aesEncrypt.encrypt(m.getPhone()));

		int result = service.insertMember(m);
		String msg;
		// 주소 바꾸기!!!!!!!!!!!!!=================================================
		// 데이터 넣기 성공하면 메일전송
		if (result > 0) {

			boolean flag = sendEmail(m2);
			if (flag)
				msg = "회원가입 되었습니다. 메일을 확인해 주세요.";
			else
				msg = "회원가입은 성공했으나 메일보내기에 실패하였습니다. 관리자에게 문의하세요.";

		} else {
			msg = "회원가입 실패";
		}
		mv.addObject("msg", msg);
		mv.addObject("loc","/");
		mv.setViewName("common/msg");

		return mv;
	}

	@RequestMapping("/member/mail.do")
	public boolean sendEmail(Member m) {

		// mailVo에 데이터 넣기
		String sha256 = SHA256.getSHA256(m.getUserId());
		e.setUserEmail(m.getEmail());
		e.setTitle("SAW GOOD 회원가입 인증 메일입니다.");
		e.setContent(System.getProperty("line.separator") + System.getProperty("line.separator")
				+ "SAW GOOD을 이용해 주셔서 감사합니다.<br>" + "이메일 인증을 완료하시면 바로 이용 가능합니다!<br>" + "<a href='" + e.getHost()
				+ "/member/access.do?userId=" + m.getUserId() + "&code=" + sha256
				+ " ' style='color:#3C5946;'>이메일 인증하기</a>"

		);

		return eService.send(e);
	}

	@RequestMapping("/member/access.do")
	public ModelAndView allowMember(@RequestParam(required = false) String userId,
			@RequestParam(required = false) String code, ModelAndView mv) {

		String msg;
		if (userId != null && code != null) {
			String sha256 = SHA256.getSHA256(userId);
			boolean isRight = (sha256.equals(code)) ? true : false;
			System.out.println(isRight);
			System.out.println(code);
			System.out.println(userId);
			System.out.println(sha256);
			if (isRight) {
				int result = service.updateMember(userId);
				if (result > 0)
					msg = "이메일 승인이 완료되었습니다! 바로 이용 가능합니다.";
				else
					msg = "이메일 인증에 실패하였습니다. 관리자에게 문의하세요";
			} else {
				msg = "잘못된 접근입니다. 이메일을 다시 확인하세요";
			}
		} else {
			msg = "잘못된 접근입니다.";
		}

		mv.addObject("msg", msg);
		mv.addObject("loc","/");
		mv.setViewName("common/msg");
		return mv;
	}

	// 승원 로그인멤버 정보 불러오기
	@RequestMapping("/member/info.do")
	public ModelAndView memberInfo(ModelAndView mv, @SessionAttribute("loginMember") Member m) {

		String userId = m.getUserId();
		Member mem = service.loginMemberInfo(userId);
		try {
			mem.setPhone(aesEncrypt.decrypt(mem.getPhone()));
			mem.setPostCode(aesEncrypt.decrypt(mem.getPostCode()));
			mem.setAddress1(aesEncrypt.decrypt(mem.getAddress1()));
			mem.setAddress2(aesEncrypt.decrypt(mem.getAddress2()));
		} catch (Exception e) {
			e.printStackTrace();
		}

		mv.addObject("mem", mem);
		mv.setViewName("member/memberInfor");
		return mv;
	}

	// 승원 로그인멤버 정보 업데이트하기
	@RequestMapping("/member/memberUpdate")
	public ModelAndView memberInfoUpdate(Member m, ModelAndView mv, MultipartHttpServletRequest request,
			HttpSession session) {

		Member mem = service.loginMemberInfo(m.getUserId());
	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
		//프로필사진 넣어주기
		m.setProfile(mem.getProfile());
		m.setReProfile(mem.getReProfile());
		// 암호화하기
		m.setPostCode(aesEncrypt.encrypt(m.getPostCode()));
		m.setAddress1(aesEncrypt.encrypt(m.getAddress1()));
		m.setAddress2(aesEncrypt.encrypt(m.getAddress2()));
		m.setPhone(aesEncrypt.encrypt(m.getPhone()));
		Member mem2 = service.loginMemberInfo(m.getUserId());
		// 경로지정
		String path = session.getServletContext().getRealPath("/resources/images/member");
		File fileDir = new File(path);
		if (!fileDir.exists()) {
			fileDir.mkdirs();
		}
		int result = 0;
		MultipartFile pfImg = request.getFile("profileImg");
		System.out.println(pfImg.isEmpty());

		if (pfImg.isEmpty()) {
			result = service.updateMemberInfo(m);
		} else {
			String originalAc = "";
			String renameAc = "";
			int rnd = (int) (Math.random() * 1000);
			originalAc = pfImg.getOriginalFilename();
			String ext = originalAc.substring(originalAc.lastIndexOf("."));
			renameAc = sdf.format(System.currentTimeMillis()) + "_" + rnd + ext;
			m.setProfile(originalAc);
			m.setReProfile(renameAc);
			try {
				pfImg.transferTo(new File(fileDir + "/" + renameAc));
			} catch (IOException e) {
				e.printStackTrace();
			}

			try {
				result = service.updateMemberInfo(m);
			} catch (RuntimeException e) {
				File adf = new File(fileDir + "/" + renameAc);
				if (adf.exists()) {
					adf.delete();
				}
			}
			// 업데이트 끝난 후 원래있던 파일 삭제
			if (!pfImg.isEmpty()) {
				File af = new File(fileDir + "/" + mem2.getReProfile());
				if (af.exists()) {
					af.delete();
				}
			}
		}

		String msg;
		// 주소 바꾸기!!!!!!!!!!!!!=================================================
		// 데이터 넣기 성공하면 메일전송
		if (result > 0) {

			msg = "회원수정 성공하였습니다.";

		} else {
			msg = "회원가입 실패하였습니다.";
		}
		mv.addObject("loc", "/member/info.do");
		mv.addObject("msg", msg);
		mv.setViewName("common/msg");
//			
		return mv;
	}

	// 승원 비밀번호 변경하기
	@RequestMapping("/member/passwordUpdate")
	public ModelAndView passwordUpdate(Member m, ModelAndView mv) {

		// 암호화하기
		m.setPassword(pwEncoder.encode(m.getPassword()));

		int result = service.updatePassword(m);
		String msg;
		// 주소 바꾸기!!!!!!!!!!!!!=================================================
		// 데이터 넣기 성공하면 메일전송
		if (result > 0) {

			msg = "비밀번호 변경을 성공하였습니다.";

		} else {
			msg = "비밀번호 변경에 실패하였습니다.";
		}
		mv.addObject("loc", "/member/info.do");
		mv.addObject("msg", msg);
		mv.setViewName("common/msg");
//		
		return mv;
	}

	// ajax 사업자번호 검사
	@RequestMapping(value = "/member/checkBusiness.do", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView businessChek(@RequestParam("businessNumber") String bsNum, ModelAndView mv) throws IOException {
//		System.out.println(bsNo);
		String bsNo = aesEncrypt.encrypt(bsNum);
		System.out.println(bsNo);
		Member m = service.selectBusinessNumber(bsNo);
		boolean flag = m != null ? false : true;

//		System.out.println(flag);
		mv.addObject("flag", flag);
		mv.setViewName("jsonView");
		return mv;
	}

	// 승원 사업자번호 추가하기
	@RequestMapping("/member/sellerUpdate")
	public ModelAndView bsNoUpdate(Member m, ModelAndView mv) {

		System.out.println(m);
		// 암호화하기
		m.setBusinessNumber((aesEncrypt.encrypt(m.getBusinessNumber())));

		int result = service.updateBsNo(m);
		String msg;
		// 주소 바꾸기!!!!!!!!!!!!!=================================================
		// 데이터 넣기 성공하면 메일전송
		if (result > 0) {

			msg = "판매회원등급으로 되었습니다.";

		} else {
			msg = "판매회원등급에 실패하였습니다.";
		}
		mv.addObject("loc", "/member/info.do");
		mv.addObject("msg", msg);
		mv.setViewName("common/msg");
//			
		return mv;
	}

	// 로그인 하기
	@RequestMapping("/member/memberLogin")
	public ModelAndView memberLogin(Member m, ModelAndView mv, HttpServletRequest request) {

		Member loginMember = service.selectMember(m);

		System.out.println(m);
		String msg = "";
		// String loc="";
		String referer = request.getHeader("referer");
		System.out.println(referer);
		// 로그인로직 처리하기
		if (loginMember != null) {
			if (pwEncoder.matches(m.getPassword(), loginMember.getPassword())) {
				if (loginMember.isEmailAccess() && loginMember.getStatus() != 0) {
					// 로그인성공
					msg = "로그인 성공";
					// 로그인 값을 유지 -> session객체에 데이터 보관
					// HttpSession session=request.getSession();//서블릿방식!
//					session.setAttribute("loginMember", loginMember);
					// model에 담겨있는 데이터를 session범위로 옮겨보자
					// @SessionAttributes(value={"key값"}) -> class선언부 위에
					mv.addObject("loginMember", loginMember);
				} else if (loginMember.getStatus() == 0) {
					msg = "탈퇴한 회원입니다.";
				} else {
					msg = "이메일 인증을 진행해 주세요";
				}

			} else {
				// 패스워드가 일치하지 않음
				msg = "아이디 또는 비밀번호를 잘못 입력하셨습니다";
			}
		} else {
			// 아이디가 일치하지않음
			msg = "아이디 또는 비밀번호를 잘못 입력하셨습니다";
		}
		mv.addObject("msg", msg);
		// mv.addObject("loc", loc);
		mv.addObject("referer", referer);
		mv.setViewName("common/msg");
		return mv;
	}

	// 로그아웃 처리
	@RequestMapping("/member/logout")
	public String logout(SessionStatus status) {
		if (!status.isComplete()) {// 세션이 완료(만료)됬니?
			status.setComplete();// session을 종료시킴~
		}
		return "redirect:/";
	}

	@RequestMapping("/find/findId")
	@ResponseBody
	public ModelAndView findId(ModelAndView mv, Member m, HttpServletResponse response) {

		response.setCharacterEncoding("UTF-8");

		m.setEmail(aesEncrypt.encrypt("," + m.getEmail()));

		System.out.println("암호화 후 : " + m.getEmail());
		Member mem = service.selectFindMember(m);
		boolean flag = false;
		if (mem != null) {
			flag = true;
		}

		mv.addObject("flag", flag);
		mv.addObject("member", mem);
		mv.setViewName("jsonView");
		return mv;
	}

	@RequestMapping("/find/findPw")
	@ResponseBody
	public ModelAndView findPw(ModelAndView mv, Member m, HttpServletResponse response)
			throws UnsupportedEncodingException {
		response.setCharacterEncoding("UTF-8");

		m.setEmail(aesEncrypt.encrypt("," + m.getEmail()));

		System.out.println("암호화 후 : " + m.getEmail());
		Member mem = service.selectFindPw(m);
		boolean flag = false;
		System.out.println("member : " + mem);
		String ran = UUID.randomUUID().toString().substring(0, 7);
		if (mem != null) {
			mem.setEmail(aesEncrypt.decrypt(mem.getEmail()));
			e.setUserEmail(mem.getEmail().substring(1));
			e.setTitle("SAW GOOD 임시비밀번호 발급 메일입니다.");
			e.setContent(System.getProperty("line.separator") + System.getProperty("line.separator") + "임시비밀번호 : " + ran
					+ "<br>" + "반드시 로그인후 비밀번호를 변경하세요!<br>" + "<a href='" + e.getHost()
					+ "' style='color:#3C5946;'>비밀번호 변경하기</a>");
			mem.setPassword(pwEncoder.encode(ran));
			int result = service.updatePassword(mem);
			flag = true;
			eService.send(e);
		}
		mv.addObject("email", mem.getEmail().substring(1));
		mv.addObject("ran", ran);
		mv.addObject("flag", flag);
		mv.setViewName("jsonView");
		return mv;
	}

}

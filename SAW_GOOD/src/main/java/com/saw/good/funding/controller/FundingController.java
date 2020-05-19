package com.saw.good.funding.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.saw.good.common.PageFactory;
import com.saw.good.funding.model.service.FundingService;
import com.saw.good.funding.model.vo.FDMember;
import com.saw.good.funding.model.vo.FDReword;
import com.saw.good.funding.model.vo.FDSubImg;
import com.saw.good.funding.model.vo.Funding;
import com.saw.good.member.model.vo.Member;
import com.saw.good.payment.model.service.PaymentService;

@Controller
public class FundingController {

	
	PaymentService payservice;
	
	@Autowired
	FundingService service;
	
	@Autowired
	Logger logger;
	
	@RequestMapping("/funding/list")
	public ModelAndView fundingList(ModelAndView mv) {
		//인기있는 아이템 9개 가져오기 (상단 노출)
		int high = 9;
		List<Funding> highList = service.selectHighList(high);
		
		//데이터 20개씩 가져오기
		int numPerPage = 20;
		List<Funding> list = service.selectList(numPerPage);
		
		mv.addObject("highList",highList);
		mv.addObject("list",list);
		
		mv.setViewName("funding/list");
		return mv;
		
	}
	
	@RequestMapping("/funding/detail")
	public ModelAndView fundingDetail(ModelAndView mv,Funding item) {
		//제품, 사람수 총 참여가격 포함
		
		Funding f = service.selectItem(item.getFdNo());
		if(f!=null) {
			
			//해당 제품에 참여한 사람 목록
			List<FDMember> list = service.selectMemberList(item.getFdNo());
			//해당 제품에 참여한 사람 수 , 총 가격 / 비활성: 서브쿼리로 변경 
			//Map<String,Integer> map = service.selectPriceCount(item.getFdNo());
			
			//리워드목록 불러오기
			List<FDReword> reword = service.selectRewordList(item.getFdNo());
			
			mv.addObject("f",f);
			mv.addObject("list",list);
			mv.addObject("reword",reword);
			mv.setViewName("funding/detail");
			
			
		}else {
			mv.addObject("msg", "존재하지않는 게시글입니다.");
			mv.addObject("loc", "funding/list");
			mv.setViewName("common/msg");
		}
		return mv;
	}
	
	@RequestMapping("/funding/patronage/step1")
	public ModelAndView fundingPatronageEnd(ModelAndView mv , FDMember m ,@SessionAttribute ("loginMember") Member member) {
		
		
		Funding f = service.selectItem(m.getFdNo());
		//펀딩 기본 정보 
		mv.addObject("f",f);
		//사용자가 구매하는 제품 정보
		mv.addObject("m",m);
		//구매자 정보
		mv.addObject("member",member);
		mv.setViewName("funding/payment");
		return mv;
	}
	
	@RequestMapping("/funding/patronage/step2")
	public ModelAndView fundingPatronage(ModelAndView mv,FDMember m ) {
	
		//로그인 한 상태에서 후원할 수있도록 수정 
		//결제 후 db에 추가하는 것
		//m.setUserId((String)session.getAttribute("loginMember").get);
		
	
		
		int result = service.insertFDMember(m);
		
		String msg;
		if(result>0) {
			msg = "구매 성공하였습니다.";
		}else {
			msg="구매 실패하였습니다. 다시 시도해 주세요.";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc","/funding/list");
		mv.setViewName("common/msg");
		return mv;
	}
	
	
	
	@ResponseBody
	@RequestMapping("/funding/detail/partList.ajax")
	public Map<String,Object> fundingPartList(ModelAndView mv ,@RequestParam int fdNo, @RequestParam int cPage) {
		
		int numPerPage = 5;
		System.out.println(fdNo+" "+cPage);
		
		List<FDMember> list = service.selectFDMemberList(fdNo,cPage,numPerPage);
	
		int count = service.selectFDMemberCount(fdNo);
		
		Map<String,Object> map = new HashMap();
		map.put("list",list);
		map.put("pageBar", PageFactory.getPageForAjax(count,cPage,numPerPage));
		map.put("count",count);
		return map;
		
	}
	
	@RequestMapping("/funding/enroll/step1")
	public ModelAndView enrollFunding(ModelAndView mv) {
		
		mv.setViewName("funding/enroll");
		return mv;
	}
	
	
	@RequestMapping("/funding/enroll/step2")
	@ResponseBody
	public void enrollEndFunding( ModelAndView mv,
								@SessionAttribute ("loginMember") Member member,
								HttpSession session,
								Funding f,
								MultipartFile mainPic,
								MultipartFile[] subPic
								) {
		f.setUserId(member.getUserId());
	
		String fdSize = "";
		for(int i = 0 ; i< f.getItem().length; i++) {
			fdSize+=f.getItem()[i];
			fdSize+=" : ";
			fdSize+=f.getSize()[i];
			fdSize+=" // ";		
		}
		f.setFdSize(fdSize);
		
		List<FDReword> rewordList = new ArrayList();
		
		for(int i = 0; i<f.getReword().length;i++) {
			FDReword r = new FDReword();
			if(f.getPartPrice()[i]!=null || f.getPartPrice()[i]!="" ) {
				r.setReword(f.getReword()[i]);
				r.setPartPrice(Integer.parseInt(f.getPartPrice()[i]));
			}
			
			rewordList.add(r);
		}
		
		
		
		
		
		String path = session.getServletContext().getRealPath("/resources/images/funding/upload");
		List<FDSubImg> fileNames = new ArrayList();
		
		File file = new File(path);
		if(!file.exists()) file.mkdirs();
		
		if(!mainPic.isEmpty()) {
			String oriName = mainPic.getOriginalFilename();
			String ext = oriName.substring(oriName.lastIndexOf("."));
			//리네임 규칙 설정 
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSs");
			int rnd = (int)(Math.random()*1000);
			String rename = sdf.format(System.currentTimeMillis())+rnd+ext;
			try {
				mainPic.transferTo(new File(file+"/"+rename));
			}catch(Exception e) {
				e.printStackTrace();
			}
			f.setMainImg(rename);
			
		}
		
		
//		서브사진 처리하기
		for(MultipartFile mf : subPic) {
			if(!mf.isEmpty()) {
				String oriName = mf.getOriginalFilename();
				String ext = oriName.substring(oriName.lastIndexOf("."));
				//리네임 규칙 설정 
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSs");
				int rnd = (int)(Math.random()*1000);
				String rename = sdf.format(System.currentTimeMillis())+rnd+ext;
				try {
					mf.transferTo(new File(file+"/"+rename));
				}catch(Exception e) {
					e.printStackTrace();
				}
				FDSubImg fd = new FDSubImg();
				fd.setSubImg(rename);
				fd.setOriName(oriName);
				fileNames.add(fd);
				
			}
		}
		int result = 0;
		try {
			result = service.insertFunding(f,fileNames,rewordList);
		}catch(RuntimeException e) {
			e.printStackTrace();
			File delF = new File(path+"/"+f.getMainImg());
			if(delF.exists())delF.delete();
			for(FDSubImg fs: fileNames) {
				delF = new File(path+"/"+fs.getSubImg());
				if(delF.exists()) delF.delete();
			}
		}
		System.out.println(result );
	
		
		
		
//		return mv;
	}
	
	@RequestMapping("/funding/list/category")
	public ModelAndView categoryList(ModelAndView mv , @RequestParam String category1 , @RequestParam() String category) {
		
		
		return mv;
		
	}
	
	
}

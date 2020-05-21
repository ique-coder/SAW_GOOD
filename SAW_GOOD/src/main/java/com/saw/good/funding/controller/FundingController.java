package com.saw.good.funding.controller;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import com.saw.good.funding.model.vo.Comment;
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
		int cPage = 1;
		int numPerPage = 5;
		List<Funding> list = service.selectList(cPage,numPerPage);
		
		mv.addObject("highList",highList);
		mv.addObject("list",list);
		
		mv.setViewName("funding/list");
		return mv;
		
	}
	
//	@RequestMapping("/funding/detail")
//	public ModelAndView fundingDetail(ModelAndView mv,Funding item) {
//		//제품, 사람수 총 참여가격 포함
//		
//		Funding f = service.selectItem(item.getFdNo());
//		//해당 제품에 참여한 사람 목록
//		List<FDMember> list = service.selectMemberList(item.getFdNo());
//		//해당 제품에 참여한 사람 수 , 총 가격 / 비활성: 서브쿼리로 변경 
//		//Map<String,Integer> map = service.selectPriceCount(item.getFdNo());
//		
//		//리워드목록 불러오기
//		List<FDReword> reword = service.selectRewordList(item.getFdNo());
//		
//		// 댓글 리스트 가져오기 - castle
//		List<Comment> commentList = service.selectComment(item.getFdNo());
//		// re댓글 리스트 가져오기 - castle
//		List<Comment> reCommentList = service.selectReComment(item.getFdNo());
//		
//		mv.addObject("f",f);
//		mv.addObject("list",list);
//		mv.addObject("reword",reword);
//		mv.addObject("commentList", commentList);
//		mv.addObject("reCommentList", reCommentList);
//		mv.setViewName("funding/detail");
//
//		if(f!=null) {
//			
//			//해당 제품에 참여한 사람 목록
//			List<FDMember> list = service.selectMemberList(item.getFdNo());
//			//해당 제품에 참여한 사람 수 , 총 가격 / 비활성: 서브쿼리로 변경 
//			//Map<String,Integer> map = service.selectPriceCount(item.getFdNo());
//			
//			//리워드목록 불러오기
//			List<FDReword> reword = service.selectRewordList(item.getFdNo());
//			
//			mv.addObject("f",f);
//			mv.addObject("list",list);
//			mv.addObject("reword",reword);
//			mv.setViewName("funding/detail");
//			
//			
//		}else {
//			mv.addObject("msg", "존재하지않는 게시글입니다.");
//			mv.addObject("loc", "funding/list");
//			mv.setViewName("common/msg");
//		}
//		return mv;
//	}
	
	@RequestMapping("/funding/detail")
	public ModelAndView fundingDetail(ModelAndView mv,Funding item) {
		//제품, 사람수 총 참여가격 포함
		
		Funding f = service.selectItem(item.getFdNo());
		if(f!=null) {
			
			//해당 제품에 참여한 사람 목록
			List<FDMember> list = service.selectMemberList(item.getFdNo());
			//해당 제품에 참여한 사람 수 , 총 가격 / 비활성: 서브쿼리로 변경 
			//Map<String,Integer> map = service.selectPriceCount(item.getFdNo());
			
			//서브사진 목록 불러오기 
			List<FDSubImg> subimg = service.selectFDSubImg(item.getFdNo());
			
			//리워드목록 불러오기
			List<FDReword> reword = service.selectRewordList(item.getFdNo());
			
			// 댓글 리스트 가져오기 - castle
			List<Comment> commentList = service.selectComment(item.getFdNo());
			// re댓글 리스트 가져오기 - castle
			List<Comment> reCommentList = service.selectReComment(item.getFdNo());
			
			mv.addObject("f",f);
			mv.addObject("list",list);
			mv.addObject("reword",reword);
			mv.addObject("subImg", subimg);
			mv.addObject("commentList", commentList);
			mv.addObject("reCommentList", reCommentList);
			mv.setViewName("funding/detail");
			
			
		}else {
			mv.addObject("msg", "존재하지않는 게시글입니다.");
			mv.addObject("loc", "/funding/list");
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
	public Map<String,Object> fundingPartList(@RequestParam int fdNo, @RequestParam int cPage) {
		
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
	public ModelAndView enrollEndFunding( ModelAndView mv,
								@SessionAttribute ("loginMember") Member member,
								HttpSession session,
								Funding f,
								@RequestParam String finalDate,
								MultipartFile mainPic,
								MultipartFile[] subPic
								) {
		
		System.out.println(f.getTargetPrice());
		//아이디 담기 
		f.setUserId(member.getUserId());
		//끝나는 날짜 포멧
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date endDate = sdf.parse(finalDate);
			f.setEndDate(endDate);
		} catch (ParseException e) {
			
			e.printStackTrace();
		}
		
		
		//메인사진 처리하기
		String path = session.getServletContext().getRealPath("/resources/images/funding");
		File file = new File(path);
		//경로가 없으면 생성해주기
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
		List<FDSubImg> fileNames = new ArrayList();
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
				fileNames.add(fd);
				
			}
		}
		int result = 0;
		try {
			result = service.insertFunding(f,fileNames);
		}catch(RuntimeException e) {
			e.printStackTrace();
			File delF = new File(path+"/"+f.getMainImg());
			if(delF.exists())delF.delete();
			for(FDSubImg fs: fileNames) {
				delF = new File(path+"/"+fs.getSubImg());
				if(delF.exists()) delF.delete();
			}
		}
		
		if(result>0) {
			mv.addObject("msg", "신청이 완료되었습니다.");
			
		}else {
			mv.addObject("msg", "신청이 취소되었습니다. 다시 시도하시거나 관리자에게 문의하세요.");
		}
		mv.addObject("loc","/funding/list");
		mv.setViewName("common/msg");
	
//		String fdSize = "";
//		for(int i = 0 ; i< f.getItem().length; i++) {
//			fdSize+=f.getItem()[i];
//			fdSize+=" : ";
//			fdSize+=f.getSize()[i];
//			fdSize+=" // ";		
//		}
//		f.setFdSize(fdSize);
		
	
//		List<FDReword> rewordList = new ArrayList();
		
//		for(int i = 0; i<f.getReword().length;i++) {
//			FDReword r = new FDReword();
//			if(f.getPartPrice()[i]!=null || f.getPartPrice()[i]!="" ) {
//				r.setReword(f.getReword()[i]);
//				r.setPartPrice(Integer.parseInt(f.getPartPrice()[i]));
//			}
//			
//			rewordList.add(r);
//		}
		
		
		
		
		return mv;
	}
	
	@RequestMapping("/funding/list/category")
	public ModelAndView categoryList(ModelAndView mv , 
									@RequestParam Map map,
									@RequestParam (required = false, defaultValue="1") int cPage
								//	@RequestParam String category1 , 
								//	@RequestParam(required=false) String category2
									) {
		
		int numPerPage = 4;
		
		
		List<Funding> list = service.selectCategoryList(map,cPage,numPerPage);
		mv.addObject("category",map);
		mv.addObject("list",list);
		mv.setViewName("funding/searchList");
		return mv;
		
	}
	
	@RequestMapping("/funding/list/category.ajax")
	@ResponseBody
	public Map<String,Object> categoryAjax(
									@RequestParam Map category,
									@RequestParam (required = false, defaultValue="1") int cPage) {
		
		int numPerPage = 4;
		
		List<Funding> list = service.selectCategoryList(category,cPage,numPerPage);
		
		Map<String,Object> map = new HashMap();
		map.put("list",list);
		return map;
	}
	@RequestMapping("/funding/list/run")
	public ModelAndView FundingStatus (ModelAndView mv, int fStatus,
										@RequestParam (required = false, defaultValue="1") int cPage
										) {
		System.out.println(fStatus);
		int numPerPage = 4;
		
		List<Funding> list = service.selectList(fStatus,cPage,numPerPage);
		mv.addObject("list",list);
		mv.addObject("status",fStatus);
		mv.setViewName("funding/searchList");
		return mv;
	}
	@RequestMapping("/funding/list/run.ajax")
	@ResponseBody
	public Map<String,Object> FundingStatusAjax (ModelAndView mv, int fStatus ,
												@RequestParam (required = false, defaultValue="1") int cPage) {
		
		int numPerPage = 4;
		
		List<Funding> list = service.selectList(fStatus,cPage,numPerPage);
		Map<String,Object> map = new HashMap();
		map.put("list",list);
		return map;
		
	}
	
	@RequestMapping("/funding/list/search")
	public ModelAndView FundingTotalSearch(ModelAndView mv, String keyword,@RequestParam (required = false, defaultValue="1") int cPage) {
		
		
		int numPerPage = 4; 
		List<Funding> list = service.selectList(keyword, cPage,numPerPage);
		mv.addObject("list",list);
		mv.addObject("keyword",keyword);
		mv.setViewName("funding/searchList");

		return mv;
		
	}
	@RequestMapping("/funding/list/search.ajax")
	@ResponseBody
	public Map<String,Object> FundingStatusAjax (ModelAndView mv, String keyword ,
												@RequestParam (required = false, defaultValue="1") int cPage) {
		
		int numPerPage = 4;
		
		List<Funding> list = service.selectList(keyword,cPage,numPerPage);
		Map<String,Object> map = new HashMap();
		map.put("list",list);
		return map;
		
	}
	
	@RequestMapping("/funding/enroll/myList")
	public ModelAndView FundingEnrollList(ModelAndView mv , @SessionAttribute ("loginMember") Member member 
											,@RequestParam (required = false, defaultValue="1") int cPage
											,@RequestParam (required = false, defaultValue="10") int numPerPage) {
		
		
		int count = service.selectFundingCount(member.getUserId());
		List<Funding> list = service.selectMypageFundingList(member.getUserId(),cPage,numPerPage);
		if(!list.isEmpty()) {
			mv.addObject("list", list);
			mv.addObject("pageBar", PageFactory.getPage(count, cPage, numPerPage, "/good/funding/enroll/myList"));
			
		}else {
			
			mv.addObject("msg", "등록된 게시글이 없습니다.");
		}
		mv.setViewName("/mypage/myPageFundinglist");
		
		return mv;
	}
	
	@RequestMapping("/funding/enroll/modify")
	public ModelAndView FundingModify(ModelAndView mv,Funding funding,@SessionAttribute ("loginMember") Member member ) {
		
		
		if(member!=null && funding.getUserId().equals(member.getUserId()) || member.getUserId().equals("admin")) {
			Funding f =service.selectItem(funding);
			mv.addObject("f",f);
			List<FDSubImg> fs = service.selectFDSubImg(f.getFdNo());
			mv.addObject("f", f);
			mv.addObject("img", fs);
			mv.setViewName("funding/updateFunding");
			
		}else {
			mv.addObject("msg", "접근 권한이 없습니다.");
			mv.addObject("loc", "/");
			mv.setViewName("common/msg");
		}
		
		
		return mv;
	}
	@RequestMapping("/funding/enroll/modifyEnd")
	public ModelAndView FunctionModifyEnd(ModelAndView mv , Funding f,HttpSession session,
											String main, String [] sub,
											@RequestParam(required=false,defaultValue="") String finalDate,
											@RequestParam (required=false) MultipartFile mainPic,
											@RequestParam (required=false) MultipartFile[] subPic) {
		
		
		if(!finalDate.equals("") && finalDate != null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			try {
				Date endDate = sdf.parse(finalDate);
				f.setEndDate(endDate);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//사진 외 다른 정보먼저 업데이트 
		int result = service.updateFunding(f);
		
		//메인사진 바꿀 때 
		String msg = "";
		String path = session.getServletContext().getRealPath("/resources/images/funding");
		File file = new File(path);
		if(!mainPic.isEmpty()) {
			
			String oriName = mainPic.getOriginalFilename();
			String ext = oriName.substring(oriName.lastIndexOf("."));
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSs");
			int rnd = (int)(Math.random()*1000);
			String rename = sdf.format(System.currentTimeMillis())+rnd+ext;
			try {
				mainPic.transferTo(new File(file+"/"+rename));
			}catch(Exception e) {
				e.printStackTrace();
			}
			f.setMainImg(rename);
			
			//사진을 제외한 정보를 업데이트 성공하면 사진 업데이트 진행 
			if(result>0) {
				try {
					result = service.updateFundingImg(f);
				}catch(RuntimeException e) {
					//실패시 기존 이미지는 놔두고 새로 올린 파일을 지워준다 
					e.printStackTrace();
					File delF = new File(path+"/"+f.getMainImg());
					if(delF.exists())delF.delete();
					
				}
				//성공시 기존 이미지를 지워준다 
				File delF = new File(path+"/"+main);
				//기존 사진 서버에서 지워주기
				if(delF.exists())delF.delete();
				
			}
			//실패시 사진 업데이트 진행 하지 않음
			
			
			
			
		}
		//서브사진 변경 
		if(!subPic[0].isEmpty()) {
			List<FDSubImg> subImglist = new ArrayList();
			for(int i = 0 ; i<subPic.length;i++) {
				if(!subPic[i].isEmpty()) {
					String oriName = subPic[i].getOriginalFilename();
					String ext = oriName.substring(oriName.lastIndexOf("."));
					//리네임 규칙 설정 
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSs");
					int rnd = (int)(Math.random()*1000);
					String rename = sdf.format(System.currentTimeMillis())+rnd+ext;
					try {
						subPic[i].transferTo(new File(file+"/"+rename));
					}catch(Exception e) {
						e.printStackTrace();
					}
					FDSubImg fd = new FDSubImg();
					fd.setSubImg(rename);
					fd.setFdNo(f.getFdNo());
					fd.setPrevName(sub[i]);
					subImglist.add(fd);
				}
			}
			if(result>0) {
				try {
					result = service.updateFundingSubImg(subImglist);
				}catch(RuntimeException e) {
					//실패시 기존 이미지는 놔두고 새로 올린 파일을 지워준다 
					e.printStackTrace();
					for(FDSubImg fs: subImglist) {
						File delF = new File(path+"/"+fs.getSubImg());
						if(delF.exists()) delF.delete();
					}
					
				}
				//성공시 기존 이미지를 지워준다 
				for(String s : sub) {
					File delF = new File(path+"/"+s);
					if(delF.exists()) delF.delete();
				}
				
			}
			
			
		}
		
		
		if(result >0) {
			mv.addObject("msg", "수정되었습니다.");
			
		}else {
			mv.addObject("msg", "수정 실패했습니다. 다시 시도해주세요.");
			
		}
		mv.addObject("loc", "/funding/enroll/myList");
		mv.setViewName("common/msg");
		
		return mv;
		
	}
	
	@RequestMapping("/funding/enroll/display")
	public ModelAndView FundingEnrollDisplay(ModelAndView mv , Funding f ,@SessionAttribute ("loginMember") Member m) {
		
		if(m!=null && f.getUserId().equals(m.getUserId())) {
			Funding item = service.selectItem(f);
			List <FDSubImg> img = service.selectFDSubImg(f.getFdNo());
			mv.addObject("f", item);
			mv.addObject("img", img);
			mv.setViewName("funding/lastEnroll");
			System.out.println(item);
			
		}else {
			mv.addObject("msg", "접근 권한이 없습니다.");
			mv.addObject("loc", "/");
			mv.setViewName("common/msg");
		}
		
		
		return mv;
	}
	
	
}

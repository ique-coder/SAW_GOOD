package com.saw.good.auction.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.saw.good.auction.model.service.AuctionService;
import com.saw.good.auction.model.vo.Auction;
import com.saw.good.auction.model.vo.AuctionMember;
import com.saw.good.auction.model.vo.AuctionSearch;
import com.saw.good.auction.model.vo.AuctionServeImg;
import com.saw.good.common.PageFactory;
import com.saw.good.member.model.service.MemberService;
import com.saw.good.member.model.vo.Member;
import com.saw.good.product.model.vo.DetailImg;
import com.saw.good.product.model.vo.PageDetailImg;

@Controller
public class AuctionController {

	@Autowired
	AuctionService service;

	@Autowired
	MemberService mService;

	@Autowired
	Logger logger;

	@RequestMapping("/auction/list")
	public ModelAndView auctionList(ModelAndView mv, @RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerPage", defaultValue = "6") int numPerPage) {
		List<Auction> list = service.selectAcList(cPage, numPerPage);
		int totalData = service.countAuction();
		
		String pageBar = PageFactory.getPage(totalData, cPage, numPerPage, "/good/auction/list");
		mv.addObject("list", list);
		mv.addObject("pageBar", pageBar);
		mv.addObject("numPerPage", numPerPage);
		mv.addObject("cPage", cPage);
		mv.setViewName("auction/auctionList");
		return mv;

	}

	@RequestMapping("/auction/searchAuction")
	public ModelAndView searchAuction(String keyword, String value, ModelAndView mv,
			@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerPage", defaultValue = "6") int numPerPage) {
		Map<String, String> map = new HashMap();
		map.put("keyword", keyword);
		map.put("value", value);

		
		List<Auction> list = service.searchAuction(cPage, numPerPage, map);
		int totalData = service.countAcSearch(map);
	
		String pageBar = PageFactory.getPage(totalData, cPage, numPerPage, "/good/auction/list");
		mv.addObject("list", list);
		mv.addObject("pageBar", pageBar);
		mv.addObject("numPerPage", numPerPage);
		mv.addObject("cPage", cPage);
		mv.setViewName("auction/auctionList");
		return mv;
	}

	@RequestMapping("/auction/categoryList")
	public ModelAndView auctionList(ModelAndView mv, AuctionSearch category,
			@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerPage", defaultValue = "6") int numPerPage) {
	
		List<Auction> list = service.selectCtList(cPage, numPerPage, category);
		int totalData = service.countCtAuction(category);
	
		String pageBar = PageFactory.getPage(totalData, cPage, numPerPage, "/good/auction/list");
		mv.addObject("list", list);
		mv.addObject("pageBar", pageBar);
		mv.addObject("numPerPage", numPerPage);
		mv.addObject("cPage", cPage);
		mv.setViewName("auction/auctionList");
		return mv;

	}

	// 상품 디테일 기본정보 가져오기
	@RequestMapping("/auction/detail")
	public ModelAndView auctionDetail(ModelAndView mv, Auction ac) {

		// 상품 디테일 기본정보 가져오기
		Auction acinfo = service.selectDtAuction(ac);
		
		// 입철 건수
		int bidCount = service.countBid(ac);
		
		//상품 서브 이미지 가져오기
		List<AuctionServeImg> list = service.selectServeImg(ac);
	
		
		// 경매 랭크 불러오기
		List<Map<String, String>> acMem = service.selectAcMember(ac);
	
		mv.addObject("list",list);
		mv.addObject("bc",bidCount);
		mv.addObject("a", acinfo);
		mv.addObject("am", acMem);
		mv.setViewName("auction/auctionDetail");
		return mv;
	}

	// 입찰 시작해보즈아
	@RequestMapping("/auction/bidUpdate")
	public ModelAndView updateBidPrice(ModelAndView mv, AuctionMember am, Auction a,
			@SessionAttribute("loginMember") Member m) {
	
		// 현재 상품정보 확인하기
		Auction ac = service.selectNowPrice(a);
		int bidPrice = am.getBidPrice();
		int startPrice = ac.getAcStartPrice();
		int nowPrice = ac.getAcNowPrice();
		int userPoint = m.getPoint();

		AuctionMember am2 = service.selectFsMem(a);
		// 최고금액 업데이트하기

		String msg = "";
		String loc = "/auction/detail?acBoardNo=" + a.getAcBoardNo();
		if (am2==null||!(m.getUserId().equals(am2.getUserId()))) {
			if (bidPrice >= startPrice && bidPrice > nowPrice) {
				if (userPoint > nowPrice) {
					// befor 1등  + 하기 (포인트 돌려주기)
					int bMpResult=0;
					if(am2!=null) {
				
						bMpResult = mService.updateMemPoint(am2);
					}else {
						bMpResult=1;
					}

					if (bMpResult > 0) {
						// after 1등 - 하기 (포인트 가져오기)
				
						int aMpResult = mService.updateMemAPoint(am);
						if(aMpResult>0) {
							int result = service.insertBidPrice(am);
							if (result > 0) {
								// 경매 입찰금액
								int afp = service.selectFsPrice(a);
								a.setAcNowPrice(afp);
								// 최고입찰금액 업데이트
								int result2 = service.updateNowPrice(a);
								if (result2 > 0) {
									msg = "입찰에 성공하였습니다.";
								} else {
									msg = "입찰은 되었으나 오류가 발생하였습니다. 관리자에게 문의해주세요.";
								}

							} else {
								msg = "입찰과정중 오류가 발생하였습니다. 관리자에게 문의해주세요.";
							}
						}else {
							msg = "입찰과정중 오류가 발생하였습니다. 관리자에게 문의해주세요.";
						}
					
					}else {
						msg = "입찰과정중 오류가 발생하였습니다. 관리자에게 문의해주세요.";
					}

				} else {
					msg = "입찰에 실패하였습니다. SG포인트를 확인해주세요.";
				}
			} else {
				msg = "입찰에 실패하였습니다. 금액을 확인해주세요.";
			}
		} else {
			msg = "현재 최고 입찰자입니다. 입찰랭크를 확인해주세요.";
		}
		mv.addObject("loc", loc);
		mv.addObject("msg", msg);
		mv.setViewName("common/msg");
		return mv;
	}
	// 즉시입찰입찰 시작해보즈아
	@RequestMapping("/auction/nowBuyBid")
	public ModelAndView updateNowBuyBid(ModelAndView mv, AuctionMember am, Auction a,
			@SessionAttribute("loginMember") Member m) {
		
			// 현재 상품정보 확인하기
			
			Auction ac = service.selectNowPrice(a);
			am.setBidPrice(ac.getAcImdPrice());
		
			String msg = "";
			String loc = "/auction/detail?acBoardNo=" + a.getAcBoardNo();
			//최고입찰자
			AuctionMember am2 = service.selectFsMem(a);
			//자바스크립트로 분기처리 하였기에 바로 포인트 차감 및 돌려주기
			// befor 1등  + 하기 (포인트 돌려주기)
			int bMpResult=0;
			if(am2!=null) {
			
				bMpResult = mService.updateMemPoint(am2);
			}else {
				bMpResult=1;
			}

			if (bMpResult > 0) {
				// after 1등 - 하기 (포인트 가져오기)
			
				int aMpResult = mService.updateMemAPoint(am);
				if(aMpResult>0) {
				
					int result = service.insertBidPrice(am);
					if (result > 0) {
						// 경매 입찰금액
						int afp = service.selectFsPrice(a);
						a.setAcNowPrice(afp);
						// 최고입찰금액 업데이트
						int result2 = service.updateNowPrice(a);
						int result3 = service.updateStAuction(a);
						if (result2 > 0 && result3>0) {
							
							msg = "즉시입찰에 성공하였습니다.";
						} else {
							msg = "즉시입찰은 되었으나 오류가 발생하였습니다. 관리자에게 문의해주세요.";
						}

					} else {
						msg = "즉시입찰과정중 오류가 발생하였습니다. 관리자에게 문의해주세요.";
					}
				}else {
					msg = "즉시입찰과정중 오류가 발생하였습니다. 관리자에게 문의해주세요.";
				}
			
			}

			mv.addObject("loc", loc);
			mv.addObject("msg", msg);
			mv.setViewName("common/msg");
			return mv;
	}
	// 글쓰기 작성페이지
	@RequestMapping("/auction/writer")
	public ModelAndView auctionWriter(ModelAndView mv) {
		
		mv.setViewName("auction/auctionWriter");
		return mv;
	}
	// 글쓰기 작성완료
	@RequestMapping("/auction/auctionWriterEnd")
    public ModelAndView acWriterEnd(ModelAndView mv,
          @SessionAttribute("loginMember") Member m,
          @RequestParam(value = "acTitle") String acTitle,
          @RequestParam(value = "acProName") String acProName,
          @RequestParam(value = "acCategory") String acCategory,
          @RequestParam(value = "acStatusRank") String acStatusRank,
          @RequestParam(value = "acProSize") String acProSize,
          @RequestParam(value = "acBrand") String acBrand,
          @RequestParam(value = "acBuyDate") String acBuyDate,
          @RequestParam(value = "acProUrl",defaultValue = "") String acProUrl,
          @RequestParam(value = "acComent", defaultValue = "내용없음") String acComent,
          @RequestParam(value = "aEDN") String aEDN,
          @RequestParam(value = "asp") String asp,
          @RequestParam(value = "aip") String aip,
          MultipartHttpServletRequest request,
          HttpSession session)throws Exception {
       SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
     
       int acStartPrice=Integer.parseInt(asp);
       int acImdPrice=Integer.parseInt(aip);
       int acEndDateNum=Integer.parseInt(aEDN);

       String oriNameMain="";
       String reNameMain="";

       //파일 풀러오기
       MultipartFile amImg=request.getFile("acMainImg");

       List<MultipartFile> asImg=request.getFiles("acServeImg");
   
       //폴더경로 찾기
       String path=session.getServletContext().getRealPath("/resources/upload/auction");
       //폴더경로 없으면 생성
       File fileDir = new File(path); 
       if (!fileDir.exists()) { fileDir.mkdirs(); }
       //상품 메인 이미지
       if(!amImg.isEmpty()) {
          int rnd=(int)(Math.random()*1000);
          oriNameMain=amImg.getOriginalFilename();
          String ext=oriNameMain.substring(oriNameMain.lastIndexOf("."));
          reNameMain=sdf.format(System.currentTimeMillis())+"_"+rnd+ext;
          amImg.transferTo(new File(fileDir+"/"+reNameMain));
       }
       Auction a = new Auction(0,m.getUserId(),acTitle,acProName,acStartPrice,1000,
    		   0,acImdPrice,acStatusRank,acCategory,acBrand,oriNameMain,acProSize,
    		   acComent,null,null,acBuyDate,acProUrl,null,reNameMain,acEndDateNum);
//       a.setAcMainImg(oriNameMain);
//       a.setAcReMainImg(reNameMain);
       
       //서브이미지들
       List<AuctionServeImg> ASImgList = new ArrayList();
       for(MultipartFile mf : asImg) {
          if(!mf.isEmpty()) {
             int rnd=(int)(Math.random()*1000);
             String oriNameServe=mf.getOriginalFilename();
             String ext=oriNameServe.substring(oriNameServe.lastIndexOf("."));
             String reNameServe=sdf.format(System.currentTimeMillis())+"_"+rnd+ext;
             try {
                mf.transferTo(new File(fileDir+"/"+reNameServe));
             }catch(IOException e){
                e.printStackTrace();
             }
              AuctionServeImg asi=new AuctionServeImg();
             asi.setAcOriNameServe(oriNameServe);
             asi.setAcReNameServe(reNameServe);
             ASImgList.add(asi);
          }
       }
       
       //오류나면 올리지마!
       int result=0;
       try {
          result=service.inserAuction(a, ASImgList);
      
       }catch(RuntimeException e) {
          File pdf=new File(fileDir+"/"+reNameMain);
          if(pdf.exists()) {
             pdf.delete();
          }
          for(AuctionServeImg asi : ASImgList) {
             File delete=new File(fileDir+"/"+asi.getAcReNameServe());
             if(delete.exists()) {
                delete.delete();
             }
          }
          e.printStackTrace();
       }
       String msg=(result>0)?"경매등록 신청성공":"경매등록 신청실패";
       String loc=(result>0)?"/auction/list":"/auction/writer";
       mv.addObject("msg", msg);
       mv.addObject("loc", loc);
       mv.setViewName("common/msg");
       return mv;
    }
	//포인트 판매회원한테 주기
	@RequestMapping("/auction/salerPoint")
    public ModelAndView acWriterEnd(ModelAndView mv,
          Auction a){
	
		Auction ac = service.selectNowPrice(a);
	
		int result = 0;
		int acstatus = Integer.parseInt(ac.getAcStatus());
	
		if(acstatus != 3) {
			result = service.updateSalePoint(ac);
		}
		
		String msg=(result>0)?"입찰확정 성공":"입찰확정 실패";
	    String loc=(result>0)?"/auction/list":"/auction/detail?acBoardNo="+ac.getAcBoardNo();
	       mv.addObject("msg", msg);
	       mv.addObject("loc", loc);
	       mv.setViewName("common/msg");
    	return mv;
    }
	//나의 경매내역 보기
	@RequestMapping("/auction/myAcHistory")
	public ModelAndView myAcHistroy(ModelAndView mv ,
			 @SessionAttribute("loginMember") Member m ) {
	
		List<Auction> list = service.selectMyAcList(m);
		
		mv.addObject("mem",m);
		mv.addObject("list",list);
		mv.setViewName("auction/myAcStroy");
		return mv;
	}
	
	@RequestMapping("auction/myAcDelete")
	public ModelAndView myAcDelete(ModelAndView mv,
			@RequestParam(value = "acno") String aNo) {
		int acNo = Integer.parseInt(aNo);
		int result = 0;
		String msg="";
		
		
		Auction a = new Auction();
		a.setAcBoardNo(acNo);
		Auction a2 = service.selectDtAuction(a);
		
		if(a2.getAcStartPrice()>a2.getAcNowPrice()) {
			result = service.deleteAuction(a2);
		
		}else {
			//최고입찰자
			AuctionMember am = service.selectFsMem(a);
		
			result = mService.updateMemPoint(am);
			if(result>0) {
				result = service.deleteAuction(a2);
			}else {
				msg = "경매 삭제에 실패하였습니다. 관리자에게 문의해주세요.";
			}
		}
		msg=(result>0)?"경매삭제 성공":"경매삭제 실패";
	    String loc="/auction/myAcHistory";
	    mv.addObject("msg", msg);
	    mv.addObject("loc", loc);
	    mv.setViewName("common/msg");
		return mv;
	}
	//경매 내역에서만 삭제
	@RequestMapping("auction/myAcListDelete")
	public ModelAndView myAcListDelete(ModelAndView mv,
			@RequestParam(value = "acno") String aNo) {
		int acNo = Integer.parseInt(aNo);
		int result = 0;
		String msg="";
		//최고입찰자
	
		
		Auction a = new Auction();
		a.setAcBoardNo(acNo);
		result = service.deleteAuction(a);

	
		msg=(result>0)?"경매내역 삭제성공":"경매내역 삭제실패";
	    String loc="/auction/myAcHistory";
	    mv.addObject("msg", msg);
	    mv.addObject("loc", loc);
	    mv.setViewName("common/msg");
		return mv;
	}
	
	//나의 경매내역 보기
	@RequestMapping("/auction/myAcSitinstory")
	public ModelAndView myAcSitinstory(ModelAndView mv ,
			 @SessionAttribute("loginMember") Member m ) {
		
		List<AuctionMember> list = service.selectMySiAcList(m);

		List<Auction> aList = new ArrayList();

		for(AuctionMember am : list) {
			Auction a = service.selectMySitinAcList(am);
			aList.add(a);
		}
		
		mv.addObject("mem",m); 
		mv.addObject("aList",aList);
		mv.addObject("list",list); 
		mv.setViewName("auction/myAcSitinStory");
		return mv;
	}
}

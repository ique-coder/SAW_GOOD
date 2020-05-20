package com.saw.good.auction.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.saw.good.auction.model.service.AuctionService;
import com.saw.good.auction.model.vo.Auction;
import com.saw.good.auction.model.vo.AuctionMember;
import com.saw.good.auction.model.vo.AuctionSearch;
import com.saw.good.common.PageFactory;
import com.saw.good.member.model.service.MemberService;
import com.saw.good.member.model.vo.Member;

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
		System.out.println(totalData);
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

		System.out.println(map);
		List<Auction> list = service.searchAuction(cPage, numPerPage, map);
		int totalData = service.countAcSearch(map);
		System.out.println(list);
		System.out.println(totalData);
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
		System.out.println(category);
		List<Auction> list = service.selectCtList(cPage, numPerPage, category);
		int totalData = service.countCtAuction(category);
		System.out.println(totalData);
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
		
		// 경매 랭크 불러오기
		List<Map<String, String>> acMem = service.selectAcMember(ac);
		System.out.println(acinfo);
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
		System.out.println(m);
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
						System.out.println("포인트돌려주기 :"+am2);
						bMpResult = mService.updateMemPoint(am2);
					}else {
						bMpResult=1;
					}

					if (bMpResult > 0) {
						// after 1등 - 하기 (포인트 가져오기)
						System.out.println("포인트가져오기 :"+am);
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
			System.out.println("m : "+m);
			System.out.println("am : "+am);
			System.out.println("a : "+a);
			// 현재 상품정보 확인하기
			
			Auction ac = service.selectNowPrice(a);
			am.setBidPrice(ac.getAcImdPrice());
			System.out.println("ac : "+ac);
			String msg = "";
			String loc = "/auction/detail?acBoardNo=" + a.getAcBoardNo();
			//최고입찰자
			AuctionMember am2 = service.selectFsMem(a);
			//자바스크립트로 분기처리 하였기에 바로 포인트 차감 및 돌려주기
			// befor 1등  + 하기 (포인트 돌려주기)
			int bMpResult=0;
			if(am2!=null) {
				System.out.println("포인트돌려주기 :"+am2);
				bMpResult = mService.updateMemPoint(am2);
			}else {
				bMpResult=1;
			}

			if (bMpResult > 0) {
				// after 1등 - 하기 (포인트 가져오기)
				System.out.println("포인트가져오기 :"+ac);
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
}

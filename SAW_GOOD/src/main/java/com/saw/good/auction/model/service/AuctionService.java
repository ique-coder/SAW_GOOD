package com.saw.good.auction.model.service;

import java.util.List;
import java.util.Map;

import com.saw.good.auction.model.vo.Auction;
import com.saw.good.auction.model.vo.AuctionMember;
import com.saw.good.auction.model.vo.AuctionSearch;

public interface AuctionService {
	//상품리스트 불러오기
	List<Auction> selectAcList(int cPage,int numPerPage);
	int countAuction();
	
	//카테고리 상품리스트
	List<Auction> selectCtList(int cPage,int numPerPage,AuctionSearch category);
	int countCtAuction(AuctionSearch category);
	
	//상품 카테고리별 조회
	List<Auction> searchAuction(int cPage,int numPerPage,Map<String,String> map);
	int countAcSearch(Map<String,String> map);
	
	//상품 디테일 가져오기
	Auction selectDtAuction(Auction acBoardNo);
	
	//경매페이지 참여자 랭크
	List<Map<String,String>> selectAcMember(Auction acBoardNo);
	
	//경매최고입찰자 정보 가져오기1
	AuctionMember selectFsMem(Auction a);
	//경매 입찰 금액
	int insertBidPrice(AuctionMember am);
	
	//경매 현재금액 가져오기
	Auction selectNowPrice(Auction a);
	
	//경매페이지 최고 입찰자2 INSERT문 후
		int selectFsPrice(Auction ac);
	//경매페이지 최고금액 업데이트
		int updateNowPrice(Auction a);
	
	
	
}

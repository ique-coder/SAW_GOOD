package com.saw.good.auction.model.service;

import java.util.List;

import com.saw.good.auction.model.vo.Auction;
import com.saw.good.auction.model.vo.AuctionSearch;

public interface AuctionService {
	//상품리스트 불러오기
	List<Auction> selectAcList(int cPage,int numPerPage);
	int countAuction();
	
	//카테고리 상품리스트
	List<Auction> selectCtList(int cPage,int numPerPage,AuctionSearch category);
	int countCtAuction(AuctionSearch category);
}

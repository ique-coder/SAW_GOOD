package com.saw.good.auction.model.service;

import java.util.List;

import com.saw.good.auction.model.vo.Auction;

public interface AuctionService {
	//상품리스트 불러오기
	List<Auction> selectAcList(int cPage,int numPerPage);
	int countAuction();
}

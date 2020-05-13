package com.saw.good.auction.model.service;

import java.util.List;

import com.saw.good.auction.model.vo.Auction;

public interface AuctionService {
	
	List<Auction> selectAcList();
}

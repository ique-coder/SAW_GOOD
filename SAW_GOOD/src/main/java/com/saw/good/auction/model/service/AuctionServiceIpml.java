package com.saw.good.auction.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saw.good.auction.model.dao.AuctionDao;
import com.saw.good.auction.model.vo.Auction;
@Service
public class AuctionServiceIpml implements AuctionService {
	
	@Autowired
	SqlSession session;
	
	@Autowired
	AuctionDao dao;
	
	@Override
	public List<Auction> selectAcList() {
		
		return dao.selectAcList(session);
	}

}

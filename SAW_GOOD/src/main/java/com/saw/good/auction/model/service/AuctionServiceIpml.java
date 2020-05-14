package com.saw.good.auction.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saw.good.auction.model.dao.AuctionDao;
import com.saw.good.auction.model.vo.Auction;
import com.saw.good.auction.model.vo.AuctionSearch;
@Service
public class AuctionServiceIpml implements AuctionService {
	
	@Autowired
	private SqlSession session;
	
	@Autowired
	private AuctionDao dao;
	@Autowired
	private Logger logger;

	//경매페이지 불러오기
	@Override
	public List<Auction> selectAcList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectAcList(session,cPage,numPerPage);
	}

	@Override
	public int countAuction() {
		// TODO Auto-generated method stub
		return dao.countAuction(session);
	}
	//카테고리 리스트
	@Override
	public List<Auction> selectCtList(int cPage, int numPerPage, AuctionSearch category) {
		// TODO Auto-generated method stub
		return dao.selectCtList(session,cPage,numPerPage,category);
	}

	@Override
	public int countCtAuction(AuctionSearch category) {
		// TODO Auto-generated method stub
		return dao.countCtAuction(session,category);
	}
	
	
	

}

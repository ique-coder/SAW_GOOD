package com.saw.good.auction.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.saw.good.auction.model.vo.Auction;
import com.saw.good.auction.model.vo.AuctionSearch;

public interface AuctionDao {

	List<Auction> selectAcList(SqlSession session,int cPage, int numPerPage);
	int countAuction(SqlSession session);
	
	List<Auction> selectCtList(SqlSession session,int cPage, int numPerPage,AuctionSearch category);
	int countCtAuction(SqlSession session, AuctionSearch category);
	
}

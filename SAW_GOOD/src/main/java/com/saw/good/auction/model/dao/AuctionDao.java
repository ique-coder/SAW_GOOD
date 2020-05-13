package com.saw.good.auction.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.saw.good.auction.model.vo.Auction;

public interface AuctionDao {

	List<Auction> selectAcList(SqlSession session);
}

package com.saw.good.auction.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.saw.good.auction.model.vo.Auction;

@Repository
public class AuctionDaoImpl implements AuctionDao {

	@Override
	public List<Auction> selectAcList(SqlSession session) {
		System.out.println("다오");
		return session.selectList("auction.selectAllList");
	}

}

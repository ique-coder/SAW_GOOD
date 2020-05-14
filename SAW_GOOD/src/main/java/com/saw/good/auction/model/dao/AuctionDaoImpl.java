package com.saw.good.auction.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.saw.good.auction.model.vo.Auction;
import com.saw.good.auction.model.vo.AuctionSearch;

@Repository
public class AuctionDaoImpl implements AuctionDao {

	
	@Override
	public List<Auction> selectAcList(SqlSession session, int cPage, int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("auction.selectAllList",null,rb);
	}

	@Override
	public int countAuction(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("auction.countAuction");
	}

	@Override
	public List<Auction> selectCtList(SqlSession session, int cPage, int numPerPage, AuctionSearch category) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("auction.selectCtList",category,rb);
	}

	@Override
	public int countCtAuction(SqlSession session, AuctionSearch category) {
		// TODO Auto-generated method stub
		return session.selectOne("auction.countCtAuction",category);
	}


	
	

}

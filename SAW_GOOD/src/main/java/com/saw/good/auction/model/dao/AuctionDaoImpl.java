package com.saw.good.auction.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.saw.good.auction.model.vo.Auction;
import com.saw.good.auction.model.vo.AuctionMember;
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

	@Override
	public List<Auction> searchAuction(SqlSession session, int cPage, int numPerPage, Map<String,String> map) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("auction.searchAuction",map,rb);
	}

	@Override
	public int countAcSearch(SqlSession session, Map<String, String> map) {
		// TODO Auto-generated method stub
		return session.selectOne("auction.countAcSearch",map);
	}

	@Override
	public Auction selectDtAuction(SqlSession session, Auction acBoardNo) {
		// TODO Auto-generated method stub
		return session.selectOne("auction.selectDtAuction",acBoardNo);
	}

	@Override
	public List<Map<String, String>> selectAcMember(SqlSession session, Auction acBoardNo) {
		// TODO Auto-generated method stub
		return session.selectList("auction.selectAcMember",acBoardNo);
	}


	
	@Override
	public Auction selectNowPrice(SqlSession session, Auction a) {
		// TODO Auto-generated method stub
		return session.selectOne("auction.selectNowPrice",a);
	}

	

	@Override
	public AuctionMember selectFsMem(SqlSession session, Auction a) {
		// TODO Auto-generated method stub
		return session.selectOne("auction.selectFsMem",a);
	}

	@Override
	public int insertBidPrice(SqlSession session, AuctionMember am) {
		// TODO Auto-generated method stub
		return session.insert("auction.insertBidPrice",am);
	}

	@Override
	public int selectFsPrice(SqlSession session, Auction ac) {
		// TODO Auto-generated method stub
		return session.selectOne("auction.selectFsPrice",ac);
	}

	@Override
	public int updateNowPrice(SqlSession session, Auction a) {
		// TODO Auto-generated method stub
		return session.update("auction.updateNowPrice",a);
	}
	
	

	

	
	

}

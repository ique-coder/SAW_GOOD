package com.saw.good.auction.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.saw.good.auction.model.vo.Auction;
import com.saw.good.auction.model.vo.AuctionMember;
import com.saw.good.auction.model.vo.AuctionSearch;
import com.saw.good.auction.model.vo.AuctionServeImg;
import com.saw.good.member.model.vo.Member;

public interface AuctionDao {

	List<Auction> selectAcList(SqlSession session,int cPage, int numPerPage);
	int countAuction(SqlSession session);
	
	List<Auction> selectCtList(SqlSession session,int cPage, int numPerPage,AuctionSearch category);
	int countCtAuction(SqlSession session, AuctionSearch category);
	
	List<Auction> searchAuction(SqlSession session,int cPage, int numPerPage, Map<String,String> map);
	int countAcSearch(SqlSession session, Map<String,String> map);
	
	Auction selectDtAuction(SqlSession session,Auction acBoardNo);
	
	List<AuctionServeImg> selectServeImg(SqlSession session,Auction a);
	
	int countBid(SqlSession session,Auction a);
	
	List<Map<String, String>> selectAcMember(SqlSession session,Auction acBoardNo);
	
	AuctionMember selectFsMem(SqlSession session,Auction a);
	
	int selectFsPrice(SqlSession session,Auction ac);
	
	Auction selectNowPrice(SqlSession session,Auction a);
	
	int insertBidPrice(SqlSession session,AuctionMember am);
	
	int updateNowPrice(SqlSession session,Auction a);
	
	int updateStAuction(SqlSession session,Auction a);
	
	int insertAuction(SqlSession session,Auction a);
	
	
	int insertAuctionServeImg(SqlSession session,AuctionServeImg asi);
	
	int updateSalePoint(SqlSession session,Auction a);
	
	int updateAcFnStatus(SqlSession session,Auction a);
	
	List<Auction> selectMyAcList(SqlSession session, Member m);
	
	int deleteAuction(SqlSession session,Auction a);
	
	List<AuctionMember> selectMySiAcList(SqlSession session,Member m);
	
	Auction selectMySitinAcList(SqlSession session,AuctionMember am);
}

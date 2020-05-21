package com.saw.good.admin.auction.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class AdminAuctionDaoImpl implements AdminAuctionDao {

	//옥션뷰
	@Override
	public Map<String,String> selectOneAuction(SqlSession session, int acno) {
		// TODO Auto-generated method stub
		return session.selectOne("adAuction.selectOneAuction", acno);
	}

	//옥션 비동의 리스트
	@Override
	public List<Map<String, String>> selectAuctionDisAgree(SqlSession session,int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("adAuction.selectAuctionDisAgree",null,rb);
	}

	@Override
	public int countAuctionDisAgree(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("adAuction.countAuctionDisAgree");
	}

	//옥션 비동의 검색
	@Override
	public List<Map<String, String>> selectDisAgreeSearch(SqlSession session, Map<String, Object> map,int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("adAuction.selectDisAgreeSearch",map,rb);
	}

	@Override
	public int countDisAgreeSearch(SqlSession session, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.selectOne("adAuction.countDisAgreeSearch", map);
	}
	
	//승인 및 거부
	@Override
	public int updateAgreeOneAuction(SqlSession session, int acno) {
		// TODO Auto-generated method stub
		return session.update("adAuction.updateAgreeOneAuction", acno);
	}

	@Override
	public int updateDisagreeOneAuction(SqlSession session, int acno) {
		// TODO Auto-generated method stub
		return session.update("adAuction.updateDisagreeOneAuction", acno);
	}
	
	//체크 승인 및 거부
	@Override
	public int updateCheckAgreeAuc(SqlSession session, String s) {
		// TODO Auto-generated method stub
		return session.update("adAuction.updateCheckAgreeAuc", s);
	}

	@Override
	public int updateCheckDisagreeAuc(SqlSession session, String s) {
		// TODO Auto-generated method stub
		return session.update("adAuction.updateCheckDisagreeAuc", s);
	}
	
	
	
	
	
	
	
}

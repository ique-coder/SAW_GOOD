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
	//서브이미지

	@Override
	public List<Map<String, String>> selectAuctionImg(SqlSession session, int acno) {
		// TODO Auto-generated method stub
		return session.selectList("adAuction.selectAuctionImg",acno);
	}
	//옥션 동의 리스트
	@Override
	public List<Map<String, String>> selectAuctionAgree(SqlSession session, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("adAuction.selectAuctionAgree", null, rb);
	}

	@Override
	public int countAuctionAgree(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("adAuction.countAuctionAgree");
	}
	
	//옥션 동의 검색
	@Override
	public List<Map<String, String>> selectAgreeSearch(SqlSession session, Map<String, Object> map, int cPage,
			int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("adAuction.selectAgreeSearch", map, rb);
	}
	@Override
	public int countAgreeSearch(SqlSession session, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.selectOne("adAuction.countAgreeSearch",map);
	}
	//옥션 완료 삭제
	@Override
	public int deleteFnOneAgAuction(SqlSession session, int acno) {
		// TODO Auto-generated method stub
		return session.delete("adAuction.deleteFnOneAgAuction", acno);
	}
	//옥션 진행중 환불 및 삭제
	@Override
	public Map<String,String> selectMaxPriceMember(SqlSession session, int acno) {
		// TODO Auto-generated method stub
		return session.selectOne("adAuction.selectMaxPriceMember", acno);
	}

	@Override
	public int updateRefundPoint(SqlSession session, Map<String, String> map) {
		// TODO Auto-generated method stub
		return session.update("adAuction.updateRefundPoint", map);
	}
	
	@Override
	public int deleteIngOneAgAuction(SqlSession session, int acno) {
		// TODO Auto-generated method stub
		return session.delete("adAuction.deleteIngOneAgAuction", acno);
	}
	
	//옥션완료 선택삭제
	@Override
	public int deleteFnCkAuction(SqlSession session, String s) {
		// TODO Auto-generated method stub
		return session.delete("adAuction.deleteFnCkAuction", s);
	}
	
	//옥션 진행중 선택 환불 및 삭제
	@Override
	public Map<String, String> selectMaxPriceMem(SqlSession session, String s) {
		// TODO Auto-generated method stub
		return session.selectOne("adAuction.selectMaxPriceMem",s);
	}
	
	@Override
	public int deleteIngCkAuction(SqlSession session, String s) {
		// TODO Auto-generated method stub
		return session.delete("adAuction.deleteIngCkAuction",s);
	}
	
	//옥션 판매원한테 금액 넣어주기
	@Override
	public int updateSalePoint(SqlSession session, Map<String,String> map) {
		// TODO Auto-generated method stub
		return session.update("adAuction.updateSalePoint", map);
	}

	@Override
	public int updateDecideAuction(SqlSession session, String s) {
		// TODO Auto-generated method stub
		return session.update("adAuction.updateDecideAuction", s);
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

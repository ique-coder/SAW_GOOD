package com.saw.good.admin.auction.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public interface AdminAuctionDao {
	
	//옥션 뷰
	Map<String,String> selectOneAuction(SqlSession session,int acno);
	
	//옥션 동의 리스트
	List<Map<String,String>> selectAuctionAgree(SqlSession session,int cPage,int numPerPage);
	int countAuctionAgree(SqlSession session);
	
	//옥션 비동의 리스트
	List<Map<String,String>> selectAuctionDisAgree(SqlSession session,int cPage,int numPerPage);
	int countAuctionDisAgree(SqlSession session);
	
	//옥션 비동의 검색
	List<Map<String,String>> selectDisAgreeSearch(SqlSession session,Map<String,Object> map,int cPage,int numPerPage);
	int countDisAgreeSearch(SqlSession session,Map<String,Object> map);

	//승인 및 거부
	int updateAgreeOneAuction(SqlSession session,int acno);
	int updateDisagreeOneAuction(SqlSession session,int acno);
	
	//체크 승인 및 거부
	int updateCheckAgreeAuc(SqlSession session,String s);
	int updateCheckDisagreeAuc(SqlSession session,String s);
}

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
	
	//옥션 동의 검색
	List<Map<String,String>> selectAgreeSearch(SqlSession session,Map<String,Object> map,int cPage,int numPerPage);
	int countAgreeSearch(SqlSession session,Map<String,Object> map);
	
	//옥션 완료 삭제
	int deleteFnOneAgAuction(SqlSession session,int acno);
	
	//옥선 진행중 환불 및 삭제
	Map<String,String> selectMaxPriceMember(SqlSession session,int acno);
	int updateRefundPoint(SqlSession session,Map<String,String> map);//선택도 가능
	int deleteIngOneAgAuction(SqlSession session,int acno);
	
	//옥션 진행중 선택 환불 및 삭제
	Map<String,String> selectMaxPriceMem(SqlSession session,String s);
	int deleteIngCkAuction(SqlSession session,String s);
	
	//옥션 완료 선택삭제
	int deleteFnCkAuction(SqlSession session,String s);
	
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

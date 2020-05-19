package com.saw.good.admin.funding.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public interface AdminFundingDao {
	//비동의 펀딩 리스트 가져오기
	List<Map<String,String>> selectFundingDisAgree(SqlSession session,int cPage,int numPerPage);
	int countFundingDisAgree(SqlSession session);
	//동의 펀딩 리스트 가져오기
	List<Map<String,String>> selectFundingAgree(SqlSession session,int cPage,int numPerPage);
	int countFundingAgree(SqlSession session);
	//목표금액에 도달했는지 확인하기위해 참여인원 총 금액 가져오기
	List<Map<String,String>> sumPartPrice(SqlSession session);
	Map<String,String> sumPartPrice(SqlSession session,int fdno);
	//비동의 펀딩 검색
	List<Map<String,String>> searchFundingDAg(SqlSession session,int cPage,int numPerPage,Map<String,String> map);
	int countsearchFundingDAg(SqlSession session,Map<String,String> map);
	//동의 거부
	int updateAgreeFunding(SqlSession session,int fdno);
	int updateDisAgreeFunding(SqlSession session,int fdno);
	
	//선택동의 거부
	int updateCheckAgree(SqlSession session,Map<String,Object> map);
	int updateCheckDisAgree(SqlSession session,Map<String,Object> map);
	
	//펀딩 보기
	Map<String,String> selectOneFunding(SqlSession session,int fdno);
	List<Map<String, String>> selectSubImg(SqlSession session,int fdno);
}

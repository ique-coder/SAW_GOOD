package com.saw.good.admin.auction.model.service;

import java.util.List;
import java.util.Map;

public interface AdminAuctionService {
	
	//옥션 뷰
	Map<String,String> selectOneAuction(int acno);
	
	//옥션 비동의 리스트
	List<Map<String,String>> selectAuctionDisAgree(int cPage,int numPerPage);
	int countAuctionDisAgree();
	
	//옥션 비동의 검색
	List<Map<String,String>> selectDisAgreeSearch(Map<String,Object> map,int cPage,int numPerPage);
	int countDisAgreeSearch(Map<String,Object> map);
	
	//승인 및 거부
	int updateAgreeOneAuction(int acno);
	int updateDisagreeOneAuction(int acno);
	
	//체크 승인 및 거부
	int updateCheckAgreeAuc(String[] aucCheck);
	int updateCheckDisagreeAuc(String[] aucCheck);
}

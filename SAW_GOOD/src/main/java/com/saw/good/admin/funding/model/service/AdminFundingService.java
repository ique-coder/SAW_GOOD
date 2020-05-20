package com.saw.good.admin.funding.model.service;

import java.util.List;
import java.util.Map;

public interface AdminFundingService {
	
	//펀딩 승인여부나눠서 리스트 받아오기
	List<Map<String,String>> selectFundingDisAgree(int cPage,int numPerPage);
	List<Map<String,String>> selectFundingAgree(int cPage,int numPerPage);
	int countFundingDisAgree();
	int countFundingAgree();
	//펀딩 합산금액
	List<Map<String,String>> sumPartPrice();
	Map<String,String> sumPartPrice(int fdno);
	
	//비동의 펀딩 검색
	List<Map<String,String>> searchFundingDAg(int cPage,int numPerPage,Map<String,String> map);
	int countsearchFundingDAg(Map<String,String> map);
	//동의펀딩 검색 및 페이징처리
	List<Map<String,String>> fundingAgreeSearch(Map<String,Object> map,int cPage,int numPerPage);
	int countsearchFundingAg(Map<String,Object> map);
	
	//동의 거부
	int updateAgreeFunding(int fdno);
	int updateDisAgreeFunding(int fdno);
	
	//선택 동의 선택거부
	int updateCheckAgree(Map<String,Object> map);
	int updateCheckDisAgree(Map<String,Object> map);
	
	//펀딩보기
	Map<String,String> selectOneFunding(int fdno);
	List<Map<String, String>> selectSubImg(int fdno);
	
	
}

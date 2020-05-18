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
}

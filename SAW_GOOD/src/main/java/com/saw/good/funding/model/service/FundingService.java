package com.saw.good.funding.model.service;

import java.util.List;
import java.util.Map;


import com.saw.good.funding.model.vo.FDMember;
import com.saw.good.funding.model.vo.FDReword;
import com.saw.good.funding.model.vo.FDSubImg;
import com.saw.good.funding.model.vo.Funding;

public interface FundingService {

	
	List<Funding> selectList(int cPage, int numPerPage);

	Funding selectItem(int fdNo);

	List<FDMember> selectMemberList(int fdNo);

	Map<String, Integer> selectPriceCount(int fdNo);

	List<Funding> selectHighList(int high);

	List<FDReword> selectRewordList(int fdNo);

	int insertFDMember(FDMember m);

	List<FDMember> selectFDMemberList(int fdNo, int cPage, int numPerPage);

	int selectFDMemberCount(int fdNo);

	
	int insertFunding(Funding f, List<FDSubImg> fileNames, List<FDReword> rewordList);

	List<Funding> selectCategoryList(Map map, int cPage, int numPerPage);



}

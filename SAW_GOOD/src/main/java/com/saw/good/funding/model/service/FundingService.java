package com.saw.good.funding.model.service;

import java.util.List;
import java.util.Map;


import com.saw.good.funding.model.vo.Comment;
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

	List<Comment> selectComment(int fdNo);

	List<Comment> selectReComment(int fdNo);


	List<Funding> selectList(int status, int cPage, int numPerPage);

	List<Funding> selectList(String keyword, int cPage, int numPerPage);

	int insertFunding(Funding f, List<FDSubImg> fileNames);

	List<Funding> selectMypageFundingList(String userId, int cPage, int numPerPage);

	int selectFundingCount(String userId);
	
	Funding selectItem(Map map);

	List<FDSubImg> selectFDSubImg(int fdNo);

	int updateFunding(Funding f);
	



}

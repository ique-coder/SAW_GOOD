package com.saw.good.funding.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.saw.good.funding.model.vo.Comment;
import com.saw.good.funding.model.vo.FDMember;
import com.saw.good.funding.model.vo.FDReword;
import com.saw.good.funding.model.vo.FDSubImg;
import com.saw.good.funding.model.vo.Funding;

public interface FundingDao {

	List<Funding> selectList(SqlSession session, int cPage, int numPerPage);

	Funding selectItem(SqlSession session, int fdNo);

	List<FDMember> selectMemberList(SqlSession session, int fdNo);

	Map<String, Integer> selectPriceCount(SqlSession session, int fdNo);

	List<Funding> selectHighList(SqlSession session, int high);

	List<FDReword> selectRewordList(SqlSession session, int fdNo);
	
	List<Comment> selectComment(SqlSession session, int fdNo);
	
	List<Comment> selectReComment(SqlSession session, int fdNo);

	int insertFDMember(SqlSession session, FDMember m);

	List<FDMember> selectFDMemberList(SqlSession session, int fdNo, int cPage, int numPerPage);

	int selectFDMemberCount(SqlSession session, int fdNo);

	int insertFunding(SqlSession session, Funding f);

	int insertFDSubImg(SqlSession session, FDSubImg fs);

	int deleteFunding(SqlSession session, int fdNo);

	int insertFDReword(SqlSession session, FDReword fr);

	List<Funding> selectCategoryList(SqlSession session, Map map, int cPage, int numPerPage);

	List<Funding> selectList(SqlSession session, int status, int cPage, int numPerPage);

	List<Funding> selectList(SqlSession session, String keyword, int cPage, int numPerPage);

	List<Funding> selectMypageFundingList(SqlSession session, String userId, int cPage, int numPerPage);

	int selectFundingCount(SqlSession session, String userId);

	List<FDSubImg> selectFDSubImg(SqlSession session, int fdNo);

	int updateFunding(SqlSession session, Funding f);

	int updateFunding2(SqlSession session, Funding f);


	Funding selectItem(SqlSession session, Funding funding);

	int updateFundingImg(SqlSession session, Funding f);

	int updateFDSubImg(SqlSession session, FDSubImg fs);

	


}

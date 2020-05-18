package com.saw.good.funding.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.saw.good.funding.model.vo.Comment;

public interface FundingReviewDao {

	boolean reviewAjax(SqlSession session, String commentStatus, Comment comment);
	
	Comment reviewReturn(SqlSession session, Comment comment, String check);

}

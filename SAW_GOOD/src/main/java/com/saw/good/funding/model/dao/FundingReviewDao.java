package com.saw.good.funding.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.saw.good.funding.model.vo.Comment;

public interface FundingReviewDao {

	boolean reviewAjax(SqlSession session, String commentStatus, Comment comment);
	Comment reviewReturn(SqlSession session, Comment comment, String check);
	
	boolean commentInsert(SqlSession session, Comment comment);
	Comment commentInsertReturn(SqlSession session, Comment comment);
	
	boolean commentUpdate(SqlSession session, Comment comment);
	Comment commentUpdateReturn(SqlSession session, Comment comment);

	boolean commentDelete(SqlSession session, Comment comment);
	
	
	boolean reCommentInsert(SqlSession session, Comment comment);
	Comment reCommentInsertReturn(SqlSession session, Comment comment);
	
	boolean reCommentUpdate(SqlSession session, Comment comment);
	Comment reCommentUpdateReturn(SqlSession session, Comment comment);

	boolean reCommentDelete(SqlSession session, Comment comment);
}

package com.saw.good.funding.model.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.saw.good.funding.model.vo.Comment;

@Repository
public class FundingReviewDaoImpl implements FundingReviewDao {

	@Override
	public boolean reviewAjax(SqlSession session, String commentStatus, Comment comment) {

		int checkNum = 0;
		boolean result = false;
		switch (commentStatus) {
		case "insert":
			checkNum = session.insert("fundingReview.insertReview", comment);
			break;
		case "reInsert":
			checkNum = session.insert("fundingReview.reInsertReview", comment);
			break;
		case "update":
			checkNum = session.update("fundingReview.updateReview", comment);
			break;
		case "reUpdate":
			checkNum = session.update("fundingReview.reUpdateReview", comment);
			break;
		}

		if (checkNum > 0) {
			result = true;
		}

		return result;
	}

	@Override
	public Comment reviewReturn(SqlSession session, Comment comment, String check) {
		Comment result = null;

		switch (check) {
		case "new":
			session.selectOne("fundingReview.InsertReturn", comment);
			break;
		case "old":
			session.selectOne("fundingReview.oldReturn", comment);
		}

		return result;
	}

	
	
	
	
	@Override
	public boolean commentInsert(SqlSession session, Comment comment) {
		int result = session.insert("fundingReview.commentInsert", comment);
		if (result > 0)
			return true;
		else
			return false;
	}

	@Override
	public Comment commentInsertReturn(SqlSession session, Comment comment) {
		return session.selectOne("fundingReview.commentInsertReturn", comment);
	}

	@Override
	public boolean commentUpdate(SqlSession session, Comment comment) {
		int result = session.update("fundingReview.commentUpdate", comment);
		if (result > 0)
			return true;
		else
			return false;
	}

	@Override
	public Comment commentUpdateReturn(SqlSession session, Comment comment) {
		return session.selectOne("fundingReview.commentUpdateReturn", comment);
	}

	@Override
	public boolean commentDelete(SqlSession session, Comment comment) {
		int result = session.update("fundingReview.commentDelete", comment);
		if (result > 0)
			return true;
		else
			return false;
	}

	
	
	
	@Override
	public boolean reCommentInsert(SqlSession session, Comment comment) {
		int result = session.insert("fundingReview.reCommentInsert", comment);
		if (result > 0)
			return true;
		else
			return false;
	}

	@Override
	public Comment reCommentInsertReturn(SqlSession session, Comment comment) {
		return session.selectOne("fundingReview.reCommentInsertReturn", comment);
	}

	@Override
	public boolean reCommentUpdate(SqlSession session, Comment comment) {
		int result = session.update("fundingReview.reCommentUpdate", comment);
		if(result>0) return true;
		else return false;
	}

	@Override
	public Comment reCommentUpdateReturn(SqlSession session, Comment comment) {
		return session.selectOne("fundingReview.reCommentUpdateReturn", comment);
	}

	@Override
	public boolean reCommentDelete(SqlSession session, Comment comment) {
		int result = session.update("fundingReview.reCommentDelete", comment);
		if(result>0) return true;
		else return false;
	}

	

	
	
	

}

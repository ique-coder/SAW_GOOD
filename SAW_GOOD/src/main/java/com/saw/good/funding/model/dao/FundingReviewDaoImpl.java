package com.saw.good.funding.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.saw.good.funding.model.vo.Comment;

@Repository
public class FundingReviewDaoImpl implements FundingReviewDao{

	@Override
	public boolean reviewAjax(SqlSession session, String commentStatus, Comment comment) {
		
		int checkNum = 0;
		boolean result = false;
		switch(commentStatus) {
		case "insert" : 
			checkNum = session.insert("fundingReview.insertReview", comment);
			break;
		case "reInsert" :
			checkNum = session.insert("fundingReview.reInsertReview", comment);
			break;
		case "update" :
			checkNum = session.update("fundingReview.updateReview", comment);
			break;
		case "reUpdate" :
			checkNum = session.update("fundingReview.reUpdateReview", comment);
			break;
		}
		
		if(checkNum > 0) {
			result = true;
		}
		
		return result;
	}

	@Override
	public Comment reviewReturn(SqlSession session, Comment comment, String check) {
		Comment result = null;
		
		switch(check) {
		case "new" : 
			session.selectOne("fundingReview.InsertReturn", comment);
			break;
		case "old" :
			session.selectOne("fundingReview.oldReturn", comment);
		}
		
		return result;
	}
	
	

	
	
}

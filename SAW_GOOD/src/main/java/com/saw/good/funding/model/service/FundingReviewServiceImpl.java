package com.saw.good.funding.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saw.good.funding.model.dao.FundingReviewDao;
import com.saw.good.funding.model.vo.Comment;

@Service
public class FundingReviewServiceImpl implements FundingReviewService {

	@Autowired
	SqlSession session;

	@Autowired
	FundingReviewDao dao;

	@Override
	public boolean reviewAjax(String commentStatus, Comment comment) {
		return dao.reviewAjax(session, commentStatus, comment);
	}

	@Override
	public Comment reviewReturn(Comment comment, String check) {
		return dao.reviewReturn(session, comment, check);
	}

	// 댓글 달기
	@Override
	public boolean commentInsert(Comment comment) {
		return dao.commentInsert(session, comment);
	}

	// 등록한 댓글 리턴
	@Override
	public Comment commentInsertReturn(Comment comment) {
		return dao.commentInsertReturn(session, comment);
	}

	// 댓글 수정
	@Override
	public boolean commentUpdate(Comment comment) {
		return dao.commentUpdate(session, comment);
	}

	// 수정한 댓글 리턴
	@Override
	public Comment commentUpdateReturn(Comment comment) {
		return dao.commentUpdateReturn(session, comment);
	}

	// 댓글 삭제
	@Override
	public boolean commentDelete(Comment comment) {
		return dao.commentDelete(session, comment);
	}
	
	
	
	
	
	
	

	// re댓글 달기
	@Override
	public boolean reCommentInsert(Comment comment) {
		return dao.reCommentInsert(session, comment);
	}

	// re등록한 댓글 리턴
	@Override
	public Comment reCommentInsertReturn(Comment comment) {
		return dao.reCommentInsertReturn(session, comment);
	}

	// re댓글 수정
	@Override
	public boolean reCommentUpdate(Comment comment) {
		return dao.reCommentUpdate(session, comment);
	}

	// re수정한 댓글 리턴
	@Override
	public Comment reCommentUpdateReturn(Comment comment) {
		return dao.reCommentUpdateReturn(session, comment);
	}

	// re댓글 삭제
	@Override
	public boolean reCommentDelete(Comment comment) {
		return dao.reCommentDelete(session, comment);
	}

}

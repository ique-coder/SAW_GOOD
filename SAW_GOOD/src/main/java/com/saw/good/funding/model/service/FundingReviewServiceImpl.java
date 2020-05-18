package com.saw.good.funding.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saw.good.funding.model.dao.FundingReviewDao;
import com.saw.good.funding.model.vo.Comment;

@Service
public class FundingReviewServiceImpl implements FundingReviewService{

	
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
	
	
}

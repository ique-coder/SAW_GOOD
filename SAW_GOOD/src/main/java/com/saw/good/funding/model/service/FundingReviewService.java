package com.saw.good.funding.model.service;

import com.saw.good.funding.model.vo.Comment;

public interface FundingReviewService {

	boolean reviewAjax(String commentStatus, Comment comment);
	Comment reviewReturn(Comment comment, String check);

}

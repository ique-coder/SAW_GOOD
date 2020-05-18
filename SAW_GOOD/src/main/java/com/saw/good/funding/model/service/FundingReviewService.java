package com.saw.good.funding.model.service;

import com.saw.good.funding.model.vo.Comment;

public interface FundingReviewService {

	boolean reviewAjax(String commentStatus, Comment comment);
	Comment reviewReturn(Comment comment, String check);
	
	boolean commentInsert(Comment comment);
	Comment commentInsertReturn(Comment comment);
	
	boolean commentUpdate(Comment comment);
	Comment commentUpdateReturn(Comment comment);

	boolean commentDelete(Comment comment);
	
	
	
	boolean reCommentInsert(Comment comment);
	Comment reCommentInsertReturn(Comment comment);
	
	boolean reCommentUpdate(Comment comment);
	Comment reCommentUpdateReturn(Comment comment);
	
	boolean reCommentDelete(Comment comment);

}

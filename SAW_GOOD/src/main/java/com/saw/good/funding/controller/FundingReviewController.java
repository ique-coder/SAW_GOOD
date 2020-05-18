package com.saw.good.funding.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.saw.good.funding.model.service.FundingReviewService;
import com.saw.good.funding.model.vo.Comment;

@Controller
public class FundingReviewController {

	@Autowired
	FundingReviewService service;

	@Autowired
	Logger logger;

	@RequestMapping("/funding/commentAjax.do")
	public ModelAndView reviewAjax(String commentStatus, Comment comment, ModelAndView mv) {

		boolean check = service.reviewAjax(commentStatus, comment);
		Comment returnComment = null;

		// 이걸로 구분하자.
		String frontString = commentStatus.substring(0, 2);

		if (check && commentStatus.equals("insert")) {
			returnComment = service.reviewReturn(comment, "new");
		} else if (check && commentStatus.equals("reInsert")) {
			returnComment = service.reviewReturn(comment, "re");
		} else {
			returnComment = service.reviewReturn(comment, "");
		}

		System.out.println(returnComment.getCommentDate());

		mv.setViewName("jsonView");
		mv.addObject("check", check);
		mv.addObject("comment", returnComment);

		return mv;
	}

	// 댓글 등록/반환
	@RequestMapping("/funding/commentInsert.do")
	public ModelAndView commentInsert(Comment comment, ModelAndView mv, HttpServletResponse response) {

		boolean check = service.commentInsert(comment);
		Comment returnComment = service.commentInsertReturn(comment);

		response.setCharacterEncoding("utf-8");

		mv.setViewName("jsonView");
		mv.addObject("check", check);
		mv.addObject("comment", returnComment);

		return mv;
	}

	// 댓글 수정/반환
	@RequestMapping("/funding/commentUpdate.do")
	public ModelAndView commentUpdate(Comment comment, ModelAndView mv, HttpServletResponse response) {

		boolean check = service.commentUpdate(comment);
		Comment returnComment = service.commentUpdateReturn(comment);

		response.setCharacterEncoding("utf-8");

		mv.setViewName("jsonView");
		mv.addObject("check", check);
		mv.addObject("comment", returnComment);

		return mv;
	}

	// 댓글 삭제
	@RequestMapping("/funding/commentDelete.do")
	public ModelAndView commentDelete(Comment comment, ModelAndView mv) {

		boolean check = service.commentDelete(comment);

		mv.setViewName("jsonView");
		mv.addObject("check", check);

		return mv;
	}

	// re댓글 등록/반환
	@RequestMapping("/funding/reCommentInsert.do")
	public ModelAndView reCommentInsert(Comment comment, ModelAndView mv, HttpServletResponse response) {

		boolean check = service.reCommentInsert(comment);
		Comment returnReComment = service.reCommentInsertReturn(comment);

		response.setCharacterEncoding("utf-8");

		mv.setViewName("jsonView");
		mv.addObject("check", check);
		mv.addObject("comment", returnReComment);

		return mv;
	}

	// re댓글 수정/반환
	@RequestMapping("/funding/reCommentUpdate.do")
	public ModelAndView reCommentUpdate(Comment comment, ModelAndView mv, HttpServletResponse response) {

		boolean check = service.reCommentUpdate(comment);
		Comment returnReComment = service.reCommentUpdateReturn(comment);

		response.setCharacterEncoding("utf-8");

		mv.setViewName("jsonView");
		mv.addObject("check", check);
		mv.addObject("comment", returnReComment);

		return mv;
	}

	// re댓글 삭제
	@RequestMapping("/funding/reCommentDelete.do")
	public ModelAndView reCommentDelete(Comment comment, ModelAndView mv) {

		boolean check = service.reCommentDelete(comment);

		mv.setViewName("jsonView");
		mv.addObject("check", check);

		return mv;
	}

}

package com.saw.good.funding.model.vo;

import java.util.Date;

public class Comment {
	private int seq_fc_no;
	private int seq_fcr_no;
	private String userId;
	private int fdNo;
	private Date commentDate;
	private String commentText;
	private int status;
	private String formatDate;
	public int getSeq_fc_no() {
		return seq_fc_no;
	}
	public void setSeq_fc_no(int seq_fc_no) {
		this.seq_fc_no = seq_fc_no;
	}
	public int getSeq_fcr_no() {
		return seq_fcr_no;
	}
	public void setSeq_fcr_no(int seq_fcr_no) {
		this.seq_fcr_no = seq_fcr_no;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getFdNo() {
		return fdNo;
	}
	public void setFdNo(int fdNo) {
		this.fdNo = fdNo;
	}
	public Date getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
	public String getCommentText() {
		return commentText;
	}
	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getFormatDate() {
		return formatDate;
	}
	public void setFormatDate(String formatDate) {
		this.formatDate = formatDate;
	}
	public Comment(int seq_fc_no, int seq_fcr_no, String userId, int fdNo, Date commentDate, String commentText,
			int status, String formatDate) {
		super();
		this.seq_fc_no = seq_fc_no;
		this.seq_fcr_no = seq_fcr_no;
		this.userId = userId;
		this.fdNo = fdNo;
		this.commentDate = commentDate;
		this.commentText = commentText;
		this.status = status;
		this.formatDate = formatDate;
	}
	
	public Comment() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Comment [seq_fc_no=" + seq_fc_no + ", seq_fcr_no=" + seq_fcr_no + ", userId=" + userId + ", fdNo="
				+ fdNo + ", commentDate=" + commentDate + ", commentText=" + commentText + ", status=" + status
				+ ", formatDate=" + formatDate + "]";
	}
	
	
	
	

}

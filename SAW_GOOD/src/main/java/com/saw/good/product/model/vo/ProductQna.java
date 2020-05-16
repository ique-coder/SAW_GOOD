package com.saw.good.product.model.vo;

import java.sql.Date;

public class ProductQna {
	
	private int qnaNo;
	private String userId;
	private int productNo;
	private String title;
	private String content;
	private Date writeDate;
	private int readCount;
	private int replyNo;
	private int replyLevel;
	private String qnaPass;
	
	public ProductQna() {
		// TODO Auto-generated constructor stub
	}

	public ProductQna(int qnaNo, String userId, int productNo, String title, String content, Date writeDate,
			int readCount, int replyNo, int replyLevel, String qnaPass) {
		super();
		this.qnaNo = qnaNo;
		this.userId = userId;
		this.productNo = productNo;
		this.title = title;
		this.content = content;
		this.writeDate = writeDate;
		this.readCount = readCount;
		this.replyNo = replyNo;
		this.replyLevel = replyLevel;
		this.qnaPass = qnaPass;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public int getReplyLevel() {
		return replyLevel;
	}

	public void setReplyLevel(int replyLevel) {
		this.replyLevel = replyLevel;
	}

	public String getQnaPass() {
		return qnaPass;
	}

	public void setQnaPass(String qnaPass) {
		this.qnaPass = qnaPass;
	}

	@Override
	public String toString() {
		return "ProductQna [qnaNo=" + qnaNo + ", userId=" + userId + ", productNo=" + productNo + ", title=" + title
				+ ", content=" + content + ", writeDate=" + writeDate + ", readCount=" + readCount + ", replyNo="
				+ replyNo + ", replyLevel=" + replyLevel + ", qnaPass=" + qnaPass + "]";
	}
	
	
	
}

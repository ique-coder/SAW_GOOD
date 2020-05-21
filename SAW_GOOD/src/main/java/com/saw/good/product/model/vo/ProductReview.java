package com.saw.good.product.model.vo;

import java.sql.Date;

public class ProductReview {
	
	private int reviewNo;
    private String userId;
    private int productNo;
    private String content;
    private Date writeDate;
    private int star;
    private String reviewImg;
    private String renameImg;
    
    public ProductReview() {
		// TODO Auto-generated constructor stub
	}
    
	public ProductReview(int reviewNo, String userId, int productNo, String content, Date writeDate, int star,
			String reviewImg, String renameImg) {
		super();
		this.reviewNo = reviewNo;
		this.userId = userId;
		this.productNo = productNo;
		this.content = content;
		this.writeDate = writeDate;
		this.star = star;
		this.reviewImg = reviewImg;
		this.renameImg = renameImg;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
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

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public String getReviewImg() {
		return reviewImg;
	}

	public void setReviewImg(String reviewImg) {
		this.reviewImg = reviewImg;
	}

	public String getRenameImg() {
		return renameImg;
	}

	public void setRenameImg(String renameImg) {
		this.renameImg = renameImg;
	}

	@Override
	public String toString() {
		return "ProductReview [reviewNo=" + reviewNo + ", userId=" + userId + ", productNo=" + productNo + ", content="
				+ content + ", writeDate=" + writeDate + ", star=" + star + ", reviewImg=" + reviewImg + ", renameImg="
				+ renameImg + "]";
	}
    
	
}

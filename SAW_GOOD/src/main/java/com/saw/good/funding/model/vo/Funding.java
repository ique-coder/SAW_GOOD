package com.saw.good.funding.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Funding {

	private int fdNo;
	private String userId; 
	private String designer;
	private String title;
	private String subContent;
	private String detail;
	private String fdSize;
	private int targetPrice;
	private Date enrollDate;
	private Date endDate;
	private String mainImg;
	private int status;
	private int count;
	private int sum;
	private String category;

	private int appr;

	int day;

	public Funding(int fdNo, String userId, String designer, String title, String subContent, String detail,
			String fdSize, int targetPrice, Date enrollDate, Date endDate, String mainImg, int status, int count,
			int sum, String category, int appr, int day) {
		super();
		this.fdNo = fdNo;
		this.userId = userId;
		this.designer = designer;
		this.title = title;
		this.subContent = subContent;
		this.detail = detail;
		this.fdSize = fdSize;
		this.targetPrice = targetPrice;
		this.enrollDate = enrollDate;
		this.endDate = endDate;
		this.mainImg = mainImg;
		this.status = status;
		this.count = count;
		this.sum = sum;
		this.category = category;
		this.appr = appr;
		this.day = day;
	}
	
	public Funding() {
		// TODO Auto-generated constructor stub
	}

	public int getFdNo() {
		return fdNo;
	}

	public void setFdNo(int fdNo) {
		this.fdNo = fdNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getDesigner() {
		return designer;
	}

	public void setDesigner(String designer) {
		this.designer = designer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSubContent() {
		return subContent;
	}

	public void setSubContent(String subContent) {
		this.subContent = subContent;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getFdSize() {
		return fdSize;
	}

	public void setFdSize(String fdSize) {
		this.fdSize = fdSize;
	}

	public int getTargetPrice() {
		return targetPrice;
	}

	public void setTargetPrice(int targetPrice) {
		this.targetPrice = targetPrice;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getMainImg() {
		return mainImg;
	}

	public void setMainImg(String mainImg) {
		this.mainImg = mainImg;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getSum() {
		return sum;
	}

	public void setSum(int sum) {
		this.sum = sum;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getAppr() {
		return appr;
	}

	public void setAppr(int appr) {
		this.appr = appr;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}
	
	

}

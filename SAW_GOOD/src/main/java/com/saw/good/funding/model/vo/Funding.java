package com.saw.good.funding.model.vo;

import java.util.Arrays;
import java.util.Date;

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
<<<<<<< HEAD
	private int appr;
	
=======
>>>>>>> refs/heads/master
	int day;
<<<<<<< HEAD
=======
	private String[] item;
	private String[] partPrice;
	private String[] reword;
	private String[] size;
	public Funding() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Funding(int fdNo, String userId, String designer, String title, String subContent, String detail,
			String fdSize, int targetPrice, Date enrollDate, Date endDate, String mainImg, int status, int count,
			int sum, String category, int day, String[] item, String[] partPrice, String[] reword, String[] size) {
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
		this.day = day;
		this.item = item;
		this.partPrice = partPrice;
		this.reword = reword;
		this.size = size;
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
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public String[] getItem() {
		return item;
	}
	public void setItem(String[] item) {
		this.item = item;
	}
	public String[] getPartPrice() {
		return partPrice;
	}
	public void setPartPrice(String[] partPrice) {
		this.partPrice = partPrice;
	}
	public String[] getReword() {
		return reword;
	}
	public void setReword(String[] reword) {
		this.reword = reword;
	}
	public String[] getSize() {
		return size;
	}
	public void setSize(String[] size) {
		this.size = size;
	}
	@Override
	public String toString() {
		return "Funding [fdNo=" + fdNo + ", userId=" + userId + ", designer=" + designer + ", title=" + title
				+ ", subContent=" + subContent + ", detail=" + detail + ", fdSize=" + fdSize + ", targetPrice="
				+ targetPrice + ", enrollDate=" + enrollDate + ", endDate=" + endDate + ", mainImg=" + mainImg
				+ ", status=" + status + ", count=" + count + ", sum=" + sum + ", category=" + category + ", day=" + day
				+ ", item=" + Arrays.toString(item) + ", partPrice=" + Arrays.toString(partPrice) + ", reword="
				+ Arrays.toString(reword) + ", size=" + Arrays.toString(size) + "]";
	}
	
>>>>>>> refs/heads/master
	
	
}

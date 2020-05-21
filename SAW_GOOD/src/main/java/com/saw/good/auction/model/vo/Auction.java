package com.saw.good.auction.model.vo;

import java.sql.Date;

public class Auction {

	private int acBoardNo;
	private String userId;
	private String acTitle;
	private String acProName;
	private int acStartPrice;
	private int acStepPrice;
	private int acNowPrice;
	private int acImdPrice;
	private String acStatusRank;
	private String acCategory;
	private String acBrand;
	private String acMainImg;
	private String acProSize;
	private String acComent;
	private Date acStartDate;
	private Date acEndDate;
	private String acBuyDate;
	private String acProUrl;
	private String acStatus;
	private String acReMainImg;
	private int acEndDateNum;

	public Auction() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Auction(int acBoardNo, String userId, String acTitle, String acProName, int acStartPrice, int acStepPrice,
			int acNowPrice, int acImdPrice, String acStatusRank, String acCategory, String acBrand, String acMainImg,
			String acProSize, String acComent, Date acStartDate, Date acEndDate, String acBuyDate, String acProUrl,
			String acStatus, String acReMainImg, int acEndDateNum) {
		super();
		this.acBoardNo = acBoardNo;
		this.userId = userId;
		this.acTitle = acTitle;
		this.acProName = acProName;
		this.acStartPrice = acStartPrice;
		this.acStepPrice = acStepPrice;
		this.acNowPrice = acNowPrice;
		this.acImdPrice = acImdPrice;
		this.acStatusRank = acStatusRank;
		this.acCategory = acCategory;
		this.acBrand = acBrand;
		this.acMainImg = acMainImg;
		this.acProSize = acProSize;
		this.acComent = acComent;
		this.acStartDate = acStartDate;
		this.acEndDate = acEndDate;
		this.acBuyDate = acBuyDate;
		this.acProUrl = acProUrl;
		this.acStatus = acStatus;
		this.acReMainImg = acReMainImg;
		this.acEndDateNum = acEndDateNum;
	}

	public int getAcBoardNo() {
		return acBoardNo;
	}

	public void setAcBoardNo(int acBoardNo) {
		this.acBoardNo = acBoardNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAcTitle() {
		return acTitle;
	}

	public void setAcTitle(String acTitle) {
		this.acTitle = acTitle;
	}

	public String getAcProName() {
		return acProName;
	}

	public void setAcProName(String acProName) {
		this.acProName = acProName;
	}

	public int getAcStartPrice() {
		return acStartPrice;
	}

	public void setAcStartPrice(int acStartPrice) {
		this.acStartPrice = acStartPrice;
	}

	public int getAcStepPrice() {
		return acStepPrice;
	}

	public void setAcStepPrice(int acStepPrice) {
		this.acStepPrice = acStepPrice;
	}

	public int getAcNowPrice() {
		return acNowPrice;
	}

	public void setAcNowPrice(int acNowPrice) {
		this.acNowPrice = acNowPrice;
	}

	public int getAcImdPrice() {
		return acImdPrice;
	}

	public void setAcImdPrice(int acImdPrice) {
		this.acImdPrice = acImdPrice;
	}

	public String getAcStatusRank() {
		return acStatusRank;
	}

	public void setAcStatusRank(String acStatusRank) {
		this.acStatusRank = acStatusRank;
	}

	public String getAcCategory() {
		return acCategory;
	}

	public void setAcCategory(String acCategory) {
		this.acCategory = acCategory;
	}

	public String getAcBrand() {
		return acBrand;
	}

	public void setAcBrand(String acBrand) {
		this.acBrand = acBrand;
	}

	public String getAcMainImg() {
		return acMainImg;
	}

	public void setAcMainImg(String acMainImg) {
		this.acMainImg = acMainImg;
	}

	public String getAcProSize() {
		return acProSize;
	}

	public void setAcProSize(String acProSize) {
		this.acProSize = acProSize;
	}

	public String getAcComent() {
		return acComent;
	}

	public void setAcComent(String acComent) {
		this.acComent = acComent;
	}

	public Date getAcStartDate() {
		return acStartDate;
	}

	public void setAcStartDate(Date acStartDate) {
		this.acStartDate = acStartDate;
	}

	public Date getAcEndDate() {
		return acEndDate;
	}

	public void setAcEndDate(Date acEndDate) {
		this.acEndDate = acEndDate;
	}

	public String getAcBuyDate() {
		return acBuyDate;
	}

	public void setAcBuyDate(String acBuyDate) {
		this.acBuyDate = acBuyDate;
	}

	public String getAcProUrl() {
		return acProUrl;
	}

	public void setAcProUrl(String acProUrl) {
		this.acProUrl = acProUrl;
	}

	public String getAcStatus() {
		return acStatus;
	}

	public void setAcStatus(String acStatus) {
		this.acStatus = acStatus;
	}

	public String getAcReMainImg() {
		return acReMainImg;
	}

	public void setAcReMainImg(String acReMainImg) {
		this.acReMainImg = acReMainImg;
	}

	public int getAcEndDateNum() {
		return acEndDateNum;
	}

	public void setAcEndDateNum(int acEndDateNum) {
		this.acEndDateNum = acEndDateNum;
	}

	@Override
	public String toString() {
		return "Auction [acBoardNo=" + acBoardNo + ", userId=" + userId + ", acTitle=" + acTitle + ", acProName="
				+ acProName + ", acStartPrice=" + acStartPrice + ", acStepPrice=" + acStepPrice + ", acNowPrice="
				+ acNowPrice + ", acImdPrice=" + acImdPrice + ", acStatusRank=" + acStatusRank + ", acCategory="
				+ acCategory + ", acBrand=" + acBrand + ", acMainImg=" + acMainImg + ", acProSize=" + acProSize
				+ ", acComent=" + acComent + ", acStartDate=" + acStartDate + ", acEndDate=" + acEndDate
				+ ", acBuyDate=" + acBuyDate + ", acProUrl=" + acProUrl + ", acStatus=" + acStatus + ", acReMainImg="
				+ acReMainImg + ", acEndDateNum=" + acEndDateNum + "]";
	}

	

}

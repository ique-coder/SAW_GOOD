package com.saw.good.auction.model.vo;

import java.sql.Date;

public class AuctionMember {

	private int acBoardNo;
	private String userId;
	private int bidPrice;
	private Date bidDate;
	private int bidStatus;
	public AuctionMember() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AuctionMember(int acBoardNo, String userId, int bidPrice, Date bidDate, int bidStatus) {
		super();
		this.acBoardNo = acBoardNo;
		this.userId = userId;
		this.bidPrice = bidPrice;
		this.bidDate = bidDate;
		this.bidStatus = bidStatus;
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
	public int getBidPrice() {
		return bidPrice;
	}
	public void setBidPrice(int bidPrice) {
		this.bidPrice = bidPrice;
	}
	public Date getBidDate() {
		return bidDate;
	}
	public void setBidDate(Date bidDate) {
		this.bidDate = bidDate;
	}
	public int getBidStatus() {
		return bidStatus;
	}
	public void setBidStatus(int bidStatus) {
		this.bidStatus = bidStatus;
	}
	@Override
	public String toString() {
		return "AuctionMember [acBoardNo=" + acBoardNo + ", userId=" + userId + ", bidPrice=" + bidPrice + ", bidDate="
				+ bidDate + ", bidStatus=" + bidStatus + "]";
	}
	
}

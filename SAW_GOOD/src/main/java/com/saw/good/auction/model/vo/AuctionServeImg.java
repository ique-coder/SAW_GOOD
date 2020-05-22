package com.saw.good.auction.model.vo;

public class AuctionServeImg {
	private int acBoardNo;
	private String acOriNameServe;
	private String acReNameServe;
	public AuctionServeImg() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AuctionServeImg(int acBoardNo, String acOriNameServe, String acReNameServe) {
		super();
		this.acBoardNo = acBoardNo;
		this.acOriNameServe = acOriNameServe;
		this.acReNameServe = acReNameServe;
	}
	public int getAcBoardNo() {
		return acBoardNo;
	}
	public void setAcBoardNo(int acBoardNo) {
		this.acBoardNo = acBoardNo;
	}
	public String getAcOriNameServe() {
		return acOriNameServe;
	}
	public void setAcOriNameServe(String acOriNameServe) {
		this.acOriNameServe = acOriNameServe;
	}
	public String getAcReNameServe() {
		return acReNameServe;
	}
	public void setAcReNameServe(String acReNameServe) {
		this.acReNameServe = acReNameServe;
	}
	@Override
	public String toString() {
		return "AuctionServeImg [acBoardNo=" + acBoardNo + ", acOriNameServe=" + acOriNameServe + ", acReNameServe="
				+ acReNameServe + "]";
	}
	
	
}

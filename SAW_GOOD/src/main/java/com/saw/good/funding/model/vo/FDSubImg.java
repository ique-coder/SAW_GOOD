package com.saw.good.funding.model.vo;

public class FDSubImg {
	
	int fdNo;
	String subImg;

	public FDSubImg() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FDSubImg(int fdNo, String subImg, String oriName) {
		super();
		this.fdNo = fdNo;
		this.subImg = subImg;
		
	}
	public int getFdNo() {
		return fdNo;
	}
	public void setFdNo(int fdNo) {
		this.fdNo = fdNo;
	}
	public String getSubImg() {
		return subImg;
	}
	public void setSubImg(String subImg) {
		this.subImg = subImg;
	}

	@Override
	public String toString() {
		return "FDSubImg [fdNo=" + fdNo + ", subImg=" + subImg + "]";
	}
	
}	

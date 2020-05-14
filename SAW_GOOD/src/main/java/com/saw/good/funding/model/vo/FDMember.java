package com.saw.good.funding.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


public class FDMember {

	int fdNo;
	String userId;
	int partPrice;
	String reword;

	
	public FDMember() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FDMember(int fdNo, String userId, int partPrice, String reword) {
		super();
		this.fdNo = fdNo;
		this.userId = userId;
		this.partPrice = partPrice;
		this.reword = reword;
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
	public int getPartPrice() {
		return partPrice;
	}
	public void setPartPrice(int partPrice) {
		this.partPrice = partPrice;
	}
	public String getReword() {
		return reword;
	}
	public void setReword(String reword) {
		this.reword = reword;
	}

	@Override
	public String toString() {
		return "FDMember [fdNo=" + fdNo + ", userId=" + userId + ", partPrice=" + partPrice + ", reword=" + reword+ "]";
	}
}

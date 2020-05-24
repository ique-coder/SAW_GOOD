package com.saw.good.funding.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


public class FDReword {

	private int fdNo;
	private String reword;
	private int partPrice;
	public FDReword(int fdNo, String reword, int partPrice) {
		super();
		this.fdNo = fdNo;
		this.reword = reword;
		this.partPrice = partPrice;
	}
	
	
	public FDReword() {
		// TODO Auto-generated constructor stub
	}


	public int getFdNo() {
		return fdNo;
	}


	public void setFdNo(int fdNo) {
		this.fdNo = fdNo;
	}


	public String getReword() {
		return reword;
	}


	public void setReword(String reword) {
		this.reword = reword;
	}


	public int getPartPrice() {
		return partPrice;
	}


	public void setPartPrice(int partPrice) {
		this.partPrice = partPrice;
	}
	
	
	
}

package com.saw.good.funding.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


public class FDReword {

	int fdNo;
	String reword;
	int minimum;
	public FDReword() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FDReword(int fdNo, String reword, int minimum) {
		super();
		this.fdNo = fdNo;
		this.reword = reword;
		this.minimum = minimum;
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
	public int getMinimum() {
		return minimum;
	}
	public void setMinimum(int minimum) {
		this.minimum = minimum;
	}
	@Override
	public String toString() {
		return "FDReword [fdNo=" + fdNo + ", reword=" + reword + ", minimum=" + minimum + "]";
	}
	
	
}

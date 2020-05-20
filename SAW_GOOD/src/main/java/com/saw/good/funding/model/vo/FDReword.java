package com.saw.good.funding.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FDReword {

	int fdNo;
	String reword;
	int partPrice;
	public FDReword() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FDReword(int fdNo, String reword, int partPrice) {
		super();
		this.fdNo = fdNo;
		this.reword = reword;
		this.partPrice = partPrice;
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
	@Override
	public String toString() {
		return "FDReword [fdNo=" + fdNo + ", reword=" + reword + ", partPrice=" + partPrice + "]";
	}
	
	
}

package com.saw.good.funding.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FDSubImg {
	
	private int fdNo;
	private String subImg;
	private String prevName;
	public FDSubImg(int fdNo, String subImg, String prevName) {
		super();
		this.fdNo = fdNo;
		this.subImg = subImg;
		this.prevName = prevName;
	}
	
	public FDSubImg() {
		// TODO Auto-generated constructor stub
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

	public String getPrevName() {
		return prevName;
	}

	public void setPrevName(String prevName) {
		this.prevName = prevName;
	}
	
	
	
	
}	

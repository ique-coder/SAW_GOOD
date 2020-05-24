package com.saw.good.funding.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class FDMember {

	private int fdNo;
	private String userId;
	private int partPrice;
	private String reword;
	private Date partDate;
	private int purStatus;
	private String reProfile;
	private String img;
	public FDMember(int fdNo, String userId, int partPrice, String reword, Date partDate, int purStatus,
			String reProfile, String img) {
		super();
		this.fdNo = fdNo;
		this.userId = userId;
		this.partPrice = partPrice;
		this.reword = reword;
		this.partDate = partDate;
		this.purStatus = purStatus;
		this.reProfile = reProfile;
		this.img = img;
	}
	
	public FDMember() {
		// TODO Auto-generated constructor stub
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

	public Date getPartDate() {
		return partDate;
	}

	public void setPartDate(Date partDate) {
		this.partDate = partDate;
	}

	public int getPurStatus() {
		return purStatus;
	}

	public void setPurStatus(int purStatus) {
		this.purStatus = purStatus;
	}

	public String getReProfile() {
		return reProfile;
	}

	public void setReProfile(String reProfile) {
		this.reProfile = reProfile;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	
	
}

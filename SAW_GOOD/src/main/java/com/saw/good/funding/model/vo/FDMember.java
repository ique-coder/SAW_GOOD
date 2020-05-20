package com.saw.good.funding.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FDMember {

	int fdNo;
	String userId;
	int partPrice;
	String reword;
	Date partDate;
	int purStatus;
	String profile;
	String img;
	public FDMember() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FDMember(int fdNo, String userId, int partPrice, String reword, Date partDate, int purStatus, String profile,
			String img) {
		super();
		this.fdNo = fdNo;
		this.userId = userId;
		this.partPrice = partPrice;
		this.reword = reword;
		this.partDate = partDate;
		this.purStatus = purStatus;
		this.profile = profile;
		this.img = img;
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
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	@Override
	public String toString() {
		return "FDMember [fdNo=" + fdNo + ", userId=" + userId + ", partPrice=" + partPrice + ", reword=" + reword
				+ ", partDate=" + partDate + ", purStatus=" + purStatus + ", profile=" + profile + ", img=" + img + "]";
	}
	
	
}

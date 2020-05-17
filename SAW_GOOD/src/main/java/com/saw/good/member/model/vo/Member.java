package com.saw.good.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

public class Member {

	private String userId;
	private String password;
	private String userName;
	private String email;
	private String phone;
	private String postCode;
	private String address1;
	private String address2;
	private String profile;
	private int point;
	private int status;
	private boolean emailAccess;
	private String businessNumber;
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Member(String userId, String password, String userName, String email, String phone, String postCode,
			String address1, String address2, String profile, int point, int status, boolean emailAccess,
			String businessNumber) {
		super();
		this.userId = userId;
		this.password = password;
		this.userName = userName;
		this.email = email;
		this.phone = phone;
		this.postCode = postCode;
		this.address1 = address1;
		this.address2 = address2;
		this.profile = profile;
		this.point = point;
		this.status = status;
		this.emailAccess = emailAccess;
		this.businessNumber = businessNumber;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPostCode() {
		return postCode;
	}
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public boolean isEmailAccess() {
		return emailAccess;
	}
	public void setEmailAccess(boolean emailAccess) {
		this.emailAccess = emailAccess;
	}
	public String getBusinessNumber() {
		return businessNumber;
	}
	public void setBusinessNumber(String businessNumber) {
		this.businessNumber = businessNumber;
	}
	@Override
	public String toString() {
		return "Member [userId=" + userId + ", password=" + password + ", userName=" + userName + ", email=" + email
				+ ", phone=" + phone + ", postCode=" + postCode + ", address1=" + address1 + ", address2=" + address2
				+ ", profile=" + profile + ", point=" + point + ", status=" + status + ", emailAccess=" + emailAccess
				+ ", businessNumber=" + businessNumber + "]";
	}
	
}


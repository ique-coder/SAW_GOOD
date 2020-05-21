package com.saw.good.payment.model.vo;

import java.sql.Date;

public class Payment {
	private int orderNo;
	private String userId;
	private String odName;
	private String odPhone;
	private String odEmail;
	private String rcName;
	private String rcPhone;
	private String rcAddress1;
	private String rcAddress2;
	private int rcPostCode;
	private int odTotalPrice;
	private String payChoice;
	private Date buyDate;
	public Payment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Payment(int orderNo, String userId, String odName, String odPhone, String odEmail, String rcName,
			String rcPhone, String rcAddress1, String rcAddress2, int rcPostCode, int odTotalPrice, String payChoice,
			Date buyDate) {
		super();
		this.orderNo = orderNo;
		this.userId = userId;
		this.odName = odName;
		this.odPhone = odPhone;
		this.odEmail = odEmail;
		this.rcName = rcName;
		this.rcPhone = rcPhone;
		this.rcAddress1 = rcAddress1;
		this.rcAddress2 = rcAddress2;
		this.rcPostCode = rcPostCode;
		this.odTotalPrice = odTotalPrice;
		this.payChoice = payChoice;
		this.buyDate = buyDate;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getOdName() {
		return odName;
	}
	public void setOdName(String odName) {
		this.odName = odName;
	}
	public String getOdPhone() {
		return odPhone;
	}
	public void setOdPhone(String odPhone) {
		this.odPhone = odPhone;
	}
	public String getOdEmail() {
		return odEmail;
	}
	public void setOdEmail(String odEmail) {
		this.odEmail = odEmail;
	}
	public String getRcName() {
		return rcName;
	}
	public void setRcName(String rcName) {
		this.rcName = rcName;
	}
	public String getRcPhone() {
		return rcPhone;
	}
	public void setRcPhone(String rcPhone) {
		this.rcPhone = rcPhone;
	}
	public String getRcAddress1() {
		return rcAddress1;
	}
	public void setRcAddress1(String rcAddress1) {
		this.rcAddress1 = rcAddress1;
	}
	public String getRcAddress2() {
		return rcAddress2;
	}
	public void setRcAddress2(String rcAddress2) {
		this.rcAddress2 = rcAddress2;
	}
	public int getRcPostCode() {
		return rcPostCode;
	}
	public void setRcPostCode(int rcPostCode) {
		this.rcPostCode = rcPostCode;
	}
	public int getOdTotalPrice() {
		return odTotalPrice;
	}
	public void setOdTotalPrice(int odTotalPrice) {
		this.odTotalPrice = odTotalPrice;
	}
	public String getPayChoice() {
		return payChoice;
	}
	public void setPayChoice(String payChoice) {
		this.payChoice = payChoice;
	}
	public Date getBuyDate() {
		return buyDate;
	}
	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}
	@Override
	public String toString() {
		return "Payment [orderNo=" + orderNo + ", userId=" + userId + ", odName=" + odName + ", odPhone=" + odPhone
				+ ", odEmail=" + odEmail + ", rcName=" + rcName + ", rcPhone=" + rcPhone + ", rcAddress1=" + rcAddress1
				+ ", rcAddress2=" + rcAddress2 + ", rcPostCode=" + rcPostCode + ", odTotalPrice=" + odTotalPrice
				+ ", payChoice=" + payChoice + ", buyDate=" + buyDate + "]";
	}
	
}

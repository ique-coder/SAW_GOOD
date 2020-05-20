package com.saw.good.payment.model.vo;

public class PaymentHistory {
	private int phNo;
	private int orderNo;
	private int productNo;
	private String userId;
	private int productNum;
	private int proTotalPrice;
	private String buyCheck;
	private int deliveryNum;
	public PaymentHistory() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PaymentHistory(int phNo, int orderNo, int productNo, String userId, int productNum, int proTotalPrice,
			String buyCheck, int deliveryNum) {
		super();
		this.phNo = phNo;
		this.orderNo = orderNo;
		this.productNo = productNo;
		this.userId = userId;
		this.productNum = productNum;
		this.proTotalPrice = proTotalPrice;
		this.buyCheck = buyCheck;
		this.deliveryNum = deliveryNum;
	}
	public int getPhNo() {
		return phNo;
	}
	public void setPhNo(int phNo) {
		this.phNo = phNo;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public int getProTotalPrice() {
		return proTotalPrice;
	}
	public void setProTotalPrice(int proTotalPrice) {
		this.proTotalPrice = proTotalPrice;
	}
	public String getBuyCheck() {
		return buyCheck;
	}
	public void setBuyCheck(String buyCheck) {
		this.buyCheck = buyCheck;
	}
	public int getDeliveryNum() {
		return deliveryNum;
	}
	public void setDeliveryNum(int deliveryNum) {
		this.deliveryNum = deliveryNum;
	}
	@Override
	public String toString() {
		return "PaymentHistory [phNo=" + phNo + ", orderNo=" + orderNo + ", productNo=" + productNo + ", userId="
				+ userId + ", productNum=" + productNum + ", proTotalPrice=" + proTotalPrice + ", buyCheck=" + buyCheck
				+ ", deliveryNum=" + deliveryNum + "]";
	}
	
}

package com.saw.good.cart.model.vo;

public class Cart {
	
	private String userId;
	private int productNo;
	private int cartCount;
	private int cartTotalPrice;
	
	public Cart() {
		// TODO Auto-generated constructor stub
	}

	public Cart(String userId, int productNo, int cartCount, int cartTotalPrice) {
		super();
		this.userId = userId;
		this.productNo = productNo;
		this.cartCount = cartCount;
		this.cartTotalPrice = cartTotalPrice;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getCartCount() {
		return cartCount;
	}

	public void setCartCount(int cartCount) {
		this.cartCount = cartCount;
	}

	public int getCartTotalPrice() {
		return cartTotalPrice;
	}

	public void setCartTotalPrice(int cartTotalPrice) {
		this.cartTotalPrice = cartTotalPrice;
	}

	@Override
	public String toString() {
		return "Cart [userId=" + userId + ", productNo=" + productNo + ", cartCount=" + cartCount + ", cartTotalPrice="
				+ cartTotalPrice + "]";
	}
	
	
}

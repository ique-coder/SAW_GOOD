package com.saw.good.product.model.vo;

public class Product {
	private int productNo;
	private String productName;
	private String productContent;
	private int productPrice;
	private String productImg;
	private String category;
	private String brand;
	private int star;
	private String status;
	private String topImg;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}
	
	public Product(int productNo, String productName, String productContent, int productPrice, String productImg,
			String category, String brand, int star, String status, String topImg) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.productContent = productContent;
		this.productPrice = productPrice;
		this.productImg = productImg;
		this.category = category;
		this.brand = brand;
		this.star = star;
		this.status = status;
		this.topImg = topImg;
	}

	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductContent() {
		return productContent;
	}
	public void setProductContent(String productContent) {
		this.productContent = productContent;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductImg() {
		return productImg;
	}
	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTopImg() {
		return topImg;
	}
	public void setTopImg(String topImg) {
		this.topImg = topImg;
	}
	
	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", productName=" + productName + ", productContent=" + productContent
				+ ", productPrice=" + productPrice + ", productImg=" + productImg + ", category=" + category
				+ ", brand=" + brand + ", star=" + star + ", status=" + status + ", topImg=" + topImg + "]";
	}

}

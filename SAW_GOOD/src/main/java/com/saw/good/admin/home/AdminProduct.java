package com.saw.good.admin.home;

import java.util.Arrays;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdminProduct {
	private int[] procheck;
	private String productname;
	private String[] brand;
	private String[] category;
	private int productprice;
	public AdminProduct() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AdminProduct(int[] procheck, String productname, String[] brand, String[] category, int productprice) {
		super();
		this.procheck = procheck;
		this.productname = productname;
		this.brand = brand;
		this.category = category;
		this.productprice = productprice;
	}
	public int[] getProcheck() {
		return procheck;
	}
	public void setProcheck(int[] procheck) {
		this.procheck = procheck;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String[] getBrand() {
		return brand;
	}
	public void setBrand(String[] brand) {
		this.brand = brand;
	}
	public String[] getCategory() {
		return category;
	}
	public void setCategory(String[] category) {
		this.category = category;
	}
	public int getProductprice() {
		return productprice;
	}
	public void setProductprice(int productprice) {
		this.productprice = productprice;
	}
	@Override
	public String toString() {
		return "AdminProduct [procheck=" + Arrays.toString(procheck) + ", productname=" + productname + ", brand="
				+ Arrays.toString(brand) + ", category=" + Arrays.toString(category) + ", productprice=" + productprice
				+ "]";
	}
	
}

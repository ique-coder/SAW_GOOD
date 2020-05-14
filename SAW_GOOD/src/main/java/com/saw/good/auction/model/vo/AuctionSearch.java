package com.saw.good.auction.model.vo;

import java.util.Arrays;

public class AuctionSearch {

	private String[] category;

	public AuctionSearch() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AuctionSearch(String[] category) {
		super();
		this.category = category;
	}

	public String[] getCategory() {
		return category;
	}

	public void setCategory(String[] category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "AuctionSearch [category=" + Arrays.toString(category) + "]";
	}
	
}

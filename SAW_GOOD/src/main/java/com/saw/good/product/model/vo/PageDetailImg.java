package com.saw.good.product.model.vo;

public class PageDetailImg {
	private int productNo;
	private String pdiOriNameFile;
	private String pdiRenameFile;
	
	public PageDetailImg() {
		// TODO Auto-generated constructor stub
	}

	public PageDetailImg(int productNo, String pdiOriNameFile, String pdiRenameFile) {
		super();
		this.productNo = productNo;
		this.pdiOriNameFile = pdiOriNameFile;
		this.pdiRenameFile = pdiRenameFile;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getPdiOriNameFile() {
		return pdiOriNameFile;
	}

	public void setPdiOriNameFile(String pdiOriNameFile) {
		this.pdiOriNameFile = pdiOriNameFile;
	}

	public String getPdiRenameFile() {
		return pdiRenameFile;
	}

	public void setPdiRenameFile(String pdiRenameFile) {
		this.pdiRenameFile = pdiRenameFile;
	}
	
	
}

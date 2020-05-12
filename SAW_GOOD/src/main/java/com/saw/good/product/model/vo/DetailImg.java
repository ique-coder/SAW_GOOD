package com.saw.good.product.model.vo;

public class DetailImg {
	private int productNo;
	private String diOriNameFile;
	private String diRenameFile;
	
	public DetailImg() {
		// TODO Auto-generated constructor stub
	}

	public DetailImg(int productNo, String diOriNameFile, String diRenameFile) {
		super();
		this.productNo = productNo;
		this.diOriNameFile = diOriNameFile;
		this.diRenameFile = diRenameFile;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getDiOriNameFile() {
		return diOriNameFile;
	}

	public void setDiOriNameFile(String diOriNameFile) {
		this.diOriNameFile = diOriNameFile;
	}

	public String getDiRenameFile() {
		return diRenameFile;
	}

	public void setDiRenameFile(String diRenameFile) {
		this.diRenameFile = diRenameFile;
	}
	
	
}

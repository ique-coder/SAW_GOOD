package com.saw.good.funding.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
//
//@Data
//@AllArgsConstructor
//@NoArgsConstructor
public class Funding {

	private int fdNo;
	private String userId; 
	private String designer;
	private String title;
	private String subContent;
	private String detail;
	private String fdSize;
	private int targetPrice;
	private Date enrollDate;
	private Date endDate;
	private String mainImg;
	private int status;
	private int count;
	private int sum;
	private String category;
	
	
}

package com.saw.good.funding.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class FDMember {

	private int fdNo;
	private String userId;
	private int partPrice;
	private String reword;
	private Date partDate;
	private int purStatus;
	private String profile;
	private String img;
	
	
}

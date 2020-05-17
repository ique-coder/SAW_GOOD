package com.saw.good.funding.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FDMember {

	int fdNo;
	String userId;
	int partPrice;
	String reword;
	Date partDate;
	int purStatus;
	String profile;
	String img;
}

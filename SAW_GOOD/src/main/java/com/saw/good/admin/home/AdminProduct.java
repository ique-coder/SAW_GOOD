package com.saw.good.admin.home;

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
}

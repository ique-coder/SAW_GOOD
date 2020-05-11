package com.saw.good.admin.product.model.service;

import java.util.List;
import java.util.Map;

public interface AdminProductService {
	
	List<Map<String,String>> selectProduct(int cPage,int numPerPage);
	int countProduct();
}

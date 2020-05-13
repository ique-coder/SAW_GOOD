package com.saw.good.product.model.service;

import java.util.List;
import java.util.Map;

import com.saw.good.product.model.vo.Product;

public interface ProductService {
	
	List<Map<String,String>> selectProduct(int cPage, int numPerPage);
	int countProduct();
	Product selectProductView(int no);
}

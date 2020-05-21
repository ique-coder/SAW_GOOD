package com.saw.good.furniture.model.service;

import java.util.List;
import java.util.Map;

import com.saw.good.cart.model.vo.Cart;
import com.saw.good.product.model.vo.Product;

public interface FurnitureService {
	
	List<Product> category(Map<String,String> categoryNames);
	int totalData(Map<String,String> categoryNames);
	
	List<Map<String, Object>> cart(String userId);
	
	boolean deleteCart(String userId);
	int insertCart(Map<String,Object> product);
}

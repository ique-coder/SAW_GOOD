package com.saw.good.cart.model.service;

import java.util.List;
import java.util.Map;

import com.saw.good.cart.model.vo.Cart;
import com.saw.good.product.model.vo.Product;

public interface CartService {
	
	List<Map<String,String>> selectCart(String userId);
	Product selectProductView(int no);
	int insertCart(Map map);
	
	int deleteCart(String[] productNo,String userid);
}

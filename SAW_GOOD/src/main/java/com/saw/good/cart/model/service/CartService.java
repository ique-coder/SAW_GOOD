package com.saw.good.cart.model.service;

import java.util.List;
import java.util.Map;

import com.saw.good.cart.model.vo.Cart;

public interface CartService {
	
	List<Map<String,String>> selectCart(String userId);
}

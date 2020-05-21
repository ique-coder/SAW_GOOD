package com.saw.good.furniture.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.saw.good.cart.model.vo.Cart;
import com.saw.good.product.model.vo.Product;

public interface FurnitureDao {

	List<Product> category(SqlSession session, Map<String,String> categoryNames);
	int totalData(SqlSession session, Map<String,String> categoryNames);
	List<Map<String, Object>> cart(SqlSession session, String userId);
	
	boolean deleteCart(SqlSession session, String userId);
	int insertCart(SqlSession session, Map<String,Object> product);
}

package com.saw.good.cart.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.saw.good.cart.model.vo.Cart;
import com.saw.good.product.model.vo.Product;

public interface CartDao {

	List<Map<String,String>> selectCart(SqlSession session,String userId);
	Product selectProductView(SqlSession session, int no);
	int insertCart(SqlSession session, Map map);
	Cart selectData(SqlSession session, Map map);
	
	int deleteCart(SqlSession session,Map<String,String> map);
}

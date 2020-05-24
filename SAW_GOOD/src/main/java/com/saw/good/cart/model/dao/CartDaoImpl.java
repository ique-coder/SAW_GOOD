package com.saw.good.cart.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.saw.good.cart.model.vo.Cart;
import com.saw.good.product.model.vo.Product;

@Repository
public class CartDaoImpl implements CartDao {

	@Override
	public List<Map<String,String>> selectCart(SqlSession session, String userId) {
		// TODO Auto-generated method stub
		return session.selectList("cart.selectCart",userId);
	}

	@Override
	public Product selectProductView(SqlSession session, int no) {
		// TODO Auto-generated method stub
		return session.selectOne("cart.selectProductView", no);
	}

	@Override
	public int insertCart(SqlSession session, Map map) {
		return session.insert("cart.insertCart", map);
	}
	
	@Override
	public Cart selectData(SqlSession session, Map map) {
		return session.selectOne("cart.selectData", map);
	}

	@Override
	public int deleteCart(SqlSession session, Map<String,String> map) {
		// TODO Auto-generated method stub
		return session.delete("cart.deleteCart", map);
	}
	
	
	
	
	

}

package com.saw.good.cart.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.saw.good.cart.model.vo.Cart;

@Repository
public class CartDaoImpl implements CartDao {

	@Override
	public List<Map<String,String>> selectCart(SqlSession session, String userId) {
		// TODO Auto-generated method stub
		return session.selectList("cart.selectCart",userId);
	}

	
	
	

}

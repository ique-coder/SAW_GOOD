package com.saw.good.cart.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saw.good.cart.model.dao.CartDao;
import com.saw.good.cart.model.vo.Cart;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDao dao;
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<Map<String,String>> selectCart(String userId) {
		// TODO Auto-generated method stub
		return dao.selectCart(session,userId);
	}
	
	

}

package com.saw.good.cart.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saw.good.cart.model.dao.CartDao;
import com.saw.good.product.model.vo.Product;

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

	@Override
	public Product selectProductView(int no) {
		return dao.selectProductView(session,no);
	}

	@Override
	public int insertCart(Map map) {
		return dao.insertCart(session,map);
	}

	@Override
	public int deleteCart(String[] productNo,String userid) throws RuntimeException {
		// TODO Auto-generated method stub
		int result=0;
		Map<String,String> map=new HashMap();
		for(String s: productNo) {
			map.put("no",s);
			map.put("userid",userid);
			result=dao.deleteCart(session,map);
			if(result==0) {
				throw new RuntimeException();
			}
			map.remove("no");
			map.remove("userid");
		}
		
		return result;
	}
	
	
	

}

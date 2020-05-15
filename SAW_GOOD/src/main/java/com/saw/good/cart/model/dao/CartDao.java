package com.saw.good.cart.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.saw.good.cart.model.vo.Cart;

public interface CartDao {

	List<Map<String,String>> selectCart(SqlSession session,String userId);
}

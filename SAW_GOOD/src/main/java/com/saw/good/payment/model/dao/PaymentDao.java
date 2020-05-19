package com.saw.good.payment.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public interface PaymentDao {
	
	Map<String,String> selectPayment(SqlSession session, String userId,String pNo);
	
	int updateCart(SqlSession session, String userId, String pNo,String tp,String qt);
}

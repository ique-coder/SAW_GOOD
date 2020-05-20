package com.saw.good.payment.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public interface PaymentDao {
	
	List<Map<String,String>> selectPayment(SqlSession session, String userId);
}

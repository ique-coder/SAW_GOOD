package com.saw.good.payment.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.saw.good.payment.model.service.PaymentService;

@Repository
public class PaymentDaoImpl implements PaymentDao {



	@Override
	public List<Map<String, String>> selectPayment(SqlSession session, String userId) {
		// TODO Auto-generated method stub
		return session.selectList("payment.selectPayment",userId);
	}

	

	

}

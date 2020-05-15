package com.saw.good.payment.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saw.good.payment.model.dao.PaymentDao;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	private PaymentDao dao;
	
	@Autowired
	private SqlSession session;
	
	
	@Override
	public int insertPaymentHistory() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Map<String, String>> selectPayment(String userId) {
		// TODO Auto-generated method stub
		return dao.selectPayment(session,userId);
	}

}

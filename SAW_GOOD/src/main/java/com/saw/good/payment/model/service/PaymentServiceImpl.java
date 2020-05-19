package com.saw.good.payment.model.service;

import java.util.ArrayList;
import java.util.HashMap;
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
	public List<Map<String, String>> selectPayment(String userId,List<String> pNo) {
		// TODO Auto-generated method stub
		
		List<Map<String, String>> list=new ArrayList();
		for(int i=0;i<pNo.size();i++) {
			list.add(dao.selectPayment(session, userId, pNo.get(i)));
		}
		
		return list;
	}

	@Override
	public int updateCart(String userId,List<String> pNo,List<String> tp,List<String> qt) {
		
		int result=0;
		
		for(int i=0;i<pNo.size();i++) {
			result+=dao.updateCart(session, userId, pNo.get(i),tp.get(i),qt.get(i));
		}
		return result;
	}
	
	

}

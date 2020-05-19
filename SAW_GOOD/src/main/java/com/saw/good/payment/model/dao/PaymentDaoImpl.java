package com.saw.good.payment.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentDaoImpl implements PaymentDao {



	@Override
	public Map<String, String> selectPayment(SqlSession session, String userId,String pNo) {
		// TODO Auto-generated method stub
		Map<String,String> map = new HashMap();
		map.put("userId", userId);
		map.put("pNo", pNo);
		return session.selectOne("payment.selectPayment",map);
	}

	@Override
	public int updateCart(SqlSession session, String userId, String pNo, String tp,String qt) {
		// TODO Auto-generated method stub
		Map<String,String> map = new HashMap();
		map.put("userId", userId);
		map.put("pNo", pNo);
		map.put("tp", tp);
		map.put("qt", qt);
		return session.update("cart.updateCart", map);
	}



	

	
	

	

}

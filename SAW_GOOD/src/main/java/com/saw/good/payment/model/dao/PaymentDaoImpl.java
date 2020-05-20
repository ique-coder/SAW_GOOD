package com.saw.good.payment.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.saw.good.member.model.vo.Member;
import com.saw.good.payment.model.vo.Payment;
import com.saw.good.payment.model.vo.PaymentHistory;

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

	@Override
	public int insertPayment(SqlSession session, Payment p) {
		// TODO Auto-generated method stub
		return session.insert("payment.insertPayment",p);
	}

	

	@Override
	public int insertPaymentHistory(SqlSession session, int odNo2, String userId, String pNo, String pNum,
			String tPrice) {
		// TODO Auto-generated method stub
		Map<String,String> map = new HashMap();
		String odNo=Integer.toString(odNo2);
		map.put("odNo",odNo);
		map.put("userId", userId);
		map.put("pNo", pNo);
		map.put("pNum", pNum);
		map.put("tPrice", tPrice);
		return session.insert("payment.insertPaymentHistory",map);
	}

	@Override
	public int selectOdNo(SqlSession session, Member m) {
		// TODO Auto-generated method stub
		return session.selectOne("payment.selectOdNo",m);
	}



	

	
	

	

}

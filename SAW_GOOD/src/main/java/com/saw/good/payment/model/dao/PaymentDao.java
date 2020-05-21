package com.saw.good.payment.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.saw.good.member.model.vo.Member;
import com.saw.good.payment.model.vo.Payment;
import com.saw.good.payment.model.vo.PaymentHistory;

public interface PaymentDao {
	
	Map<String,String> selectPayment(SqlSession session, String userId,String pNo);
	
	int updateCart(SqlSession session, String userId, String pNo,String tp,String qt);
	
	int insertPayment(SqlSession session,Payment p);
	
	int insertPaymentHistory(SqlSession session,int odNo,String userId, String pNo,String pNum,String tPrice);
	
	int selectOdNo(SqlSession session,Member m);
}

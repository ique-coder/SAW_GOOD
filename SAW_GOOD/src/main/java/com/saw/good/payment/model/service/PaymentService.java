package com.saw.good.payment.model.service;

import java.util.List;
import java.util.Map;

import com.saw.good.member.model.vo.Member;
import com.saw.good.payment.model.vo.Payment;
import com.saw.good.payment.model.vo.PaymentHistory;

public interface PaymentService {

	
	
	List<Map<String,String>> selectPayment(String userId,List<String> pNo);
	
	int updateCart(String userId,List<String> pNo,List<String> tp,List<String> qt);
	
	int insertPayment(Payment p);
	
	int insertPaymentHistory(int odNo,String userId,List<String> pNo,List<String> pNum,List<String> tPrice);
	
	int selectOdNo(Member m);
	
}

package com.saw.good.payment.model.service;

import java.util.List;
import java.util.Map;

public interface PaymentService {

	int insertPaymentHistory();
	
	List<Map<String,String>> selectPayment(String userId);
}

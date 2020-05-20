package com.saw.good.payment.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.saw.good.member.model.vo.Member;
import com.saw.good.payment.model.service.PaymentService;
import com.saw.good.payment.model.vo.Payment;
import com.saw.good.payment.model.vo.PaymentHistory;
@Controller
public class PaymentController {
	
	@Autowired
	private PaymentService service;
	
	@Autowired
	Logger logger;
	
	@RequestMapping("/payment/paymentView")
	public ModelAndView paymentView(ModelAndView mv,@SessionAttribute("loginMember") Member m,
			@RequestParam(value="productNo") List<String> pNo,@RequestParam(value="cartTotalP") List<String> tp,
			@RequestParam(value="pdQuantity") List<String> qt){
		
		String userId = m.getUserId();
		
		int result=service.updateCart(userId,pNo,tp,qt);
		
		List<Map<String,String>> list = service.selectPayment(userId,pNo);
		System.out.println(list);
		mv.addObject("list",list);
		mv.setViewName("payment/payment");
		return mv;
	}
	@RequestMapping("/payment/paymentComplete")
	public ModelAndView paymentCpl(ModelAndView mv,@SessionAttribute("loginMember") Member m,
									@RequestParam(value="productNo") List<String> pNo,
									@RequestParam(value="productNum") List<String> pNum,
									@RequestParam(value="proTotalPrice") List<String> tPrice,
									Payment p) {
		System.out.println(m);
		System.out.println(p);
		System.out.println(pNo);
		System.out.println(pNum);
		System.out.println(tPrice);
		
		int pResult=service.insertPayment(p);
		int odNo=service.selectOdNo(m);
		String userId=m.getUserId();

		int phResult=service.insertPaymentHistory(odNo,userId,pNo,pNum,tPrice);
		return mv;
	}
}

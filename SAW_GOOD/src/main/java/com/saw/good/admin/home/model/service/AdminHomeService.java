package com.saw.good.admin.home.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saw.good.admin.home.model.dao.AdminHomeDao;

@Service
public class AdminHomeService {
	
	@Autowired
	private AdminHomeDao dao;
	@Autowired
	private SqlSession session;
	
	public List<Map<String,String>> selectTopFive(){
		return dao.selectTopFive(session);
	}
	public int[] totalPrice() {
		int[] total=new int[7];
		for(int i=0;i<7;i++) {
			int count=dao.countToday(session,i);
			total[i]=dao.totalPrice(session,i,count);
		}
		
		return total;
	}
	
}

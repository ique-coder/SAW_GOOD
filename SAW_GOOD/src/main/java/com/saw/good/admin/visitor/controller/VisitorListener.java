package com.saw.good.admin.visitor.controller;


import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.saw.good.admin.visitor.model.dao.VisitorDao;

public class VisitorListener implements HttpSessionListener{

	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		VisitorDao dao=new VisitorDao();
		System.out.println("방문자");
		HttpSession session=se.getSession();
		int[] today=new int[7];
		
		try {
			dao.setVisitTotalCount();
			for(int i=0;i<7;i++) {
				today[i]=dao.getVisitTodayCount(i);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		session.setAttribute("weekvisit", today);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		
	}

	
}

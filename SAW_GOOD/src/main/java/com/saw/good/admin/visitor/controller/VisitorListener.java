package com.saw.good.admin.visitor.controller;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.saw.good.admin.visitor.model.dao.VisitorDao;

public class VisitorListener implements HttpSessionListener{

	
	private VisitorDao dao=new VisitorDao();
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		
		dao.setVisitTotalCount();
		
		int total=dao.getVisitTotalCount();
		
		int today=dao.getVisitTodayCount();
		
		HttpSession session=se.getSession();
		
		session.setAttribute("totalVisit", total);
		session.setAttribute("todayVisit", today);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		
	}

	
}

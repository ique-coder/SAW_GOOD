package com.saw.good.admin.visitor.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;


public class VisitorDao {
	
	@Autowired
	private SqlSession session;
	
	public void setVisitTotalCount() {
		session.insert("visitor.insertVisitor");
	}
	
	public int getVisitTotalCount() {
		
		return session.selectOne("visitor.totalVisitor");
	}
	
	public int getVisitTodayCount() {
		
		return session.selectOne("visitor.todayVisitor");
	}
	
	
	
}

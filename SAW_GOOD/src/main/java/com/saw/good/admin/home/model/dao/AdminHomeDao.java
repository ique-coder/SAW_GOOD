package com.saw.good.admin.home.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class AdminHomeDao {
	
	public List<Map<String,String>> selectTopFive(SqlSession session){
		
		RowBounds rb=new RowBounds(0,5);
		
		return session.selectList("adminHome.topFiveProduct", null, rb);
	}
	public int countToday(SqlSession session,int i) {
		return session.selectOne("adminHome.countToday", i);
	}
	
	public int totalPrice(SqlSession session,int i,int count) {
		Map<String,Object> map=new HashMap();
		map.put("i", i);
		map.put("count", count);
		
		return session.selectOne("adminHome.totalPrice", map);
	}
}

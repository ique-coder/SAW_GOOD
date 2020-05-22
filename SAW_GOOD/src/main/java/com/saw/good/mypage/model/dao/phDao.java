package com.saw.good.mypage.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public interface phDao {

	List<Map<String,String>> product(SqlSession session, String userId);
	
	List<Map<String,String>> auction(SqlSession session, String userId);
	
	List<Map<String,String>> funding(SqlSession session, String userId);
	
	int buyOk(SqlSession session, Map<String, Object> map);
	int status(SqlSession session, Map<String, Object> map);
	
	int extend(SqlSession session, Map<String, Object> map);
}

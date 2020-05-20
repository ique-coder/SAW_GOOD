package com.saw.good.mypage.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public interface phDao {

	List<Map<String,String>> product(SqlSession session, String userId);
	
}

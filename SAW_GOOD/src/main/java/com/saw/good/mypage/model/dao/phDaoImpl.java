package com.saw.good.mypage.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class phDaoImpl implements phDao{

	@Override
	public List<Map<String, String>> product(SqlSession session, String userId) {
		return session.selectList("mypage.product", userId);
	}

	
	
}

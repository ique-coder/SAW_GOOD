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

	@Override
	public List<Map<String, String>> auction(SqlSession session, String userId) {
		return session.selectList("mypage.auction", userId);
	}

	@Override
	public List<Map<String, String>> funding(SqlSession session, String userId) {
		return session.selectList("mypage.funding", userId);
	}
	
}

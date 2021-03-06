package com.saw.good.index.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class IndexDaoImpl implements IndexDao{

	@Override
	public List<Map<String, String>> newProduct(SqlSession session) {
		return session.selectList("index.newProduct");
	}

	@Override
	public List<Map<String, String>> newFunding(SqlSession session) {
		return session.selectList("index.newFunding");
	}

	@Override
	public List<Map<String, String>> newAuction(SqlSession session) {
		return session.selectList("index.newAuction");
	}
	
	
	
	@Override
	public List<Map<String, String>> hotProduct(SqlSession session) {
		return session.selectList("index.hotProduct");
	}

	@Override
	public List<Map<String, String>> hotFunding(SqlSession session) {
		return session.selectList("index.hotFunding");
	}

	@Override
	public List<Map<String, String>> hotAuction(SqlSession session) {
		return session.selectList("index.hotAuction");
	}

	
}

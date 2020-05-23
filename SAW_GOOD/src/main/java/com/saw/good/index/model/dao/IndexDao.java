package com.saw.good.index.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public interface IndexDao {

	public List<Map<String, String>> newProduct(SqlSession session);
	public List<Map<String, String>> newFunding(SqlSession session);
	public List<Map<String, String>> newAuction(SqlSession session);
	
}

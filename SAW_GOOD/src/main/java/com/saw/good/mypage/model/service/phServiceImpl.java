package com.saw.good.mypage.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saw.good.mypage.model.dao.phDao;

@Service
public class phServiceImpl implements phService{

	@Autowired
	private SqlSessionTemplate session;
	@Autowired
	private phDao dao;
	
	@Override
	public List<Map<String, String>> product(String userId) {
		return dao.product(session, userId);
	}

	@Override
	public List<Map<String, String>> auction(String userId) {
		return dao.auction(session, userId);
	}

	@Override
	public List<Map<String, String>> funding(String userId) {
		return dao.funding(session, userId);
	}

	@Override
	public int buyOk(Map<String, Object> map) {
		return dao.buyOk(session, map);
	}

	@Override
	public int status(Map<String, Object> map) {
		return dao.status(session, map);
	}

	@Override
	public int extend(Map<String, Object> map) {
		return dao.extend(session, map);
	}
	
	
	
	
	
}

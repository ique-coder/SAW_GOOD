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

}
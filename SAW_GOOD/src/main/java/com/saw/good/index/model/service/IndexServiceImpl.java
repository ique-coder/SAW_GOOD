package com.saw.good.index.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saw.good.index.model.dao.IndexDao;

@Service
public class IndexServiceImpl implements IndexService{
	
	@Autowired
	private IndexDao dao;
	@Autowired
	private SqlSessionTemplate session;
	

	@Override
	public List<Map<String, String>> newProduct() {
		return dao.newProduct(session);
	}

	@Override
	public List<Map<String, String>> newFunding() {
		return dao.newFunding(session);
	}

	@Override
	public List<Map<String, String>> newAuction() {
		return dao.newAuction(session);
	}

	
	@Override
	public List<Map<String, String>> hotProduct() {
		return dao.hotProduct(session);
	}

	@Override
	public List<Map<String, String>> hotFunding() {
		return dao.hotFunding(session);
	}

	@Override
	public List<Map<String, String>> hotAuction() {
		return dao.hotAuction(session);
	}
	
	
	
}

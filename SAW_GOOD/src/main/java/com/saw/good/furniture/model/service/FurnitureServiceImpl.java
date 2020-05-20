package com.saw.good.furniture.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saw.good.furniture.model.dao.FurnitureDao;
import com.saw.good.product.model.vo.Product;

@Service
public class FurnitureServiceImpl implements FurnitureService{
	@Autowired
	private FurnitureDao dao;
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<Product> category(Map<String, String> categoryNames) {
		return dao.category(session, categoryNames);
	}

	@Override
	public int totalData(Map<String, String> categoryNames) {
		return dao.totalData(session, categoryNames);
	}
	
	

	
	
}

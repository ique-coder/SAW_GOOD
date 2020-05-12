package com.saw.good.product.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saw.good.product.model.dao.ProductDao;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<Map<String, String>> selectProduct(int cPage, int numPerPage) {
		return dao.selectProduct(session, cPage, numPerPage);
	}

	@Override
	public int countProduct() {
		return dao.countProduct(session);
	}
	
}

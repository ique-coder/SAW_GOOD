package com.saw.good.admin.product.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saw.good.admin.product.model.dao.AdminProductDao;

@Service
public class AdminProductServiceImpl implements AdminProductService{

	@Autowired
	private AdminProductDao dao;
	
	@Autowired
	private SqlSession session;
	
	
	@Override
	public List<Map<String, String>> selectProduct(int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectProduct(session,cPage,numPerPage);
	}

	@Override
	public int countProduct() {
		// TODO Auto-generated method stub
		return dao.countProduct(session);
	}

	
}

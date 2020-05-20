package com.saw.good.product.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saw.good.product.model.dao.ProductDao;
import com.saw.good.product.model.vo.Product;
import com.saw.good.product.model.vo.ProductQna;

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

	@Override
	public Product selectProductView(int no) {
		return dao.selectProductView(session, no);
	}

	@Override
	public List<Map<String, String>> searchProduct(int cPage, int numPerPage, Map<String, String> map) {
		return dao.searchProduct(session, cPage, numPerPage, map);
	}

	@Override
	public int countSearchProduct(Map<String, String> map) {
		return dao.countSearchProduct(session,map);
	}

	@Override
	public List<Map<String,Object>> searchCategory(int cPage, int numPerPage, Map<String,Object> map) {
		return dao.searchCategory(session, cPage, numPerPage, map);
	}

	@Override
	public int countSearchCategory(Map<String,Object> map) {
		// TODO Auto-generated method stub
		return dao.countSearchCategory(session, map);
	}

	@Override
	public int insertQna(Map map) {
		return dao.insertQna(session, map);
	}

	@Override
	public List<ProductQna> selectProductQna(int no,int cPage,int numPerPage) {
		return dao.selectProductQna(session, no, cPage, numPerPage);
	}

	@Override
	public int countQna(int no) {
		return dao.countQna(session, no);
	}

	@Override
	public ProductQna selectQnaCheck(int no) {
		return dao.selectQnaCheck(session,no);
	}

	@Override
	public int insertReplyQna(Map map) {
		return dao.insertReplyQna(session, map);
	}
	
}

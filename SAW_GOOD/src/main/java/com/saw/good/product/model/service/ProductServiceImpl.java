package com.saw.good.product.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saw.good.product.model.dao.ProductDao;
import com.saw.good.product.model.vo.Product;
import com.saw.good.product.model.vo.ProductQna;
import com.saw.good.product.model.vo.ProductReview;

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
	public List<Map<String, String>> selectStar() {
		return dao.selectStar(session);
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
	public List<ProductReview> selectProductReview(int no, int cPage, int numPerPage) {
		return dao.selectProductReview(session, no, cPage, numPerPage);
	}

	@Override
	public int countQna(int no) {
		return dao.countQna(session, no);
	}
	
	@Override
	public int countReview(int no) {
		return dao.countReview(session, no);
	}

	@Override
	public ProductQna selectQnaCheck(int no) {
		return dao.selectQnaCheck(session,no);
	}

	@Override
	public int insertReplyQna(Map map) {
		return dao.insertReplyQna(session, map);
	}

	@Override
	public int insertReview(Map map) {
		return dao.insertReview(session, map);
	}

	@Override
	public int countFive(int no) {
		return dao.countFive(session, no);
	}

	@Override
	public int countFour(int no) {
		return dao.countFour(session, no);
	}

	@Override
	public int countThree(int no) {
		return dao.countThree(session, no);
	}

	@Override
	public int countTwo(int no) {
		return dao.countTwo(session, no);
	}

	@Override
	public int countOne(int no) {
		return dao.countOne(session, no);
	}

	@Override
	public void updateReadCount(int no) {
		dao.updateReadCount(session, no);
	}

	@Override
	public String historyCheck(Map map) {
		return dao.historyCheck(session, map);
	}

	@Override
	public ProductReview selectReviewOne(Map map) {
		return dao.selectReviewOne(session, map);
	}
	
}

package com.saw.good.admin.product.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saw.good.admin.home.AdminProduct;
import com.saw.good.admin.product.model.dao.AdminProductDao;
import com.saw.good.product.model.vo.DetailImg;
import com.saw.good.product.model.vo.PageDetailImg;
import com.saw.good.product.model.vo.Product;

@Service
public class AdminProductServiceImpl implements AdminProductService{

	@Autowired
	private AdminProductDao dao;
	
	@Autowired
	private SqlSession session;
	
	@Autowired
	private Logger logger;
	
	//상품목록 불러오기
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
	
	//상품업데이트
	@Override
	public Map<String, String> oneProduct(int productno) {
		// TODO Auto-generated method stub
		return dao.oneProduct(session,productno);
	}
	//상품삭제

	@Override
	public int deleteProduct(int productno) {
		// TODO Auto-generated method stub
		return dao.deleteProduct(session,productno);
	}

	@Override
	public int checkDelete(AdminProduct a) {
		// TODO Auto-generated method stub
		return dao.checkDelete(session,a);
	}
	
	//상품검색
	@Override
	public List<Map<String, String>> searchProduct(int cPage, int numPerPage, AdminProduct a) {
		// TODO Auto-generated method stub
		return dao.searchProduct(session,cPage,numPerPage,a);
	}

	@Override
	public int countSearchProduct(AdminProduct a) {
		// TODO Auto-generated method stub
		return dao.countSearchProduct(session,a);
	}
	
	//상품등록,상품상세페이지 이미지 등록,상품상세이미지 등록
	@Override
	public int insertProduct(Product p,List<DetailImg> diList,List<PageDetailImg> pdiList) throws RuntimeException  {
		// TODO Auto-generated method stub
		int result=dao.insertProduct(session,p);
		if(result==0) {
			throw new RuntimeException();
		}
		System.out.println(p.getProductNo());
		if(!diList.isEmpty()) {
			for(DetailImg di : diList) {
				di.setProductNo(p.getProductNo());
				result=dao.insertDetailImg(session,di);
				if(result==0) {
					throw new RuntimeException();
				}
			}
		}
		if(!pdiList.isEmpty()) {
			for(PageDetailImg pdi : pdiList) {
				pdi.setProductNo(p.getProductNo());
				result=dao.insertPageDetailImg(session,pdi);
				if(result==0) {
					throw new RuntimeException();
				}
			}
		}
		return result;
	}

	
	
	
	
	
	
	

	
}

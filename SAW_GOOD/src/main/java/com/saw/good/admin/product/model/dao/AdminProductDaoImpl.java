package com.saw.good.admin.product.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.saw.good.admin.home.AdminProduct;

@Repository
public class AdminProductDaoImpl implements AdminProductDao {
	
	//상품목록 불러오기
	@Override
	public List<Map<String, String>> selectProduct(SqlSession session,int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("product.selectProduct", null, rb );
	}

	@Override
	public int countProduct(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("product.countProduct");
	}

	//상품수정 페이지이동
	@Override
	public Map<String, String> oneProduct(SqlSession session, int productno) {
		// TODO Auto-generated method stub
		return session.selectOne("product.oneProduct", productno);
	}
	
	//상품삭제
	@Override
	public int deleteProduct(SqlSession session, int productno) {
		// TODO Auto-generated method stub
		return session.update("product.deleteProduct", productno);
	}

	//선택삭제
	@Override
	public int checkDelete(SqlSession session, AdminProduct a) {
		// TODO Auto-generated method stub
		return session.update("product.checkDelete", a);
	}
	
	
	
	
	
}

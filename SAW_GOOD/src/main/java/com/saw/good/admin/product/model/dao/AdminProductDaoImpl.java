package com.saw.good.admin.product.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class AdminProductDaoImpl implements AdminProductDao {

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

	
}

package com.saw.good.product.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDaoImpl implements ProductDao {

	@Override
	public List<Map<String, String>> selectProduct(SqlSessionTemplate session, int cPage, int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("newProduct.selectProduct", null, rb );
	}

	@Override
	public int countProduct(SqlSessionTemplate session) {
		return session.selectOne("newProduct.countProduct");
	}
	
}

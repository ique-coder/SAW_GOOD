package com.saw.good.product.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.saw.good.product.model.vo.Product;

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

	@Override
	public Product selectProductView(SqlSessionTemplate session, int no) {
		return session.selectOne("newProduct.selectProductView",no);
	}

	@Override
	public List<Map<String, String>> searchProduct(SqlSessionTemplate session, int cPage, int numPerPage,
			Map<String, String> map) {
		RowBounds rowBounds=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("newProduct.searchProduct", map, rowBounds);
	}

	@Override
	public int countSearchProduct(SqlSessionTemplate session, Map<String, String> map) {
		return session.selectOne("newProduct.countSearchProduct", map);
	}
	
}

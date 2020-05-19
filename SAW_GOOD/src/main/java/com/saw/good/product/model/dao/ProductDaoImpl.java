package com.saw.good.product.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.saw.good.product.model.vo.Product;
import com.saw.good.product.model.vo.ProductQna;

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

	@Override
	public List<Map<String,Object>> searchCategory(SqlSessionTemplate session, int cPage, int numPerPage, Map<String,Object> map) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("newProduct.searchCategory", map, rb);
	}

	@Override
	public int countSearchCategory(SqlSessionTemplate session, Map<String,Object> map) {
		return session.selectOne("newProduct.countSearchCategory", map);
	}

	@Override
	public int insertQna(SqlSessionTemplate session, Map map) {
		return session.insert("newProduct.insertQna", map);
	}

	@Override
	public List<ProductQna> selectProductQna(SqlSessionTemplate session, int no,int cPage,int numPerPage) {
		RowBounds rowBounds=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("newProduct.selectProductQna", no, rowBounds);
	}

	@Override
	public int countQna(SqlSessionTemplate session) {
		return session.selectOne("newProduct.countQna");
	}

	@Override
	public ProductQna selectQnaCheck(SqlSessionTemplate session, int no) {
		return session.selectOne("newProduct.selectQnaCheck", no);
	}
	
}

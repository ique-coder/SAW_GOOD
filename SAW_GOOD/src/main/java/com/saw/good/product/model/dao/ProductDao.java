package com.saw.good.product.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.saw.good.product.model.vo.Product;

public interface ProductDao {
	
	List<Map<String, String>> selectProduct(SqlSessionTemplate session, int cPage, int numPerPage);
	int countProduct(SqlSessionTemplate session);
	Product selectProductView(SqlSessionTemplate session, int no);
}

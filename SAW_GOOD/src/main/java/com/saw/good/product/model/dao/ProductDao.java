package com.saw.good.product.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface ProductDao {
	
	List<Map<String, String>> selectProduct(SqlSessionTemplate session, int cPage, int numPerPage);
	int countProduct(SqlSessionTemplate session);
	
}

package com.saw.good.admin.product.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public interface AdminProductDao {

	List<Map<String,String>> selectProduct(SqlSession session,int cPage,int numPerPage);
	int countProduct(SqlSession session);
}

package com.saw.good.product.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.saw.good.product.model.vo.Product;
import com.saw.good.product.model.vo.ProductQna;

public interface ProductDao {
	
	List<Map<String, String>> selectProduct(SqlSessionTemplate session, int cPage, int numPerPage);
	int countProduct(SqlSessionTemplate session);
	Product selectProductView(SqlSessionTemplate session, int no);
	List<Map<String,String>> searchProduct(SqlSessionTemplate session,int cPage,int numPerPage,Map<String,String> map);
	int countSearchProduct(SqlSessionTemplate session,Map<String,String> map);
	List<Map<String,Object>> searchCategory(SqlSessionTemplate session, int cPage,int numPerPage,Map<String,Object> map);
	int countSearchCategory(SqlSessionTemplate session, Map<String,Object> map);
	int insertQna(SqlSessionTemplate session, Map map);
	List<ProductQna> selectProductQna(SqlSessionTemplate session, int no,int cPage,int numPerPage);
	int countQna(SqlSessionTemplate session);
	ProductQna selectQnaCheck(SqlSessionTemplate session, int no);
}

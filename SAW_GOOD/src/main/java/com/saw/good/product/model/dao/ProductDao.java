package com.saw.good.product.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.saw.good.product.model.vo.Product;
import com.saw.good.product.model.vo.ProductQna;
import com.saw.good.product.model.vo.ProductReview;

public interface ProductDao {
	
	List<Map<String, String>> selectProduct(SqlSessionTemplate session, int cPage, int numPerPage);
	List<Map<String, String>> selectStar(SqlSessionTemplate session);
	int countProduct(SqlSessionTemplate session);
	Product selectProductView(SqlSessionTemplate session, int no);
	List<Map<String,String>> searchProduct(SqlSessionTemplate session,int cPage,int numPerPage,Map<String,String> map);
	int countSearchProduct(SqlSessionTemplate session,Map<String,String> map);
	List<Map<String,Object>> searchCategory(SqlSessionTemplate session, int cPage,int numPerPage,Map<String,Object> map);
	int countSearchCategory(SqlSessionTemplate session, Map<String,Object> map);
	int insertQna(SqlSessionTemplate session, Map map);
	int insertReplyQna(SqlSessionTemplate session, Map map);
	List<ProductQna> selectProductQna(SqlSessionTemplate session, int no,int cPage,int numPerPage);
	List<ProductReview> selectProductReview(SqlSessionTemplate session, int no,int cPage,int numPerPage);
	int countQna(SqlSessionTemplate session, int no);
	int countReview(SqlSessionTemplate session, int no);
	ProductQna selectQnaCheck(SqlSessionTemplate session, int no);
	int insertReview(SqlSessionTemplate session, Map map);
	int countFive(SqlSessionTemplate session, int no);
	int countFour(SqlSessionTemplate session, int no);
	int countThree(SqlSessionTemplate session, int no);
	int countTwo(SqlSessionTemplate session, int no);
	int countOne(SqlSessionTemplate session, int no);
	void updateReadCount(SqlSessionTemplate session, int no);
}

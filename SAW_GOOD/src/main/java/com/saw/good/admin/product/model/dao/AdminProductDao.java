package com.saw.good.admin.product.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.saw.good.admin.home.AdminProduct;

public interface AdminProductDao {
	//상품리스트 불러오기
	List<Map<String,String>> selectProduct(SqlSession session,int cPage,int numPerPage);
	int countProduct(SqlSession session);
	//상품 업데이트
	Map<String,String> oneProduct(SqlSession session,int productno);
	//상품삭제
	int deleteProduct(SqlSession session,int productno);
	//선택삭제
	int checkDelete(SqlSession session,AdminProduct a);
	//상품검색
	List<Map<String,String>> searchProduct(SqlSession session,int cPage, int numPerPage, AdminProduct a);
	int countSearchProduct(SqlSession session,AdminProduct a);
}

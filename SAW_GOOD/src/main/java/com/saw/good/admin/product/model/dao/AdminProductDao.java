package com.saw.good.admin.product.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.saw.good.admin.home.AdminProduct;
import com.saw.good.product.model.vo.DetailImg;
import com.saw.good.product.model.vo.PageDetailImg;
import com.saw.good.product.model.vo.Product;

public interface AdminProductDao {
	//상품리스트 불러오기
	List<Map<String,String>> selectProduct(SqlSession session,int cPage,int numPerPage);
	int countProduct(SqlSession session);
	//상품 업데이트
	Product oneProduct(SqlSession session,int productno);
	List<DetailImg> selectDetailImg(SqlSession session,int productno);
	List<PageDetailImg> selectPageImg(SqlSession session,int productno);
	//상품삭제
	int deleteProduct(SqlSession session,int productno);
	//선택삭제
	int checkDelete(SqlSession session,AdminProduct a);
	//상품검색
	List<Map<String,String>> searchProduct(SqlSession session,int cPage, int numPerPage, AdminProduct a);
	int countSearchProduct(SqlSession session,AdminProduct a);
	
	//상품등록
	int insertProduct(SqlSession session,Product p);
	//상품상세이미지등록및 수정
	int insertDetailImg(SqlSession session,DetailImg di);
	//상품상제페이지 이미지 등록및수정
	int insertPageDetailImg(SqlSession session,PageDetailImg pdi);
	
	//상품 내용 수정
	int updateProduct(SqlSession session,Product p);
	//상품 상세이미지 수정
	int deleteDetailImg(SqlSession session,int productNo);
	//상품상세페이지 이미지 수정
	int deletePageDetailImg(SqlSession session,int productNo);
}

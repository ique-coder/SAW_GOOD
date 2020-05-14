package com.saw.good.admin.product.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.saw.good.admin.home.AdminProduct;
import com.saw.good.product.model.vo.DetailImg;
import com.saw.good.product.model.vo.PageDetailImg;
import com.saw.good.product.model.vo.Product;

@Repository
public class AdminProductDaoImpl implements AdminProductDao {
	
	//상품목록 불러오기
	@Override
	public List<Map<String, String>> selectProduct(SqlSession session,int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("product.selectProduct", null, rb );
	}

	@Override
	public int countProduct(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("product.countProduct");
	}

	//상품수정 페이지이동
	@Override
	public Product oneProduct(SqlSession session, int productno) {
		// TODO Auto-generated method stub
		return session.selectOne("product.oneProduct", productno);
	}
	
	@Override
	public List<DetailImg> selectDetailImg(SqlSession session, int productno) {
		// TODO Auto-generated method stub
		return session.selectList("product.selectDetailImg", productno);
	}

	@Override
	public List<PageDetailImg> selectPageImg(SqlSession session, int productno) {
		// TODO Auto-generated method stub
		return session.selectList("product.selectPageImg", productno);
	}

	//상품삭제
	@Override
	public int deleteProduct(SqlSession session, int productno) {
		// TODO Auto-generated method stub
		return session.update("product.deleteProduct", productno);
	}

	//선택삭제
	@Override
	public int checkDelete(SqlSession session, AdminProduct a) {
		// TODO Auto-generated method stub
		return session.update("product.checkDelete", a);
	}
	//상품검색
	@Override
	public List<Map<String, String>> searchProduct(SqlSession session, int cPage, int numPerPage,AdminProduct a) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("product.searchProduct", a, rb);
	}

	@Override
	public int countSearchProduct(SqlSession session, AdminProduct a) {
		// TODO Auto-generated method stub
		return session.selectOne("product.countSearchProduct", a);
	}
	//상품등록
	@Override
	public int insertProduct(SqlSession session,Product p) {
		// TODO Auto-generated method stub
		return session.insert("product.insertProduct",p);
	}
	
	//상품상세이미지 등록 및 수정
	@Override
	public int insertDetailImg(SqlSession session,DetailImg di) {
		return session.insert("product.insertDetailImg",di);
	}

	//상품상세페이지 이미지 등록 및 수정
	@Override
	public int insertPageDetailImg(SqlSession session,PageDetailImg pdi) {
		// TODO Auto-generated method stub
		return session.insert("product.insertPageDetailImg",pdi);
	}

	//상품내용 수정
	@Override
	public int updateProduct(SqlSession session, Product p) {
		// TODO Auto-generated method stub
		return session.update("product.updateProduct",p);
	}


	//상품상제이미지 수정
	@Override
	public int deleteDetailImg(SqlSession session, int productNo) {
		// TODO Auto-generated method stub
		return session.delete("product.deleteDetailImg", productNo);
	}

	//상품상세페이지 이미지 수정
	@Override
	public int deletePageDetailImg(SqlSession session, int productNo) {
		// TODO Auto-generated method stub
		return session.delete("product.deletePageDetailImg", productNo);
	}

	
	
	
	
	
	
}

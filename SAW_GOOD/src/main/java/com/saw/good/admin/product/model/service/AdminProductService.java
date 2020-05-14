package com.saw.good.admin.product.model.service;

import java.util.List;
import java.util.Map;

import com.saw.good.admin.home.AdminProduct;
import com.saw.good.product.model.vo.DetailImg;
import com.saw.good.product.model.vo.PageDetailImg;
import com.saw.good.product.model.vo.Product;

public interface AdminProductService {
	//상품목록 불러오기
	List<Map<String,String>> selectProduct(int cPage,int numPerPage);
	int countProduct();
	//수정페이지 이동
	Product oneProduct(int productno);
	//수정상품이미지 불러오기
	List<DetailImg> selectDetailImg(int productno);
	List<PageDetailImg> selectPageImg(int productno);
	//상품삭제
	int deleteProduct(int productno);
	//선택삭제
	int checkDelete(AdminProduct a);
	
	//상품검색
	List<Map<String,String>> searchProduct(int cPage,int numPerPage,AdminProduct a);
	int countSearchProduct(AdminProduct a);
	//상품등록
	int insertProduct(Product p,List<DetailImg> diList,List<PageDetailImg> pdiList);
	//상품업데이트
	int updateProduct(Product p,List<DetailImg> diList,List<PageDetailImg> pdiList);
	
}

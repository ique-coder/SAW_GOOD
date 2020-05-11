package com.saw.good.admin.product.model.service;

import java.util.List;
import java.util.Map;

import com.saw.good.admin.home.AdminProduct;

public interface AdminProductService {
	//상품목록 불러오기
	List<Map<String,String>> selectProduct(int cPage,int numPerPage);
	int countProduct();
	//수정페이지 이동
	Map<String,String> oneProduct(int productno);
	//상품삭제
	int deleteProduct(int productno);
	//선택삭제
	int checkDelete(AdminProduct a);
}

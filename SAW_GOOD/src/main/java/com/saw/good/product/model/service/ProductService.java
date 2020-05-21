package com.saw.good.product.model.service;

import java.util.List;
import java.util.Map;

import com.saw.good.product.model.vo.Product;
import com.saw.good.product.model.vo.ProductQna;
import com.saw.good.product.model.vo.ProductReview;

public interface ProductService {
	
	List<Map<String,String>> selectProduct(int cPage, int numPerPage);
	int countProduct();
	Product selectProductView(int no);
	List<Map<String,String>> searchProduct(int cPage,int numPerPage,Map<String,String> map);
	int countSearchProduct(Map<String,String> map);
	List<Map<String,Object>> searchCategory(int cPage,int numPerPage,Map<String,Object> map);
	int countSearchCategory(Map<String,Object> map);
	int insertQna(Map map);
	int insertReplyQna(Map map);
	List<ProductQna> selectProductQna(int no,int cPage,int numPerPage);
	List<ProductReview> selectProductReview(int no,int cPage,int numPerPage);
	int countQna(int no);
	int countReview(int no);
	ProductQna selectQnaCheck(int no);
	int insertReview(Map map);
	int countFive(int no);
	int countFour(int no);
	int countThree(int no);
	int countTwo(int no);
	int countOne(int no);
}

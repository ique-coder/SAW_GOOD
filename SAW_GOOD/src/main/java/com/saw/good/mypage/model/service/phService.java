package com.saw.good.mypage.model.service;

import java.util.List;
import java.util.Map;

public interface phService {

	List<Map<String,String>> product(String userId);
	
	List<Map<String,String>> auction(String userId);
	List<Map<String,String>> funding(String userId);
	
	int buyOk(Map<String, Object> map);
	int status(Map<String, Object> map);

	
	int extend(Map<String, Object> map);
}

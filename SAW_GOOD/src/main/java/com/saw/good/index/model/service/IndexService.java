package com.saw.good.index.model.service;

import java.util.List;
import java.util.Map;

public interface IndexService {

	List<Map<String, String>> newProduct();
	List<Map<String, String>> newFunding();
	List<Map<String, String>> newAuction();
	
}

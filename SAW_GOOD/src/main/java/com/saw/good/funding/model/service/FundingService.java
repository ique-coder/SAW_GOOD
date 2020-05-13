package com.saw.good.funding.model.service;

import java.util.List;

import com.saw.good.funding.model.vo.Funding;

public interface FundingService {

	
	List<Funding> selectList(int numPerPage);

	Funding selectItem(int fdNo);

}

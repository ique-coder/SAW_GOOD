package com.saw.good.funding.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saw.good.funding.model.dao.FundingDao;
import com.saw.good.funding.model.vo.Funding;

@Service
public class FundingServiceImpl implements FundingService{

	@Autowired
	SqlSession session;
	
	@Autowired
	FundingDao dao;
	
	
	@Override
	public List<Funding> selectList(int numPerPage) {
		
		return dao.selectList(session,numPerPage);
	}


	@Override
	public Funding selectItem(int fdNo) {
		
		return dao.selectItem(session,fdNo);
	}

	
}

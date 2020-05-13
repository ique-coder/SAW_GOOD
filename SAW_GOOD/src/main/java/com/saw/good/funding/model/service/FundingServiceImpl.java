package com.saw.good.funding.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saw.good.funding.model.dao.FundingDao;
import com.saw.good.funding.model.vo.FDMember;
import com.saw.good.funding.model.vo.Funding;

@Service
public class FundingServiceImpl implements FundingService{

	@Autowired
	SqlSession session;
	
	@Autowired
	FundingDao dao;
	
	
	
	@Override
	public List<Funding> selectHighList(int high) {
		// TODO Auto-generated method stub
		return dao.selectHighList(session,high);
	}


	@Override
	public List<Funding> selectList(int numPerPage) {
		
		return dao.selectList(session,numPerPage);
	}


	@Override
	public Funding selectItem(int fdNo) {
		
		return dao.selectItem(session,fdNo);
	}


	@Override
	public List<FDMember> selectMemberList(int fdNo) {
		// TODO Auto-generated method stub
		return dao.selectMemberList(session,fdNo);
	}

	@Override
	public Map<String, Integer> selectPriceCount(int fdNo) {
		// TODO Auto-generated method stub
		return dao.selectPriceCount(session,fdNo);
	}
	
	
	
}

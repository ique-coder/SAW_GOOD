package com.saw.good.admin.funding.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saw.good.admin.funding.model.dao.AdminFundingDao;

@Service
public class AdminFundingServiceImpl implements AdminFundingService {

	@Autowired
	private AdminFundingDao dao;
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<Map<String, String>> selectFundingDisAgree(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectFundingDisAgree(session,cPage,numPerPage);
	}

	@Override
	public List<Map<String, String>> selectFundingAgree(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectFundingAgree(session,cPage,numPerPage);
	}

	@Override
	public int countFundingDisAgree() {
		// TODO Auto-generated method stub
		return dao.countFundingDisAgree(session);
	}

	@Override
	public int countFundingAgree() {
		// TODO Auto-generated method stub
		return dao.countFundingAgree(session);
	}

	@Override
	public List<Map<String,String>> sumPartPrice() {
		// TODO Auto-generated method stub
		return dao.sumPartPrice(session);
	}
	
	
	
}

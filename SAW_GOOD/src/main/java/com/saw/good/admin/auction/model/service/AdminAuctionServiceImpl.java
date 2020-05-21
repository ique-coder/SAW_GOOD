package com.saw.good.admin.auction.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saw.good.admin.auction.model.dao.AdminAuctionDao;

@Service
public class AdminAuctionServiceImpl implements AdminAuctionService {
	
	@Autowired
	private AdminAuctionDao dao;

	@Autowired
	private SqlSession session;
	
	//옥션뷰
	@Override
	public Map<String,String> selectOneAuction(int acno) {
		// TODO Auto-generated method stub
		return dao.selectOneAuction(session, acno);
	}
	//동의리스트
	@Override
	public List<Map<String, String>> selectAuctionAgree(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectAuctionAgree(session, cPage, numPerPage);
	}

	@Override
	public int countAuctionAgree() {
		// TODO Auto-generated method stub
		return dao.countAuctionAgree(session);
	}

	//옥션 비동의 리스트
	@Override
	public List<Map<String, String>> selectAuctionDisAgree(int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectAuctionDisAgree(session,cPage,numPerPage);
	}


	@Override
	public int countAuctionDisAgree() {
		// TODO Auto-generated method stub
		return dao.countAuctionDisAgree(session);
	}

	//비동의 옥션 검색
	@Override
	public List<Map<String, String>> selectDisAgreeSearch(Map<String, Object> map,int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectDisAgreeSearch(session,map,cPage,numPerPage);
	}

	@Override
	public int countDisAgreeSearch(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.countDisAgreeSearch(session,map);
	}

	//승인 및 거부
	@Override
	public int updateAgreeOneAuction(int acno) {
		// TODO Auto-generated method stub
		return dao.updateAgreeOneAuction(session, acno);
	}

	@Override
	public int updateDisagreeOneAuction(int acno) {
		// TODO Auto-generated method stub
		return dao.updateDisagreeOneAuction(session, acno);
	}

	//체크 승인 및 거부
	@Override
	public int updateCheckAgreeAuc(String[] aucCheck) throws RuntimeException{
		// TODO Auto-generated method stub
		int result=0;
		
		for(String s : aucCheck) {
			result=dao.updateCheckAgreeAuc(session,s);
			if(result==0) {
				throw new RuntimeException();
			}
		}
		
		return result;
	}

	@Override
	public int updateCheckDisagreeAuc(String[] aucCheck) throws RuntimeException {
		// TODO Auto-generated method stub
		int result=0;
		
		for(String s : aucCheck) {
			result=dao.updateCheckDisagreeAuc(session,s);
			if(result==0) {
				throw new RuntimeException();
			}
		}
		
		return result;
	}
	
	
	
	
	
}

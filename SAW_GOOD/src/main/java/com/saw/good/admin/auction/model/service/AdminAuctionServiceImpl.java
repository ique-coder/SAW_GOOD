package com.saw.good.admin.auction.model.service;

import java.util.HashMap;
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
	//서브이지미
	@Override
	public List<Map<String, String>> selectAuctionImg(int acno) {
		// TODO Auto-generated method stub
		return dao.selectAuctionImg(session, acno);
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
	//옥션 동의 검색

	@Override
	public List<Map<String, String>> selectAgreeSearch(Map<String, Object> map, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectAgreeSearch(session,map, cPage, numPerPage);
	}
	@Override
	public int countAgreeSearch(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.countAgreeSearch(session,map);
	}
	
	//옥션 완료 삭제
	@Override
	public int deleteFnOneAgAuction(int acno) throws RuntimeException {
		// TODO Auto-generated method stub
		int result=0;
		result=dao.deleteFnOneAgAuction(session,acno);
		if(result==0) {
			throw new RuntimeException();
		}
		
		return result;
	}
	//옥션 진행중 환불 및 삭제
	@Override
	public int deleteIngOneAgAuction(int acno) throws RuntimeException {
		// TODO Auto-generated method stub
		int result=0;
		//가장 높은 금액의 멤버와 금액 가져오기
		Map<String,String> map=dao.selectMaxPriceMember(session,acno);
		if(map != null) {
			result=dao.updateRefundPoint(session,map);
			if(result==0) {
				throw new RuntimeException();
			}
		}
		result=dao.deleteIngOneAgAuction(session,acno);
		if(result==0) {
			throw new RuntimeException();
		}
		

		return result;
	}
	
	//옥션완료 선택삭제
	@Override
	public int deleteFnCkAuction(String[] aucCheck) throws RuntimeException{
		// TODO Auto-generated method stub
		int result=0;
		
		for(String s:aucCheck) {
			result=dao.deleteFnCkAuction(session,s);
			if(result==0) {
				throw new RuntimeException();
			}
		}
		
		return result;
	}
	//옥션 진행중 선택 삭제 및 환불
	@Override
	public int deleteIngCkAuction(String[] aucCheck) throws RuntimeException{
		// TODO Auto-generated method stub
		int result=0;
		
		for(String s : aucCheck) {
			Map<String,String> map=dao.selectMaxPriceMem(session,s);
			if(map != null) {
				result=dao.updateRefundPoint(session,map);
				if(result==0) {
					throw new RuntimeException();
				}
			}
			result=dao.deleteIngCkAuction(session,s);
			if(result==0) {
				throw new RuntimeException();
			}
		}
		
		return result;
	}
	//옥션 한개 입찰확정
	@Override
	public int updateDecideAuction(String acno) throws RuntimeException {
		// TODO Auto-generated method stub
		int result=0;
		Map<String,String> map=new HashMap();
		map.put("acno",acno);
		result=dao.updateSalePoint(session,map);
		if(result==0) {
			throw new RuntimeException();
		}
		result=dao.updateDecideAuction(session,acno);
		if(result==0) {
			throw new RuntimeException();
		}
		
		return result;
	}
	
	//선택한 경매 입찰확정
	@Override
	public int updateCkDecideAuc(String[] aucCheck) throws RuntimeException{
		// TODO Auto-generated method stub
		int result=0;
		Map<String,String> map=new HashMap();
		for(String s : aucCheck) {
			map.put("acno", s);
			result=dao.updateSalePoint(session,map);
			if(result==0) {
				throw new RuntimeException();
			}
			result=dao.updateDecideAuction(session,s);
			if(result==0) {
				throw new RuntimeException();
			}
			map.remove("acno");
		}
		
		return result;
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
	public int updateAgreeOneAuction(int acno) throws RuntimeException {
		// TODO Auto-generated method stub
		int result=0;
		result=dao.updateAgreeOneAuction(session, acno);
		
		if(result==0) {
			throw new RuntimeException();
		}
		return result;
	}

	@Override
	public int updateDisagreeOneAuction(int acno) throws RuntimeException{
		// TODO Auto-generated method stub
		int result=0;
		result= dao.updateDisagreeOneAuction(session, acno);
		
		if(result==0) {
			throw new RuntimeException();
		}
		return result;
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

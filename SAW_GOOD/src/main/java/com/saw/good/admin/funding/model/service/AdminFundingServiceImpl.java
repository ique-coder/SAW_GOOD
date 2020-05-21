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
	
	//비동의 펀딩 리스트 가져오기
	@Override
	public List<Map<String, String>> selectFundingDisAgree(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectFundingDisAgree(session,cPage,numPerPage);
	}
	
	@Override
	public int countFundingDisAgree() {
		// TODO Auto-generated method stub
		return dao.countFundingDisAgree(session);
	}
	
	//동의 리스트 가져오기
	@Override
	public List<Map<String, String>> selectFundingAgree(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectFundingAgree(session,cPage,numPerPage);
	}

	
	@Override
	public int countFundingAgree() {
		// TODO Auto-generated method stub
		return dao.countFundingAgree(session);
	}
	
	//목표금액에 도달했는지 확인하기위해 참여인원 총 합산금액 가져오기
	@Override
	public List<Map<String,String>> sumPartPrice() {
		// TODO Auto-generated method stub
		return dao.sumPartPrice(session);
	}
	
	@Override
	public Map<String, String> sumPartPrice(int fdno) {
		// TODO Auto-generated method stub
		return dao.sumPartPrice(session, fdno);
	}

	//비동의 펀딩 검색
	@Override
	public List<Map<String, String>> searchFundingDAg(int cPage, int numPerPage, Map<String,String> map) {
		// TODO Auto-generated method stub
		return dao.searchFundingDAg(session,cPage,numPerPage,map);
	}

	@Override
	public int countsearchFundingDAg(Map<String,String> map) {
		// TODO Auto-generated method stub
		return dao.countsearchFundingDAg(session,map);
	}
	//동의펀딩 검색 및 페이징처리

	@Override
	public List<Map<String, String>> fundingAgreeSearch(Map<String, Object> map, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.fundingAgreeSearch(session, map, cPage, numPerPage);
	}

	@Override
	public int countsearchFundingAg(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.countsearchFundingAg(session, map);
	}
	//동의 거부
	@Override
	public int updateAgreeFunding(int fdno) {
		// TODO Auto-generated method stub
		return dao.updateAgreeFunding(session,fdno);
	}
	
	@Override
	public int updateDisAgreeFunding(int fdno) {
		// TODO Auto-generated method stub
		return dao.updateDisAgreeFunding(session,fdno);
	}

	//선택 동의 거부
	@Override
	public int updateCheckAgree(Map<String,Object> map) {
		// TODO Auto-generated method stub
		return dao.updateCheckAgree(session,map);
	}

	@Override
	public int updateCheckDisAgree(Map<String,Object> map) {
		// TODO Auto-generated method stub
		return dao.updateCheckDisAgree(session,map);
	}

	//펀딩보기
	@Override
	public Map<String, String> selectOneFunding(int fdno) {
		// TODO Auto-generated method stub
		return dao.selectOneFunding(session, fdno);
	}

	@Override
	public List<Map<String, String>> selectSubImg(int fdno) {
		// TODO Auto-generated method stub
		return dao.selectSubImg(session, fdno);
	}

	//한개펀딩 환불하기
	@Override
	public int updateRefundOneFund(int fdno){
		// TODO Auto-generated method stub
		int result=0;
		result=dao.updateRefundOneFund(session,fdno);
		result=dao.updateOneFund(session,fdno);
		
		return result;
	}
	
	//여러개 펀딩 활불
	@Override
	public int updateRefundCkfund(String[] fundcheck){
		// TODO Auto-generated method stub
		int result=0;

		for(String s : fundcheck) {
			result=dao.updateRefundCkFund(session,s);
		}
		for(String s : fundcheck) {
			result=dao.updateCkFund(session,s);
		}

		return result;
	}
	
	//여러개 체크된 완료펀딩 삭제
	@Override
	public int deleteCkFund(String[] fundcheck) {
		// TODO Auto-generated method stub
		int result=0;
		
		for(String s: fundcheck) {
			result=dao.deleteCkFund(session,s);
		}
		
		return result;
	}

	//체크된 진행중 펀딩 환불 및 삭제
	@Override
	public int deleteCkIngFund(String[] fundcheck) {
		// TODO Auto-generated method stub
		
		int result=0;
		
		//환불
		for(String s:fundcheck) {
			result=dao.updateRefundCkFund(session,s);
		}
		//삭제
		for(String s:fundcheck) {
			result=dao.deleteCkFund(session,s);
		}
		
		return result;
	}
	


	
	
	
	
	
	
	
}

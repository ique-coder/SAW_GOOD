package com.saw.good.admin.funding.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class AdminFundingDaoImpl implements AdminFundingDao {
	
	//비동의 펀딩 리스트 가져오기
	@Override
	public List<Map<String, String>> selectFundingDisAgree(SqlSession session, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rowBounds=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("adFunding.selectFundingDisAgree",null,rowBounds);
	}
	
	@Override
	public int countFundingDisAgree(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("adFunding.countFundingDisAgree");
	}
	//동의 펀딩 리스트 가져오기
	@Override
	public List<Map<String, String>> selectFundingAgree(SqlSession session, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rowBounds=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("adFunding.selectFundingAgree",null,rowBounds);
	}

	@Override
	public int countFundingAgree(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("adFunding.countFundingAgree");
	}
	//목표금액에 도달했는지 확인하기위해 참여인원 총 금액 가져오기
	@Override
	public List<Map<String,String>> sumPartPrice(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("adFunding.sumPartPrice");
	}

	@Override
	public Map<String, String> sumPartPrice(SqlSession session, int fdno) {
		// TODO Auto-generated method stub
		return session.selectOne("adFunding.sumPartPriceOne",fdno);
	}
	//비동의 펀딩 검색
	@Override
	public List<Map<String, String>> searchFundingDAg(SqlSession session, int cPage, int numPerPage, Map<String,String> map) {
		// TODO Auto-generated method stub
		RowBounds rowBounds=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("adFunding.searchFundingDAg",map,rowBounds);
	}

	@Override
	public int countsearchFundingDAg(SqlSession session,Map<String,String> map) {
		// TODO Auto-generated method stub
		return session.selectOne("adFunding.countsearchFundingDAg", map);
	}
	////동의 펀딩 검색 및 페이징처리
	@Override
	public List<Map<String, String>> fundingAgreeSearch(SqlSession session, Map<String, Object> map, int cPage,
			int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rowBounds=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("adFunding.fundingAgreeSearch", map, rowBounds);
	}

	@Override
	public int countsearchFundingAg(SqlSession session, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.selectOne("adFunding.countsearchFundingAg", map);
	}

	//동의 거부
	@Override
	public int updateAgreeFunding(SqlSession session, int fdno) {
		// TODO Auto-generated method stub
		return session.update("adFunding.updateAgreeFunding", fdno);
	}

	@Override
	public int updateDisAgreeFunding(SqlSession session, int fdno) {
		// TODO Auto-generated method stub
		return session.update("adFunding.updateDisAgreeFunding", fdno);
	}
	//선택동의 거부
	@Override
	public int updateCheckAgree(SqlSession session, Map<String,Object> map) {
		// TODO Auto-generated method stub
		return session.update("adFunding.updateCheckAgree", map);
	}

	@Override
	public int updateCheckDisAgree(SqlSession session, Map<String,Object> map) {
		// TODO Auto-generated method stub
		return session.update("adFunding.updateCheckDisAgree", map);
	}
	//펀딩 보기
	@Override
	public Map<String, String> selectOneFunding(SqlSession session, int fdno) {
		// TODO Auto-generated method stub
		return session.selectOne("adFunding.selectOneFunding", fdno);
	}

	@Override
	public List<Map<String, String>> selectSubImg(SqlSession session, int fdno) {
		// TODO Auto-generated method stub
		return session.selectList("adFunding.selectSubImg", fdno);
	}
		
}

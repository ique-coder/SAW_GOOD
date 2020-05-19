package com.saw.good.admin.funding.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class AdminFundingDaoImpl implements AdminFundingDao {

	@Override
	public List<Map<String, String>> selectFundingDisAgree(SqlSession session, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rowBounds=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("adFunding.selectFundingDisAgree",null,rowBounds);
	}

	@Override
	public List<Map<String, String>> selectFundingAgree(SqlSession session, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rowBounds=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("adFunding.selectFundingAgree",null,rowBounds);
	}

	@Override
	public int countFundingDisAgree(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("adFunding.countFundingDisAgree");
	}

	@Override
	public int countFundingAgree(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("adFunding.countFundingAgree");
	}

	@Override
	public List<Map<String,String>> sumPartPrice(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("adFunding.sumPartPrice");
	}
	
	
	
}

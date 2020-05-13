package com.saw.good.funding.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.saw.good.funding.model.vo.FDMember;
import com.saw.good.funding.model.vo.Funding;

@Repository
public class FundingDaoImpl implements FundingDao{

	
	
	@Override
	public List<Funding> selectHighList(SqlSession session, int high) {
		// TODO Auto-generated method stub
		return session.selectList("funding.selectHighList",high);
	}

	@Override
	public List<Funding> selectList(SqlSession session,int numPerPage) {
		
		return session.selectList("funding.selectAllList",numPerPage);
	}

	@Override
	public Funding selectItem(SqlSession session, int fdNo) {
	
		return session.selectOne("funding.selectItem", fdNo);
	}

	@Override
	public List<FDMember> selectMemberList(SqlSession session, int fdNo) {
		// TODO Auto-generated method stub
		return session.selectList("funding.selectMemberList",fdNo);
	}


	@Override
	public Map<String, Integer> selectPriceCount(SqlSession session, int fdNo) {
		// TODO Auto-generated method stub
		return session.selectOne("funding.selectPriceCount",fdNo);
	}
	
	
	
}

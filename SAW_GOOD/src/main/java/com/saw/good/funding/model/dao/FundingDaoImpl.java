package com.saw.good.funding.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.saw.good.funding.model.vo.Funding;

@Repository
public class FundingDaoImpl implements FundingDao{

	@Override
	public List<Funding> selectList(SqlSession session,int numPerPage) {
		
		return session.selectList("funding.selectAllList",numPerPage);
	}

	
}

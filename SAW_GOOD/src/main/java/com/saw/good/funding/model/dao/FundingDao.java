package com.saw.good.funding.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.saw.good.funding.model.vo.Funding;

public interface FundingDao {

	List<Funding> selectList(SqlSession session, int numPerPage);

	Funding selectItem(SqlSession session, int fdNo);

}

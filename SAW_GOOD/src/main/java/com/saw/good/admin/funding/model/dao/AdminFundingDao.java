package com.saw.good.admin.funding.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public interface AdminFundingDao {
	List<Map<String,String>> selectFundingDisAgree(SqlSession session,int cPage,int numPerPage);
	List<Map<String,String>> selectFundingAgree(SqlSession session,int cPage,int numPerPage);
	int countFundingDisAgree(SqlSession session);
	int countFundingAgree(SqlSession session);
	List<Map<String,String>> sumPartPrice(SqlSession session);
}

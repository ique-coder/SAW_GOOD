package com.saw.good.funding.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.saw.good.funding.model.vo.FDMember;
import com.saw.good.funding.model.vo.FDReword;
import com.saw.good.funding.model.vo.FDSubImg;
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

	@Override
	public List<FDReword> selectRewordList(SqlSession session, int fdNo) {
		// TODO Auto-generated method stub
		return session.selectList("funding.selectRewordList", fdNo);
	}

	@Override
	public int insertFDMember(SqlSession session, FDMember m) {
		// TODO Auto-generated method stub
		return session.insert("funding.insertFDMember",m);
	}

	@Override
	public List<FDMember> selectFDMemberList(SqlSession session, int fdNo, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return session.selectList("funding.selectFDMemberList", fdNo, new RowBounds((cPage-1)*numPerPage,numPerPage));
	}

	@Override
	public int selectFDMemberCount(SqlSession session, int fdNo) {
		// TODO Auto-generated method stub
		return session.selectOne("funding.selectFDMemberCount", fdNo);
	}

	@Override
	public int insertFunding(SqlSession session, Funding f) {
		// TODO Auto-generated method stub
		return session.insert("funding.insertFunding", f);
	}

	
	@Override
	public int insertFDSubImg(SqlSession session, FDSubImg fs) {
		// TODO Auto-generated method stub
		return session.insert("funding.insertFDSubImg",fs);
	}

	@Override
	public int deleteFunding(SqlSession session, int fdNo) {
		// TODO Auto-generated method stub
		return session.delete("funding.deleteFunding", fdNo);
	}

	@Override
	public int insertFDReword(SqlSession session, FDReword fr) {
		// TODO Auto-generated method stub
		return session.insert("funding.insertFDReword",fr);
	}
	
	
	
	
	
}

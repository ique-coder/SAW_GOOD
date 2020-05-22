package com.saw.good.admin.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.saw.good.member.model.vo.Member;

@Repository
public class AdminMemberDaoImpl implements AdminMemberDao{

	
	//멤버 페이징처리
	@Override
	public List<Member> selectMember(SqlSession session,int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("admember.selectMember", null, rb);
	}

	@Override
	public int countMember(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("admember.countMember");
	}
	
	//멤버삭제
	@Override
	public int deleteMember(SqlSession session, String id) {
		// TODO Auto-generated method stub
		return session.update("admember.deleteMember", id);
	}
	//선택삭제
	
	@Override
	public int checkdeleteMember(SqlSession session, List<String> mb) {
		// TODO Auto-generated method stub
		return session.update("admember.checkDelete", mb);
	}
	
	//서치멤버 페이징처리
	@Override
	public List<Member> searchMember(SqlSession session, int cPage, int numPerPage,
			Map<String, String> map) {
		// TODO Auto-generated method stub
		RowBounds rowBounds=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("admember.searchMember", map, rowBounds);
	}


	@Override
	public int countSearchMember(SqlSession session, Map<String, String> map) {
		// TODO Auto-generated method stub
		return session.selectOne("admember.countSearchMember", map);
	}
	
	
	
	

	
}

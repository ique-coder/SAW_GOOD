package com.saw.good.admin.member.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saw.good.admin.member.model.dao.AdminMemberDao;
import com.saw.good.member.model.vo.Member;

@Service
public class AdminMemberServiceImpl implements AdminMemberService{

	@Autowired
	private SqlSession session;
	
	@Autowired
	private AdminMemberDao dao;
	

	//멤버 페이징처리
	@Override
	public List<Member> selectMember(int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectMember(session,cPage,numPerPage);
	}

	@Override
	public int countMember() {
		// TODO Auto-generated method stub
		return dao.countMember(session);
	}

	//멤버삭제
	@Override
	public int deleteMember(String id) {
		// TODO Auto-generated method stub
		return dao.deleteMember(session,id);
	}
	//선택삭제
	
	@Override
	public int checkdeleteMember(List<String> mb) {
		// TODO Auto-generated method stub
		return dao.checkdeleteMember(session,mb);
	}
	
	//서치멤버 페이징처리
	@Override
	public List<Member> searchMember(int cPage, int numPerPage, Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.searchMember(session, cPage, numPerPage, map);
	}

	@Override
	public int countSearchMember(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.countSearchMember(session,map);
	}
	
	
	

	
	
}

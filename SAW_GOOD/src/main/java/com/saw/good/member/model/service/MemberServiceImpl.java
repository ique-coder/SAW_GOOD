package com.saw.good.member.model.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saw.good.member.model.dao.MemberDao;
import com.saw.good.member.model.vo.Member;
@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao dao;
	
	@Autowired
	SqlSessionTemplate session;

	@Override
	public Member selectId(String id) {
		Member m = dao.selectId(session,id);
		return m;
	}

	@Override
	public int insertMember(Member m) {
		
		return dao.insertMember(session,m);
	}

	@Override
	public int updateMember(String userId) {
		
		return dao.updateMember(session,userId);
	}

	@Override
	public Member loginMemberInfo(String userId) {
		
		return dao.loginMemberInfo(session, userId);
	}

	@Override
	public int updateMemberInfo(Member m) {
	
		return dao.updateMemberInfo(session,m);
	}

	@Override
	public int updatePassword(Member m) {
		return dao.updatePassword(session,m);
	}

	@Override
	public Member selectBusinessNumber(String bsNo) {
		Member m = dao.selectBusinessNumber(session,bsNo);
		return m;
	}

	@Override
	public int updateBsNo(Member m) {

		return dao.updateBsNo(session,m);
	}

	@Override
	public Member selectMember(Member m) {
		return dao.selectMember(session, m);
	}

	@Override
	public Member selectFindMember(Member m) {
		return dao.selectFindMember(session, m);
	}

	@Override
	public Member selectFindPw(Member m) {
		return dao.selectFindPw(session, m);
	}
	
	

	
	
}

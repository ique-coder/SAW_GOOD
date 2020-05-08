package com.saw.good.member.model.service;

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
		System.out.println("서비스");
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

	
	
}

package com.saw.good.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.saw.good.member.model.vo.Member;
@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public Member selectId(SqlSessionTemplate session, String id) {
		System.out.println("다오"+id);
		return session.selectOne("member.selectId",id);
	}
	
	@Override
	public int insertMember(SqlSessionTemplate session, Member m ) {
		
		return session.insert("member.insertMember", m);
	}

	@Override
	public int updateMember(SqlSessionTemplate session, String userId) {
		
		return session.update("member.accessMember", userId);
	}
	

}

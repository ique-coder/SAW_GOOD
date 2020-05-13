package com.saw.good.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.saw.good.member.model.vo.Member;

public interface MemberDao {

	Member selectId(SqlSessionTemplate session, String id);

	int insertMember(SqlSessionTemplate session, Member m);

	int updateMember(SqlSessionTemplate session, String userId);

	Member loginMemberInfo(SqlSessionTemplate session, String userId);
	
	int updateMemberInfo(SqlSessionTemplate session, Member m);
	
	int updatePassword(SqlSessionTemplate session, Member m);
	
	Member selectBusinessNumber(SqlSessionTemplate session, String bsNo);
	
	int updateBsNo(SqlSessionTemplate session, Member m);
	
	Member selectMember(SqlSessionTemplate session, Member m);
}

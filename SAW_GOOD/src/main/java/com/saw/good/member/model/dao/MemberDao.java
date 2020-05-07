package com.saw.good.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.saw.good.member.model.vo.Member;

public interface MemberDao {

	Member selectId(SqlSessionTemplate session, String id);

	int insertMember(SqlSessionTemplate session, Member m);

	
}

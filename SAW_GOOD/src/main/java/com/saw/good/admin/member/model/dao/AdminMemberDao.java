package com.saw.good.admin.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.saw.good.member.model.vo.Member;

public interface AdminMemberDao {

	//멤버 페이징처리
	List<Member> selectMember(SqlSession session,int cPage,int numPerPage);
	int countMember(SqlSession session);
	//멤버삭제
	int deleteMember(SqlSession session,String id);
	//선택삭제
	int checkdeleteMember(SqlSession session,List<String> mb);
	//서치멤버 페이징처리
	List<Member> searchMember(SqlSession session,int cPage,int numPerPage,Map<String,String> map);
	int countSearchMember(SqlSession session,Map<String,String> map);
}

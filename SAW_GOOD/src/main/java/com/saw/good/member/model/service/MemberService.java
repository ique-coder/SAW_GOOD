package com.saw.good.member.model.service;

import java.util.Map;

import com.saw.good.member.model.vo.Member;

public interface MemberService {

	
	Member selectId(String id);

	int insertMember(Member m);

	int updateMember(String userId);
	
	Member loginMemberInfo(String userId);
	
	int updateMemberInfo(Member m);
	
	int updatePassword(Member m);
	
	Member selectBusinessNumber(String bsNo);
	
	int updateBsNo(Member m);
	
	Member selectMember(Member m);
	
	Member selectFindMember(Member m);
	
	Member selectFindPw(Member m);
}

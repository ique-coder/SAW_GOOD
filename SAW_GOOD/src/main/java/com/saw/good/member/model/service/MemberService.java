package com.saw.good.member.model.service;

import com.saw.good.member.model.vo.Member;

public interface MemberService {

	
	Member selectId(String id);

	int insertMember(Member m);

}

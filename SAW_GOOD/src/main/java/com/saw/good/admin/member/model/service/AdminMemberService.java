package com.saw.good.admin.member.model.service;

import java.util.List;
import java.util.Map;

import com.saw.good.member.model.vo.Member;

public interface AdminMemberService {
	
	//페이징처리
	List<Member> selectMember(int cPage,int numPerPage);
	int countMember();
	//멤버삭제
	int deleteMember(String id);
	//선택삭제
	int checkdeleteMember(List<String> mb);
	//서치 페이징처리
	List<Member> searchMember(int cPage,int numPerPage,Map<String,String> map);
	int countSearchMember(Map<String,String> map);
	
}

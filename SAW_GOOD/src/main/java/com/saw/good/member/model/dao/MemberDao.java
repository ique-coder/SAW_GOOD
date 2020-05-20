package com.saw.good.member.model.dao;


import java.util.Map;


import org.mybatis.spring.SqlSessionTemplate;

import com.saw.good.auction.model.vo.Auction;
import com.saw.good.auction.model.vo.AuctionMember;
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
	
	Member selectFindMember(SqlSessionTemplate session, Member m);
	
	Member selectFindPw(SqlSessionTemplate session, Member m);
	//승원 옥션멤버포인트 돌려주기
	int updateMemPoint(SqlSessionTemplate session,AuctionMember am);
	//승원 옥션멤버포인트 가져오기
	int updateMemAPoint(SqlSessionTemplate session,AuctionMember am);
	
	//승원 옥션멤버포인트 가져오기
	int updateMemAPoint(SqlSessionTemplate session,Auction a);
}

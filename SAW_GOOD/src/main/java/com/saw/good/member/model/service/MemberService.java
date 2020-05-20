package com.saw.good.member.model.service;

<<<<<<< HEAD
import java.util.Map;

=======
import com.saw.good.auction.model.vo.Auction;
import com.saw.good.auction.model.vo.AuctionMember;
>>>>>>> branch 'master' of https://github.com/ique-coder/SAW_GOOD.git
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
	//옥션에서 포인트 돌려주는 로직
	int updateMemPoint(AuctionMember am);
	//옥션에서 포인트 가져오는 로직
	int updateMemAPoint(AuctionMember am);
	
	//옥션에서 포인트 가져오는 로직
	int updateMemAPoint(Auction a);
}

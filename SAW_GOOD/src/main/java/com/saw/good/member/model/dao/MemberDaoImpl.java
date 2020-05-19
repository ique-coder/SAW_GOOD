package com.saw.good.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.saw.good.auction.model.vo.Auction;
import com.saw.good.auction.model.vo.AuctionMember;
import com.saw.good.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public Member selectId(SqlSessionTemplate session, String id) {
		return session.selectOne("member.selectId", id);
	}

	@Override
	public int insertMember(SqlSessionTemplate session, Member m) {

		return session.insert("member.insertMember", m);
	}

	@Override
	public int updateMember(SqlSessionTemplate session, String userId) {

		return session.update("member.accessMember", userId);
	}

	@Override
	public Member loginMemberInfo(SqlSessionTemplate session, String userId) {
		// TODO Auto-generated method stub
		return session.selectOne("member.test", userId);
	}

	@Override
	public int updateMemberInfo(SqlSessionTemplate session, Member m) {
		// TODO Auto-generated method stub
		return session.update("member.updateMemberInfo", m);
	}

	@Override
	public int updatePassword(SqlSessionTemplate session, Member m) {
		// TODO Auto-generated method stub
		return session.update("member.updatePassword", m);
	}

	@Override
	public Member selectBusinessNumber(SqlSessionTemplate session, String bsNo) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectBsNum", bsNo);
	}

	@Override
	public int updateBsNo(SqlSessionTemplate session, Member m) {
		// TODO Auto-generated method stub
		return session.update("member.updateBsNo", m);
	}

	@Override
	public Member selectMember(SqlSessionTemplate session, Member m) {
		return session.selectOne("member.loginMember", m);
	}
	// 승원 옥션멤버포인트 돌려주기

	@Override
	public int updateMemPoint(SqlSessionTemplate session, AuctionMember am) {
		// TODO Auto-generated method stub
		return session.update("member.updateMemPoint", am);
	}
	// 승원 옥션멤버포인트 가져오기

	@Override
	public int updateMemAPoint(SqlSessionTemplate session, AuctionMember am) {
		// TODO Auto-generated method stub
		return session.update("member.updateMemAPoint", am);
	}

	@Override
	public int updateMemAPoint(SqlSessionTemplate session, Auction a) {
		// TODO Auto-generated method stub
		return session.update("member.updateMemAPoint2", a);
	}

}

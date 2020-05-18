package com.saw.good.funding.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saw.good.funding.model.dao.FundingDao;
import com.saw.good.funding.model.vo.FDMember;
import com.saw.good.funding.model.vo.FDReword;
import com.saw.good.funding.model.vo.FDSubImg;
import com.saw.good.funding.model.vo.Funding;

@Service
public class FundingServiceImpl implements FundingService{

	@Autowired
	SqlSession session;
	
	@Autowired
	FundingDao dao;
	
	
	
	@Override
	public List<Funding> selectHighList(int high) {
		// TODO Auto-generated method stub
		return dao.selectHighList(session,high);
	}


	@Override
	public List<Funding> selectList(int numPerPage) {
		
		return dao.selectList(session,numPerPage);
	}


	@Override
	public Funding selectItem(int fdNo) {
		
		return dao.selectItem(session,fdNo);
	}


	@Override
	public List<FDMember> selectMemberList(int fdNo) {
		// TODO Auto-generated method stub
		return dao.selectMemberList(session,fdNo);
	}

	@Override
	public Map<String, Integer> selectPriceCount(int fdNo) {
		// TODO Auto-generated method stub
		return dao.selectPriceCount(session,fdNo);
	}


	@Override
	public List<FDReword> selectRewordList(int fdNo) {
		// TODO Auto-generated method stub
		return dao.selectRewordList(session,fdNo);
	}


	@Override
	public int insertFDMember(FDMember m) {
		
		return dao.insertFDMember(session, m);
	}


	@Override
	public List<FDMember> selectFDMemberList(int fdNo, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectFDMemberList(session,fdNo,cPage,numPerPage);
	}


	@Override
	public int selectFDMemberCount(int fdNo) {
		// TODO Auto-generated method stub
		return dao.selectFDMemberCount(session,fdNo);
	}


	@Override
	public int insertFunding(Funding f,List<FDSubImg> fileNames,List<FDReword> rewordList) {
		
		int result = dao.insertFunding(session, f);
		if(result == 0) throw new RuntimeException();
		
		if(!fileNames.isEmpty()) {
			for(FDSubImg fs : fileNames) {
				fs.setFdNo(f.getFdNo());
				result = dao.insertFDSubImg(session,fs);
				if(result == 0 ) {
					//funding테이블의 글 지워주기
					int delete = dao.deleteFunding(session,f.getFdNo());
					throw new RuntimeException();//트랜잭션 처리 
					
					
				}else {
					for(FDReword fr : rewordList) {
						fr.setFdNo(f.getFdNo());
						result = dao.insertFDReword(session,fr);
						
					}
					if(result == 0 ) {
						throw new RuntimeException();//트랜잭션 처리 
					}
				}
			}
		}
		
		return result;
	}
	
	
	
	
	
}

package com.saw.good.funding.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saw.good.funding.model.dao.FundingDao;
import com.saw.good.funding.model.vo.Comment;
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
	public List<Funding> selectList(int cPage,int numPerPage) {
		
		return dao.selectList(session,cPage,numPerPage);
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
	public List<Comment> selectComment(int fdNo) {
		return dao.selectComment(session, fdNo);
	}


	@Override
	public List<Comment> selectReComment(int fdNo) {
		return dao.selectReComment(session, fdNo);
	}
	
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
	public int insertFunding(Funding f, List<FDSubImg> fileNames) {
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
						
				}
			}
		}
		
		return result;
	}




	@Override
	public List<Funding> selectCategoryList(Map map,int cPage, int numPerPage) {
		
		return dao.selectCategoryList(session,map,cPage, numPerPage);
	}


	@Override
	public List<Funding> selectList(int status,int cPage,int numPerPage) {
		
		return dao.selectList(session,status,cPage,numPerPage);
	}


	@Override
	public List<Funding> selectList(String keyword, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectList(session, keyword,cPage, numPerPage);
	}


	@Override
	public List<Funding> selectMypageFundingList(String userId,int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectMypageFundingList(session,userId, cPage, numPerPage);
		
	}


	@Override
	public int selectFundingCount(String userId) {
		// TODO Auto-generated method stub
		return dao.selectFundingCount(session,userId);
	}


	

	@Override
	public Funding selectItem(Funding funding) {
		// TODO Auto-generated method stub
		return dao.selectItem(session, funding);
	}


	@Override
	public List<FDSubImg> selectFDSubImg(int fdNo) {
		// TODO Auto-generated method stub
		return dao.selectFDSubImg(session,fdNo);
	}


	@Override
	public int updateFunding(Funding f) {
		// TODO Auto-generated method stub
		if(f.getEndDate()==null) {
			return dao.updateFunding(session,f);
		}else {
			return dao.updateFunding2(session,f);
		}
	}


	@Override
	public int updateFundingImg(Funding f) {
		// TODO Auto-generated method stub
		return dao.updateFundingImg(session,f);
	}


	@Override
	public int updateFundingSubImg(List<FDSubImg> subImglist) {
		// TODO Auto-generated method stub
		int result = 0;
		if(!subImglist.isEmpty()) {
			for(FDSubImg fs : subImglist) {
				result = dao.updateFDSubImg(session,fs);
			}
		}
		return result ;
	}


	@Override
	public int insertFDReword(List<FDReword> list) {
		// TODO Auto-generated method stub
		int result = 0;
		if(!list.isEmpty()) {
			for(FDReword r : list) {
				result = dao.insertFDReword(session,r);
			}
			if(result == 0)throw new RuntimeException();
		}
		return result ;
	}


	@Override
	public int updateFundingSize(Funding f) {
		// TODO Auto-generated method stub
		return dao.updateFundingSize(session,f);
	}


	@Override
	public int deleteFDReword(int fdNo) {
		// TODO Auto-generated method stub
		return dao.deleteFDReword(session,fdNo);
	}

	
	
	
	
}

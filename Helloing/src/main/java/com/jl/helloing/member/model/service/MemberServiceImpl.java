package com.jl.helloing.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jl.helloing.member.model.dao.MemberDao;
import com.jl.helloing.member.model.vo.Book;
import com.jl.helloing.member.model.vo.Expense;
import com.jl.helloing.member.model.vo.Member;
import com.jl.helloing.member.model.vo.Plan;
import com.jl.helloing.member.model.vo.Planner;
import com.jl.helloing.product.model.vo.Accomm;
import com.jl.helloing.product.model.vo.Activity;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 로그인
	@Override
	public Member loginMember(Member m) {
		return memberDao.loginMember(m, sqlSession);
	}
	
	// 회원가입
	@Override
	public int insertMember(Member m) {
		return memberDao.insertMember(m, sqlSession);
	}

	
	
	
	
	
	//혜진
	
	@Override
	public ArrayList<Book> selectScheduled(int memNo) {
		return null;
	}

	@Override
	public ArrayList<Book> selectLast(int memNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Book> selectCancelled(int memNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Book reservationDetail(int memNo, int orderNo) {
		// TODO Auto-generated method stub
		return null;
	}

	//비밀번호 체크
	@Override
	public String checkPwd(Member m) {
		return memberDao.checkPwd(m, sqlSession);
	}
	
	//비밀번호 변경
	@Override
	public int memberUpdatePwd(Member m) {
		return memberDao.memberUpdatePwd(m, sqlSession);
	}

	//회원 정보 수정
	@Override
	public int memberUpdate(Member m) {
		return memberDao.memberUpdate(m, sqlSession);
	}

	//찜한 숙소 리스트 조회
	@Override
	public ArrayList<Accomm> wishAccommList(int memNo) {
		return memberDao.wishAccommList(memNo, sqlSession);
	}

	@Override
	public ArrayList<Activity> wishActivityList(int memNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Planner> plannerList(int memNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Plan planDetailView(int memNo, int planNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Expense expenseView(int planNo) {
		// TODO Auto-generated method stub
		return null;
	}



}

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
	public ArrayList<Book> selectScheduled(int userNo) {
		return null;
	}

	@Override
	public ArrayList<Book> selectLast(int userNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Book> selectCancelled(int userNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Book reservationDetail(int userNo, int orderNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String checkPwd(Member m) {
		return memberDao.checkPwd(m, sqlSession);
	}
	
	@Override
	public int memberUpdatePwd(Member m) {
		return memberDao.memberUpdatePwd(m, sqlSession);
	}

	@Override
	public Member memberUpdateForm(int userNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int memberUpdate(Member m) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Accomm> wishAccommList(int userNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Activity> wishActivityList(int userNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Planner> plannerList(int userNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Plan planDetailView(int userNo, int planNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Expense expenseView(int planNo) {
		// TODO Auto-generated method stub
		return null;
	}



}

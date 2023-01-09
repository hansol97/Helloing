package com.jl.helloing.member.model.service;

import java.util.ArrayList;

import com.jl.helloing.member.model.vo.Book;
import com.jl.helloing.member.model.vo.Expense;
import com.jl.helloing.member.model.vo.Member;
import com.jl.helloing.member.model.vo.Plan;
import com.jl.helloing.member.model.vo.Planner;
import com.jl.helloing.product.model.vo.Accomm;
import com.jl.helloing.product.model.vo.Activity;

public interface MemberService {
	
	// 로그인 서비스(select)
	Member loginMember(Member m);
	
	// 회원가입 서비스(insert)
	int insertMember(Member m);
	
	
	//혜진
	//예정된 예약 리스트 조회
	ArrayList<Book> selectScheduled(int memNo);
	
	//지난 예약 리스트 조회
	ArrayList<Book> selectLast(int memNo);
	
	//취소된 예약 리스트 조회
	ArrayList<Book> selectCancelled(int memNo);
	
	//예약 상세조회
	Book reservationDetail(int memNo, int orderNo);

	//비밀번호확인
	String checkPwd(Member m);
	
	//비밀번호 변경
	int memberUpdatePwd(Member m);
	
	//회원 정보 수정
	int memberUpdate(Member m);
	
	//찜한 숙소 조회
	ArrayList<Accomm> wishAccommList(int memNo);
	
	//찜한 액티비티 조회
	ArrayList<Activity> wishActivityList(int memNo);
	
	//플래너리스트 조회 
	ArrayList<Planner> plannerList(int memNo);
	
	//플랜 상세 페이지
	Plan planDetailView(int memNo, int planNo);
	
	
	
	//가계부 페이지
	Expense expenseView(int planNo);
	

}

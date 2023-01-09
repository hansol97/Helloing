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
	ArrayList<Book> selectScheduled(int userNo);
	
	//지난 예약 리스트 조회
	ArrayList<Book> selectLast(int userNo);
	
	//취소된 예약 리스트 조회
	ArrayList<Book> selectCancelled(int userNo);
	
	//예약 상세조회
	Book reservationDetail(int userNo, int orderNo);

	//비밀번호확인
	String checkPwd(Member m);
	
	//회원정보 조회
	Member memberUpdateForm(int userNo);
	
	//회원 정보 수정
	int memberUpdate(Member m);
	
	//찜한 숙소 조회
	ArrayList<Accomm> wishAccommList(int userNo);
	
	//찜한 액티비티 조회
	ArrayList<Activity> wishActivityList(int userNo);
	
	//플래너리스트 조회 
	ArrayList<Planner> plannerList(int userNo);
	
	//플랜 상세 페이지
	Plan planDetailView(int userNo, int planNo);
	
	
	
	//가계부 페이지
	Expense expenseView(int planNo);
	

}

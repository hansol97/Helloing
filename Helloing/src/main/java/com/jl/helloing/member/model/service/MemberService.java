package com.jl.helloing.member.model.service;

import java.util.ArrayList;

import com.jl.helloing.member.model.vo.Book;
import com.jl.helloing.member.model.vo.Member;

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
	int checkPwd(Member m);
	
	//회원정보 조회
	Member memberUpdateForm(int userNo);
	
	//회원 정보 수정
	int memberUpdate(Member m);
	
	//찜한 숙소 조회
	ArrayList<Accomm> wishAccommList(int userNo);
	
	

}

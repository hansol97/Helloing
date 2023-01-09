package com.jl.helloing.member.model.service;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jl.helloing.member.model.vo.Member;

public interface MemberService {
	
	// 로그인 서비스(select)
	Member loginMember(Member m);
	
	// 회원가입 서비스(insert)
	int insertMember(Member m);
	
	
	//혜진
	//예정된 예약 리스트 조회
	//지난 예약 리스트 조회
	//취소된 예약 리스트 조회
	
}

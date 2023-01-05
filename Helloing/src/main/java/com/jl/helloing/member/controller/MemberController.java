package com.jl.helloing.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	//승준
	//로그인
	@RequestMapping("login")
	public String loginMember() {
		return "member/login";
	}
	//아이디찾기
	@RequestMapping("")
	
	//혜진
	//마이페이지 메인
	@RequestMapping("myPage.hj")
	public String myPage() {
		
		return "member/myPage";

	}
	
	
}

package com.jl.helloing.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@RequestMapping("login")
	public String loginMember() {
		return "member/login";
	}
	@RequestMapping("myPage.hj")
	public String myPage() {
		
		return "member/myPage";

	}
}

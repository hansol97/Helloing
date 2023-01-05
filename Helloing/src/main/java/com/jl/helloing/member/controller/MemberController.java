package com.jl.helloing.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
<<<<<<< HEAD
	
	@RequestMapping("login")
	public String loginMember() {
		return "member/login";
=======

	@RequestMapping("myPage.hj")
	public String myPage() {
		
		return "member/myPage";
>>>>>>> 5b4508cc72935f73218bb2efc1005e2774d103d7
	}
}

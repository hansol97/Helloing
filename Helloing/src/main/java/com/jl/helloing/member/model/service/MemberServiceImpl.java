package com.jl.helloing.member.model.service;

import org.springframework.stereotype.Service;

import com.jl.helloing.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	// 로그인
	@Override
	public Member loginMember(Member m) {
		
		return null;
	}
	
	// 회원가입
	@Override
	public int insertMember(Member m) {
		return 0;
	}

}

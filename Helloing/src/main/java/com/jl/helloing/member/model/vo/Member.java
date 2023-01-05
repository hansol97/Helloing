package com.jl.helloing.member.model.vo;

import lombok.Data;

@Data
public class Member {
	
	private int memNo; // 회원번호
	private String memId; // 회원아이디
	private String memPwd; // 비밀번호
	private String memName; // 이름
	private String email; // 이메일
	private String phone; // 핸드폰번호
	private String status; // 상태
	private String memEnrollDate; // 가입일자
	private int reportCount; // 신고횟수

}

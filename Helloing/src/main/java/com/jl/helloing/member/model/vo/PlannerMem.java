package com.jl.helloing.member.model.vo;

import lombok.Data;

@Data
public class PlannerMem {
	private int plannerNo; // 플래너번호
	private int memNo; // 회원번호
	
	
	//담기 위한 필드
	private String memId; //회원아이디
	
}

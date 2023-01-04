package com.jl.helloing.member.model.vo;

import lombok.Data;

@Data
public class Plan {
	private int planNo; // 일정번호
	private int plannerNo; // 플래너번호
	private String planName; // 일정명
	private String field; // 일정내용
	private String startTime; // 시작시간
	private String endTime; // 종료시간
	private String planCategory; // 카테고리
}

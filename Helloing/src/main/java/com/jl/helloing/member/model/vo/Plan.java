package com.jl.helloing.member.model.vo;

import lombok.Data;

@Data
public class Plan {
	private int planNo; // 일정번호
	private int plannerNo; // 플래너번호
	private String planName; // 일정명
	private String planContent; //일정설명
	private String startTime; // 시작시간
	private String endTime; // 종료시간
	private String planCategory; // 카테고리
	
	//조회를 위한 필드
	private String plannerName;
	private String memName;
	private String startDate;
	private String endDate;
}

package com.jl.helloing.member.model.vo;

import lombok.Data;

@Data
public class Expense {
	private int expenseNo; 			// 가계부 번호
	private int plannerNo; 			// 플래너 번호
	private int planNo; 			// 일정 번호
	private int amount; 			// 금액
	private String expenseContent; 	// 내용
	private String expenseCategory; // 카테고리
}

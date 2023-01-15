package com.jl.helloing.member.model.vo;

import lombok.Data;

@Data
public class Expense {
	private int expenseNo; 			// 가계부 번호
	private int plannerNo; 			// 플래너 번호
	private int amount; 			// 금액
	private String method;
	private String expenseDate;
	private String expenseContent; 	// 내용
	private String expenseCategory; // 카테고리
	
	//1/n
	private int eat;
	private int accomm;
	private int transport;
	private int tour;
	private int shopping;
	private int other;
	private double all;
	private double individual;
	private int memCount;
	
	
}

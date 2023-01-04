package com.jl.helloing.member.model.vo;

import lombok.Data;

@Data
public class ActivityWish {
	private int activityNo; 	// 액티비티 번호
	private int memNo; 			// 회원번호
	private String wishDate; 	// 찜한 날짜
}

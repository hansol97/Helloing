package com.jl.helloing.member.model.vo;

import lombok.Data;

@Data
public class AccommWish {
	private int accommNo; 		// 숙소 번호
	private int memNo; 			// 회원번호
	private String wishDate; 	// 찜한 날짜
}

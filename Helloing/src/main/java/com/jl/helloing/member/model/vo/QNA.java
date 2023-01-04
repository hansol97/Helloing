package com.jl.helloing.member.model.vo;

import lombok.Data;

@Data
public class QNA {
	private int qnaNo; 			// 문의번호 
	private int memNo; 			// 회원번호
	private String qnaTitle; 	// 제목
	private String qnaQ; 		// 내용
	private String qnaSort; 	// 기업/회원
	private String category; 	// 카테고리
	private String qnaDate; 	// 등록일
	private String ansYn; 		// 답변여부
	private String ansDate; 	// 답변일
	private String qnaA; 		// 답변 내용
}

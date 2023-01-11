package com.jl.helloing.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data @Builder @AllArgsConstructor
public class cert {
	private String who; 	// 이메일 보낼 사용자 ip
	private String secret;	// 인증번호
	private String when; 	// 인증번호 유효 시간(3분)
}

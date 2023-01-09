package com.jl.helloing.admin.model.vo;

import lombok.Data;

@Data
public class Chatbot {

	private String chatbotQ; // "CAHTBOT_Q"	VARCHAR2(100)		PRIMARY KEY,
	private String chatbotA; // "CAHTBOT_A"	VARCHAR2(1000)		NOT NULL
	private String originChatbotQ; // 기존 키워드 
}

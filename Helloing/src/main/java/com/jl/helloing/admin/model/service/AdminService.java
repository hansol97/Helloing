package com.jl.helloing.admin.model.service;

import com.jl.helloing.admin.model.vo.Chatbot;

public interface AdminService {
	
	
	// 챗봇 등록
	int insertChatbot(Chatbot c);
	
	// 챗봇 수정 모달
	Chatbot updateFormChatbot(String keyword);
	
	// 챗봇 수정
	int updateChatbot(Chatbot c);
	
	
}

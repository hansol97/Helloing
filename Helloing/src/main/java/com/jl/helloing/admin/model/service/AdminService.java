package com.jl.helloing.admin.model.service;

import java.util.ArrayList;

import com.jl.helloing.admin.model.vo.Chatbot;

public interface AdminService {
	
	
	// 챗봇 등록
	int insertChatbot(Chatbot c);
	
	// 챗봇 리스트 조회
	ArrayList<Chatbot> selectChatbotList();
	
	// 챗봇 수정 모달
	Chatbot updateFormChatbot(String chatbotQ);
	
	// 챗봇 수정
	int updateChatbot(Chatbot c);
	
	// 챗봇 삭제
	int deleteChatbot(String chatbotQ);
	
	
}

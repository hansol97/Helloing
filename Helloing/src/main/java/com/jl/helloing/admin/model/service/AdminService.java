package com.jl.helloing.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.jl.helloing.admin.model.vo.Chatbot;
import com.jl.helloing.common.model.vo.PageInfo;
import com.jl.helloing.member.model.vo.Member;

public interface AdminService {
	
	
	//--------------------- 챗봇 --------------------
	// 챗봇 등록
	int insertChatbot(Chatbot c);
	
	// 챗봇 수 조회
	int selectChatbotListCount();
	
	// 챗봇 리스트 조회
	ArrayList<Chatbot> selectChatbotList(PageInfo pi);
	
	// 챗봇 수정
	int updateChatbot(Chatbot c);
	
	// 챗봇 삭제
	int deleteChatbot(List<String> cbox);
	
	// 검색된 챗봇 수 조회
	int selectSearchChatbotCount(HashMap map);
	
	// 챗봇 검색
	ArrayList<Chatbot> searchChatbot(PageInfo pi, HashMap<String, String> map);
	
	// 챗봇Q로 챗봇A 조회
	ArrayList<Chatbot> selectChatbotA(HashMap<String, Object> map);
	
	//--------------- 회원 관리 ----------------
	// 일반회원 목록 조회
	ArrayList<Member> selectMemberList();
	
	// 일반회원 정지
	int deleteMember(int memNo);

}

package com.jl.helloing.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.jl.helloing.admin.model.vo.Chatbot;
import com.jl.helloing.business.model.vo.Business;
import com.jl.helloing.business.model.vo.BusinessPayment;
import com.jl.helloing.common.model.vo.PageInfo;
import com.jl.helloing.member.model.vo.Member;
import com.jl.helloing.product.model.vo.RoomPayment;
import com.jl.helloing.product.model.vo.Ticket;
import com.jl.helloing.product.model.vo.TicketPayment;

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
	
	// 일반회원 목록 수 조회
	int selectMemListCount();
	
	// 일반회원 목록 조회
	ArrayList<Member> selectMemberList(PageInfo pi);
	
	// 일반회원 정지
	int deleteMember(int memNo);
	
	// 일반회원 검색 목록 수 조회
	int selectSearchMemListCount(HashMap map);
	
	// 일반회원 검색 목록
	ArrayList<Member> searchMemList(PageInfo pi, HashMap map);
	
	// 사업자 목록 수 조회
	int selectBusiListCount();
	
	// 사업자 목록 조회
	ArrayList<Business> selectBusinessList(PageInfo pi);
	
	// 사업자 검색된 목록 수
	int searchBusiListCount(HashMap map);
	
	// 사업자 검색된 목록
	ArrayList<Business> searchBusinessList(PageInfo pi, HashMap map);
	
	//--------------- 결제 관리 ----------------
	
	// 사업자 등록 결제 수 조회
	int selectBusiPayListCount();
	
	// 사업자 등록 결제 리스트 조회
	ArrayList<BusinessPayment> selectBusiPayList(PageInfo pi);
	
	// 사업자 등록 결제 검색 리스트 수
	int searchBusiPayListCount(String keyword);
	
	// 사업자 등록 결제 검색 리스트 조회
	ArrayList<BusinessPayment> searchBusiPayList(PageInfo pi, String keyword);
	
	// 숙소 결제 수 조회
	int selectRoomPayListCount();
	
	// 숙소 결제 조회
	ArrayList<RoomPayment> selectRoomPayList(PageInfo pi);
	
	// 숙소 결제 검색된 목록 수
	int searchRoomPayListCount(String keyword);
	
	// 숙소 결제 검색된 목록
	ArrayList<RoomPayment> searchRoomPayList(PageInfo pi, String keyword);
	
	// 액티비티 리스트 수 조회
	int selectActPayListCount();
	
	// 액티비티 리스트 조회
	ArrayList<TicketPayment> selectActPaymentList(PageInfo pi);
	
	// 액티비티 결제 티켓 조회
	ArrayList<Ticket> selectTicketList(int orderNo);

	
	



}

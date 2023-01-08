package com.jl.helloing.business.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BusinessController {
	
	// 숙소 조회
	@RequestMapping("accommList.bu")
	public String goSelectAccom() {
		return "business/accommList";
	}
	// 액티비티 조회
	@RequestMapping("activityList.bu")
	public String selectActivity() {
		return "business/activityList";
	}
	// 숙소등록화면으로 이동
	@RequestMapping("goInsertAccom.bu")
	public String goInsertAccom() {
		return "business/insertAccomm";
	}
	// 액티비티 등록 화면으로 이동
	@RequestMapping("goInsertAct.bu")
	public String goInsertAct() {
		return "business/insertActivity";
	}
	// 숙소 수정하기
	@RequestMapping("goUpdateAccom.bu")
	public String goUpdateAccom() {
		return "business/updateAccomm";
	}
	// 액티비티 수정하기
	@RequestMapping("goUpdateAct.bu")
	public String goUpdateActivity() {
		return "business/updateActivity";
	}
	// 객실 등록화면으로 이동
	@RequestMapping("goInsertRoom.bu")
	public String goInsertRoom() {
		return "business/insertRoom";
	}
	// 티켓 등록 화면으로 이동 
	@RequestMapping("goInsertTicket.bu")
	public String goInsertTicket() {
		return "business/insertTicket";
	}
	
	
	
	
	
	
	
	// 메뉴바에서 기업관리 누르면 기업페이지로 이동
	@RequestMapping("page.bu")
	public String businessPage() {
		return "business/menubar_business";
	}
	// 기업 마이페이지
	@RequestMapping("mypage.bu")
	public String selectComMem() {
		return "business/mypage";
	}
	
	// 기업 정보 수정
	@RequestMapping("mypageEnroll.bu")
	public String updateComMem() {
		return "business/mypageUpdateForm";
	}
	
	// 숙소 예약자 리스트
	@RequestMapping("accommBookList.bu")
	public String accommBookList() {
		return "business/accommBookList";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

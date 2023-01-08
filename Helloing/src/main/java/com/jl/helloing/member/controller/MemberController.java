package com.jl.helloing.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jl.helloing.member.model.service.MemberService;
import com.jl.helloing.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	
	
	//승준
	//로그인
	@RequestMapping("login.me")
	public String loginMember(Member m) {
		
		memberService.loginMember(m);
		
		return "member/login";
	}
	//아이디찾기
	@RequestMapping("findIdForm.me")
	public String findId() {
		return "member/findIdForm";
	}
	// 비밀번호 찾기
	@RequestMapping("findPwdForm.me")
	public String findPwd() {
		return "member/findPwdForm";
	}
	// 새 비밀번호 (비밀번호 찾기 후)
	@RequestMapping("newFindPwd.me")
	public String updatePwd() {
		return "member/newFindPwd";
	}
	// 이용약관 (회원가입 전)
	@RequestMapping("terms.me")
	public String terms() {
		return "member/terms";
	}
	// 회원가입
	@RequestMapping("memberEnrollForm.me")
	public String enrollForm() {
		return "member/memberEnrollForm";
	}
	// 기업파트너등록 전 알림페이지
	@RequestMapping("loginMove.me")
	public String loginMove() {
		return "member/loginMove";
	}
	// 기업 파트너 등록 
	@RequestMapping("businessEnrollForm.me")
	public String businessEnrollForm() {
		return "member/businessEnrollForm";
	}
	// 혜진씨 퐈이팅!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!(당신은 사랑받기위해 태어난사람 당신의 삶속에서 그사랑 받고있지요)-승준-
	//혜진
	//마이페이지 메인
	@RequestMapping("myPage.hj")
	public String myPage() {
		return "member/scheduledReservation";
	}
	
	//예정된 예약
	@RequestMapping("scheduled.hj")
	public String scheduled() {
		return "member/reservationScheduled";
	}
	
	//지난 예약
	@RequestMapping("last.hj")
	public String last() {
		return "member/reservationLast";
	}
	
	//취소된 예약
	@RequestMapping("cancelled.hj")
	public String cancelled() {
		return "member/reservationCancelled";
	}
	
	//예약 상세 조회
	@RequestMapping("reservationDetail.hj")
	public String reservationDetail() {
		return "member/reservationDetail";
	}
	
	//회원정보 조회 - 비밀번호 확인
	@RequestMapping("pwdMatchingForm.hj")
	public String pwdMatchingForm() {
		return "member/pwdMatchingForm";
	}
	
	//회원정보 조회 - 수정
	@RequestMapping("memberUpdateForm.hj")
	public String memberEnrollForm() {
		return "member/memberUpdateForm";
	}
	
	//나의 여행리뷰 조회 리스트
	@RequestMapping("tripReviewList.hj")
	public String tripReviewList() {
		return "member/tripReviewList";
	}
	
	//찜한 숙소 조회
	@RequestMapping("wishAccommList.hj")
	public String wishAccommList(){
		return "member/wishAccommList";
	}
	
	//찜한 액티비티 조회
	@RequestMapping("wishActivityList.hj")
	public String wishActivityList() {
		return "member/wishActivityList";
	}
	
	//후기 작성 페이지 
	@RequestMapping("reviewEnrollForm.hj")
	public String reviewEnrollForm() {
		return "member/reviewEnrollFrom";
	}
}

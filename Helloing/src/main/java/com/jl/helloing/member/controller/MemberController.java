package com.jl.helloing.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jl.helloing.member.model.service.MemberService;
import com.jl.helloing.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	//승준
	//로그인
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m, ModelAndView mv, HttpSession session) {
		
		Member loginUser = memberService.loginMember(m);
		
		System.out.println("서비스 돌아온 후 " + loginUser);
		
		//System.out.println(loginUser.getMemId());
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getMemPwd(), loginUser.getMemPwd())) {

			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:/");
			
		} else {

			mv.addObject("errorMsg","로그인에 실패 하셨습니다.");
			mv.setViewName("common/loginErrorPage");
			
		}
		
		return mv;
	}
	//로그인 창
	@RequestMapping("loginForm.me")
	public String loginForm() {
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
	// 회원가입 폼
	@RequestMapping("memberEnrollForm.me")
	public String enrollForm() {
		return "member/memberEnrollForm";
	}
	// 회원가입
	@RequestMapping("insert.me")
	public String insertMember(Member m, Model model) {
		String encPwd = bcryptPasswordEncoder.encode(m.getMemPwd());
		m.setMemPwd(encPwd);
		
		int result = memberService.insertMember(m);
		
		if(result >0) {
			return "redirect:/";
		} else {
			model.addAttribute("errorMsg","회원가입에 실패 하셨습니다.");
			return "common/loginErrorPage";
		}
	}

	// 혜진씨 퐈이팅!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!(당신은 사랑받기위해 태어난사람 당신의 삶속에서 그사랑 받고있지요)-승준-
	// 감솨함닷 승준님도 화이팅!!!!!!!!!!!!!!!!!!!!
	//혜진
	//예정된 예약
	@RequestMapping("scheduled.hj")
	public String selectScheduled() {
		return "member/reservationScheduled";
	}
	
	//지난 예약
	@RequestMapping("last.hj")
	public String selectLast() {
		return "member/reservationLast";
	}
	
	//취소된 예약
	@RequestMapping("cancelled.hj")
	public String selectCancelled() {
		return "member/reservationCancelled";
	}
	
	//예약 상세 조회
	@RequestMapping("reservationDetail.hj")
	public String reservationDetail() {
		return "member/reservationDetail";
	}
	
	//회원정보 조회 - 비밀번호 확인
	@RequestMapping("checkPwdForm.hj")
	public String checkPwd() {
		return "member/checkPwdForm";
	}
	
	//회원정보 조회 - 수정
	@RequestMapping("memberUpdateForm.hj")
	public String memberUpdateForm(String userId, String userPwd, ModelAndView mv) {
		
		
		return "member/memberUpdateForm";
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
		return "member/reviewEnrollForm";
	}
	
	//플래너 메인페이지
	@RequestMapping("plannerMain.hj")
	public String plannerList() {
		return "member/plannerMain";
	}
	//플랜 상세페이지
	@RequestMapping("planDetailView.hj")
	public String planDetailView() {
		return "member/planDetailView";
	}
	//가계부 페이지
	@RequestMapping("expenseView.hj")
	public String expenseView() {
		return "member/expenseView";
	}
}

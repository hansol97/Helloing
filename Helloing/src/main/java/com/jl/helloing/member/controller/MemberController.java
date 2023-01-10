package com.jl.helloing.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jl.helloing.member.model.service.MemberService;
import com.jl.helloing.member.model.vo.AccommWish;
import com.jl.helloing.member.model.vo.ActivityWish;
import com.jl.helloing.member.model.vo.Member;
import com.jl.helloing.member.model.vo.Planner;

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
		
		//System.out.println("서비스 돌아온 후 " + loginUser);
		
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
	// 로그아웃
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) { 
		session.invalidate();
		return "redirect:/";
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
	public String checkPwdForm() {
		return "member/checkPwdForm";
	}
	
	//회원정보 조회 - 수정 페이지
	@RequestMapping("memberUpdateForm.hj")
	public ModelAndView memberUpdateForm(Member m, ModelAndView mv) {
		
		//유저에게 받은 비밀번호(평문)과 DB속 암호문 비교
		if(bcryptPasswordEncoder.matches(m.getMemPwd(), memberService.checkPwd(m))) {
			
			mv.setViewName("member/memberUpdateForm");
		}else {
			mv.addObject("errorMsg", "비밀번호가 일치하지 않습니다.");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	//회원정보 조회 - 수정:비밀번호 변경
	@RequestMapping("memberUpdatePwd.hj")
	public ModelAndView memberUpdatePwd(Member m, String memNewPwd, HttpSession session, ModelAndView mv) {
		
		//비밀번호 일치하는지 확인
		if(!bcryptPasswordEncoder.matches(m.getMemPwd(), memberService.checkPwd(m))) {
			//비밀번호 불일치
			
			mv.addObject("errorMsg", "비밀번호 불일치");
			mv.setViewName("common/errorPage");
			
		}else {
			//비밀번호 변경
			String encPwd = bcryptPasswordEncoder.encode(memNewPwd);
			m.setMemPwd(encPwd);
			
			if(memberService.memberUpdatePwd(m)>0) {//성공
				
				session.setAttribute("alertMsg", "비밀번호 변경 성공");
				mv.setViewName("redirect:/");
			}else {
				//비밀번호 변경실패
				
				mv.addObject("errorMsg", "비밀번호 변경 실패");
				mv.setViewName("common/errorPage");
			}
		}
		return mv;
	}
	
	//회원정보 수정 - 수정(update)
	@RequestMapping("memberUpdate.hj")
	public ModelAndView memberUpdate(Member m, HttpSession session, ModelAndView mv) {
		
		if(memberService.memberUpdate(m)>0) {
			session.setAttribute("alertMsg", "회원정보 수정 성공");
			mv.setViewName("redirect:/");
		}else {
			mv.addObject("errorMsg", "비밀번호가 일치하지 않습니다.");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	//찜한 숙소 조회
	@RequestMapping("wishAccommList.hj")
	public ModelAndView wishAccommList(HttpSession session, ModelAndView mv){
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		ArrayList<AccommWish> list = memberService.wishAccommList(memNo);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.setViewName("member/wishAccommList");
		}else {
			mv.addObject("errorMsg", "찜한 숙소가 없습니다.");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	//찜한 숙소 삭제
	@RequestMapping("deleteWishAccount.hj")
	public ModelAndView deleteWishAccomm(HttpSession session, AccommWish aw, ModelAndView mv) {
		
		if(memberService.deleteWishAccomm(aw)>0) {
			mv.setViewName("redirect:wishAccommList.hj");
		}else {
			session.setAttribute("alertMsg", "삭제에 실패하였습니다.");
			mv.setViewName("redirect:wishAccommList.hj");
		}
		
		return mv;
	}
	
	//찜한 액티비티 조회
	@RequestMapping("wishActivityList.hj")
	public ModelAndView wishActivityList(HttpSession session, ModelAndView mv) {
		
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		ArrayList<ActivityWish> list = memberService.wishActivityList(memNo);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.setViewName("member/wishActivityList");
		}else {
			mv.addObject("errorMsg", "찜한 숙소가 없습니다.");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	//찜한 액티비티 삭제 
	@RequestMapping("deleteWishActivity.hj")
	public ModelAndView deleteWishActivity(HttpSession session, ActivityWish aw, ModelAndView mv) {
		if(memberService.deleteWishActivity(aw)>0) {
			mv.setViewName("redirect:wishActivityList.hj");
		}else {
			session.setAttribute("alertMsg", "삭제에 실패하였습니다.");
			mv.setViewName("redirect:wishActivityList.hj");
		}
		
		return mv;
	}
	
	//후기 작성 페이지 
	@RequestMapping("reviewEnrollForm.hj")
	public String reviewEnrollForm() {
		return "member/reviewEnrollForm";
	}
	
	//플래너 메인페이지
	@RequestMapping("plannerMain.hj")
	public ModelAndView plannerList(ModelAndView mv, HttpSession session) {
		
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		ArrayList<Planner> list = memberService.plannerList(memNo);
		if(list!=null) {
			int today = Integer.parseInt(new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date()));
			mv.addObject("today", today);
			mv.addObject("list", list);
			mv.setViewName("member/plannerMain");
			
		}else {
			mv.addObject("errorMsg", "플래너 조회에 실패했습니다.");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	//플래너 추가
	@RequestMapping("insertPlanner.hj")
	public ModelAndView insertPlanner(ModelAndView mv, HttpSession session, Planner pl) {
		
		System.out.println(pl);
		
		if(memberService.insertPlanner(pl)>0) {
			mv.setViewName("redirect:plannerMain.hj");
		}else {
			session.setAttribute("alertMsg", "일정 추가에 실패하였습니다.");
			mv.setViewName("redirect:plannerMain.hj");
		}
		return mv;
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

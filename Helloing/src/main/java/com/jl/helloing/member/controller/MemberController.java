package com.jl.helloing.member.controller;

import java.text.DecimalFormat;
import java.text.Format;
import java.util.ArrayList;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.jl.helloing.business.model.service.BusinessService;
import com.jl.helloing.business.model.vo.Business;
import com.jl.helloing.common.model.vo.Cert;
import com.jl.helloing.member.model.service.MemberService;
import com.jl.helloing.member.model.vo.AccommWish;
import com.jl.helloing.member.model.vo.ActivityWish;
import com.jl.helloing.member.model.vo.Expense;
import com.jl.helloing.member.model.vo.Member;
import com.jl.helloing.member.model.vo.Plan;
import com.jl.helloing.member.model.vo.Planner;
import com.jl.helloing.member.model.vo.PlannerMem;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private BusinessService businessService;
	
	@Autowired
	private JavaMailSender sender;
	
	//승준
	//로그인
	@RequestMapping("login.me")
	public ModelAndView loginMember( Member m, ModelAndView mv, HttpSession session) {
		
		Member loginUser = memberService.loginMember(m);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getMemPwd(), loginUser.getMemPwd())) {
			int memNo = loginUser.getMemNo();
			Business loginCompany = businessService.loginCompany(memNo);
			
			// System.out.println("loginUser :" + loginUser );
			// System.out.println("memNo:" + memNo);
			// System.out.println("lc:" + loginCompany);
			// System.out.println("서비스 돌아온 후 " + loginUser);
			
			// System.out.println(loginUser.getMemId());
		
		
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("loginCompany", loginCompany);
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
	
	//아이디찾기 폼 이동
	@RequestMapping("findIdForm.me")
	public String findIdForm() {
		return "member/findIdForm";
	}
	
	// 아이디 찾기
	@RequestMapping("findId.me")
	public ModelAndView findId(Member m, ModelAndView mv ) {
		
		Member m1 = memberService.findId(m);
		
		if(m1 != null) {
			String memId = m1.getMemId();
			mv.addObject("memId", memId)
			  .addObject("alertMsg", "당신의 아이디는 : " + memId + "입니다.")
			  .setViewName("member/login");
		} else {
			mv.addObject("alertMsg", "회원가입정보가 없습니다.")
			  .setViewName("member/findIdForm");
		}
		return mv;

		
		
	}
	// 비밀번호 찾기 폼
	@RequestMapping("findPwdForm.me")
	public String findPwdForm() {
		return "member/findPwdForm";
	}
	
	// 비밀번호 찾기
//	@RequestMapping("findPwd.me")
//	public String findPwd(Member m) {
//		
//		Member m2 = memberService.findPwd(m);
//		
//		if(m2 != null) {
//			System.out.println(m2.getEmail());
//			System.out.println(m2.getMemNo());
//			System.out.println(m2.getMemPwd());
//		} else {
//			System.out.println("널이야");
//		}
//		
//		
//		return "member/findPwdForm";
//		
//		
//		
//		
//		
//		
//	}
//	// 새 비밀번호 (비밀번호 찾기 후)
//	@RequestMapping("newFindPwd.me")
//	public String updatePwd() {
//		return "member/newFindPwd";
//	}
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
	
	// 이메일 보내기
	@RequestMapping("certButton.me")
	public String certButton(String email, HttpServletRequest request) throws MessagingException {
		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		//System.out.println(email);
		String ip = request.getRemoteAddr(); //getRemoteAddr ip주소를 준다.
		String secret = generateSecret();
		//build 를 사용
			// 필드명만 가지고 setter 처럼 사용 가능
			// 기본생성자랑 setter랑 합친것이다.
			Cert cert =  Cert.builder()
							.who(ip)
							.secret(secret)
							.build();
							
			memberService.sendMail(cert);
			
			helper.setTo(email); // 인증번호 이거야~ 보내준다.
			helper.setSubject("인증을 해주세요");
			helper.setText("인증번호 : " + secret);
			sender.send(message);
			
			return "redirect:/";
		}

	// 이메일 인증번호 설정
	public String generateSecret() {
		Random r = new Random();
		// Math를 사용해도됨
		int n =r.nextInt(100000); //nextInt MathRandom이랑 똑같이 만들수 있다. 
		// 단, 이렇게 하면 숫자 6자리 중에 앞에 0이 들어가야하는데 0인 안들어간다. 그래서 맨앞에 문자를 사용해줘야하는데 그럴때 Format을 사용
		
		Format f = new DecimalFormat("000000");
		String secret = f.format(n); // 정수를 넣어서 문자로 받아준다.
		
		return secret; // 이 메소드를 호출하면 이렇게 만들어진 문자를 넘겨줌
	}
	
	// 이메일 인증번호 ajax로 인증
	@ResponseBody // ajax로 사용해서 데이터만 받을꺼니까
	@RequestMapping("check")
	public boolean check(String secret, HttpServletRequest request) { // name속성에서 secret 넘김 
											   //request를 쓰는데 아이디가 똑같은지 봐야하기때문에 어쩔수없이 써야한다.
		Cert cert = Cert.builder()
						.who(request.getRemoteAddr())
						.secret(secret)
						.build(); // 객체를 만들어주는 역할
		 // 이걸가지고 이제 DB에가서  똑같은 놈이 썼는지 확인
		
		/*
		boolean result = memberService.validate(cert); // boolean을 받아서 성공/실패만 

			return result;
		*/	
		return memberService.validate(cert);
	
	}
	@ResponseBody // 데이터를 return 해서 돌려주고 싶을때는 ResponseBody를 쓴다.
	@RequestMapping("idCheck.me")
	public String idCheck(String checkId) {
		int count = memberService.idCheck(checkId);
		if(count > 0) { // count가 0보다 높으면 이미 존재하는 아아디
			return "NNNNN";
		} else { // 사용가능
			return "NNNNY";
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
		
		if(memberService.insertPlanner(pl)>0 && memberService.insertPlannerMem(pl.getMemNo())>0) {
			mv.setViewName("redirect:plannerMain.hj");
		}else {
			session.setAttribute("alertMsg", "일정 추가에 실패하였습니다.");
			mv.setViewName("redirect:plannerMain.hj");
		}
		return mv;
	}
	
	//플래너 수정 전 조회
	@ResponseBody
	@RequestMapping(value="selectPlanner.hj", produces="application/json; charset=UTF-8")
	public String selectPlanner(HttpSession session, int plannerNo) {
		
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		Planner pl = new Planner();
		pl.setPlannerNo(plannerNo);
		pl.setMemNo(memNo);
		
		Planner planner = memberService.selectPlanner(pl); 
		
		return new Gson().toJson(planner);
	}
	//플래너 수정
	@RequestMapping("updatePlanner.hj")
	public ModelAndView updatePlanner(ModelAndView mv, HttpSession session, Planner pl) {
		
		
		if(memberService.updatePlanner(pl)>0) {
			session.setAttribute("alertMsg", "수정에 성공 하였습니다.");
			mv.setViewName("redirect:plannerMain.hj");
		}else {
			session.setAttribute("alertMsg", "일정 수정에 실패하였습니다.");
			mv.setViewName("redirect:plannerMain.hj");
		}
		
		return mv;
	}
	
	//플래너 삭제
	@RequestMapping("deletePlanner.hj")
	public ModelAndView deletePlanner(ModelAndView mv, HttpSession session, int plannerNo) {
	
		//플래너 번호에 해당하는 플랜 삭제
		
		
		//플래너 삭제
		
		return mv;
	}
	
	//플랜 상세페이지
	@RequestMapping("planDetailView.hj")
	public ModelAndView planDetailView(int plannerNo, ModelAndView mv, HttpSession session) {
		
		ArrayList<Plan> list = memberService.planDetailView(plannerNo);
		
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		Planner pl = new Planner();
		pl.setPlannerNo(plannerNo);
		pl.setMemNo(memNo);
		
		Planner planner = memberService.selectPlanner(pl); 
		
		
		System.out.println(planner);
		if(list!=null) {
			mv.addObject("pl", planner);
			mv.addObject("list", list);
			mv.setViewName("member/planDetailView");
		}else {
			mv.addObject("errorMsg","상세페이지 조회에 실패했습니다.");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	//일행과 함께 여행가기
	@RequestMapping("planAddMem.hj")
	public ModelAndView planAddMem(ModelAndView mv, PlannerMem pm, HttpSession session) {
		
		//조회했을 때 동일한 값이 없을 때만 insert
		if(memberService.planMemSelect(pm)>0) { //동일한 값 O -> 실패
			session.setAttribute("alertMsg", "이미 입력한 일행이 존재합니다.");
			mv.addObject("plannerNo", pm.getPlannerNo());
			mv.setViewName("redirect:planDetailView.hj");
		}else {
				if(memberService.planAddMem(pm)>0) { //동일한 값 X, 추가 성공 -> 성공
					session.setAttribute("alertMsg", "일행 추가에 성공하였습니다.");
					mv.addObject("plannerNo", pm.getPlannerNo());
					mv.setViewName("redirect:planDetailView.hj");
				}else { //insert실패
					session.setAttribute("alertMsg", "일행 추가에 실패하였습니다.");
					mv.addObject("plannerNo", pm.getPlannerNo());
					mv.setViewName("redirect:planDetailView.hj");
				}
		}
		return mv;
	}
	
	//일정 추가
	@RequestMapping("insertPlan.hj")
	public ModelAndView insertPlan(ModelAndView mv, Plan p, HttpSession session) {
		
		if(memberService.insertPlan(p)>0) {
			session.setAttribute("alertMsg", "일정 추가에 성공하였습니다.");
			mv.addObject("plannerNo", p.getPlannerNo());
			mv.setViewName("redirect:planDetailView.hj");
		}else {
			session.setAttribute("alertMsg", "일정 추가에 실패하였습니다.");
			mv.addObject("plannerNo", p.getPlannerNo());
			mv.setViewName("redirect:planDetailView.hj");
		}
		return mv;
	}
	
	//일정 수정 전 조회
	@ResponseBody
	@RequestMapping(value="selectPlan.hj", produces="application/json; charset=UTF-8")
	public String selectPlan(int planNo) {
		
		Plan p = memberService.selectPlan(planNo);
		
		return new Gson().toJson(p);
	}
	
	//일정 수정
	@RequestMapping("updatePlan.hj")
	public ModelAndView updatePlan(Plan p, ModelAndView mv, HttpSession session) {
		
		System.out.println(p);
		if(memberService.updatePlan(p)>0) {
			session.setAttribute("alertMsg", "일정 수정에 성공하였습니다.");
			mv.addObject("plannerNo", p.getPlannerNo());
			mv.setViewName("redirect:planDetailView.hj");
		}else {
			session.setAttribute("alertMsg", "일정 수정에 실패하였습니다.");
			mv.addObject("plannerNo", p.getPlannerNo());
			mv.setViewName("redirect:planDetailView.hj");
		}
		
		return mv;
	}
	//일정 삭제
	@RequestMapping("deletePlan.hj")
	public ModelAndView deletePlan(ModelAndView mv, HttpSession session, int planNo, int plannerNo) {

		if(memberService.deletePlan(planNo)>0) {
			session.setAttribute("alertMsg", "일정 삭제에 성공하였습니다.");
			mv.addObject("plannerNo", plannerNo);
			mv.setViewName("redirect:planDetailView.hj");
		}else {
			session.setAttribute("alertMsg", "일정 삭제에 실패하였습니다.");
			mv.addObject("plannerNo", plannerNo);
			mv.setViewName("redirect:planDetailView.hj");
		}
		return mv;
	}
	//가계부 페이지
	@RequestMapping("expenseView.hj")
	public ModelAndView expenseView(ModelAndView mv, int plannerNo) {
		
		ArrayList<Expense> list = memberService.expenseView(plannerNo);
		
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("plannerNo", plannerNo);
			mv.setViewName("member/expenseView");
		}else {
			mv.addObject("errorMsg","가계부 조회에 실패했습니다.");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}

	
	//1/n
	@ResponseBody
	@RequestMapping(value="dutchTreat.hj", produces="application/json; charset=UTF-8")
	public String dutchTreat(int plannerNo) {
		
		Expense e = memberService.dutchTreat(plannerNo);
		
		return new Gson().toJson(e);
	}
	
	
	
	
	
	//비용 추가
	
	
	
	
	
	
	
	//비용 수정 전 조회
	
	
	
	
	
	
	//비용삭제
	
	
	
	
	
	
	
	
	
	// 액티비티 위시리스트 추가
	@ResponseBody
	@RequestMapping("addActWish")
	public String addActWish(HttpSession session, ActivityWish aw) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser != null) {
			aw.setMemNo(loginUser.getMemNo());
			
			if(memberService.addActWish(aw) > 0) return "success";
			else return "fail";
			
		} else {
			return "login please";
		}
	}
	
	// 액티비티 위시리스트 삭제
	@ResponseBody
	@RequestMapping("removeActWish")
	public String removeActWish(HttpSession session, ActivityWish aw) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser != null) {
			aw.setMemNo(loginUser.getMemNo());
			
			if(memberService.removeActWish(aw) > 0) return "success";
			else return "fail";
		} else {
			return "idk";
		}
	}
	
}

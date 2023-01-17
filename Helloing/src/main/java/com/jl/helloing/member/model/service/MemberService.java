package com.jl.helloing.member.model.service;

import java.util.ArrayList;

import com.jl.helloing.common.model.vo.Cert;
import com.jl.helloing.member.model.vo.AccommWish;
import com.jl.helloing.member.model.vo.ActivityWish;
import com.jl.helloing.member.model.vo.Book;
import com.jl.helloing.member.model.vo.Expense;
import com.jl.helloing.member.model.vo.Member;
import com.jl.helloing.member.model.vo.Plan;
import com.jl.helloing.member.model.vo.Planner;
import com.jl.helloing.member.model.vo.PlannerMem;
import com.jl.helloing.member.model.vo.QNA;
import com.jl.helloing.product.model.vo.RoomPayment;
import com.jl.helloing.product.model.vo.TicketPayment;

public interface MemberService {
	// 승준
	// 로그인 서비스(select)
	Member loginMember(Member m);
	
	// 회원가입 서비스(insert)
	int insertMember(Member m);
	// 메일인증보내기
	void sendMail(Cert cert);
	
	// 메인인증번호 대조
	boolean validate(Cert cert);
	
	// 아이디 찾기
	Member findId(Member m);
	
	// 비밀번호 찾기
	Member findPwd(Member m);
	
	/*
	public Cert findPwd(Member m) {
		
		askjdfalkds
		
		Cert c = memberService.asdfa(m);
		
		// 임시 비밀번호를 보내준다. 
		return c; 
	}
	*/
	// 임시비밀번호 암호화
	void updatePwd(Member m);
	
	// 아이디체크
	int idCheck(String checkId);
	
	//QNA 등록(회원용)
	int insertQna(QNA qna);
	
	//----------------------------------------------------------------------
	//혜진
	//숙소 예약 리스트 조회
	ArrayList<RoomPayment> accommBook(int memNo);
	
	//액티비티 예약 리스트 조회
	ArrayList<TicketPayment> activityBook(int memNo);
	
	
	//예약 상세조회
	Book reservationDetail(int memNo, int orderNo);

	//비밀번호확인
	String checkPwd(Member m);
	
	//비밀번호 변경
	int memberUpdatePwd(Member m);
	
	//회원 정보 수정
	int memberUpdate(Member m);
	
	//찜한 숙소 조회
	ArrayList<AccommWish> wishAccommList(int memNo);
	
	//찜한 숙소 삭제
	int deleteWishAccomm(AccommWish aw);
	
	//찜한 액티비티 조회
	ArrayList<ActivityWish> wishActivityList(int memNo);
	
	//찜한 액티비티 삭제
	int deleteWishActivity(ActivityWish aw);
	
	//플래너리스트 조회 
	ArrayList<Planner> plannerList(int memNo);

	//플래너 생성
	int insertPlanner(Planner pl);
	
	//플래너 멤버 추가
	int insertPlannerMem(int memNo);
	
	//플래너 수정 전 조회
	Planner selectPlanner(Planner pl);
	
	//플래너 수정
	int updatePlanner(Planner pl);
	
	//플래너 삭제 - 플래너 속 플랜 삭제
	int deletePlan(Planner pl);
	
	//플래너 삭제
	int deletePlanner(Planner pl);
	
	//플랜 상세 페이지
	ArrayList<Plan> planDetailView(int plannerNo);
	
	//일행과 함께 여행가기
	int planAddMem(PlannerMem pm);
	
	//일행이 중복되는 지 판단
	int planMemSelect(PlannerMem pm);
	
	//일정 추가 
	int insertPlan(Plan p);
	
	//일정 수정 전 조회
	Plan selectPlan(int planNo);
	
	//일정 수정
	int updatePlan(Plan p);
	
	//일정 삭제 
	int deletePlan(int planNo);
	
	//가계부 페이지
	ArrayList<Expense> expenseView(int planNo);
	
	//1/n
	Expense dutchTreat(int plannerNo);
	
	//가계부 결제 내역 추가 
	int insertExpense(Expense ex);
	
	//가계부 결제 내역 삭제
	int deleteExpense(Expense ex);
	
	// 액티비티 위시리스트 추가
	int addActWish(ActivityWish aw);
	
	// 액티비티 위시리스트 삭제
	int removeActWish(ActivityWish aw);
	
	// 액티비티 위시리스트 추가
	int addAcWish(AccommWish aw);
	
	// 액티비티 위시리스트 삭제
	int removeAcWish(AccommWish aw);
	
}

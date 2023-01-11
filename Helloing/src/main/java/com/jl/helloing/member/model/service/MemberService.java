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

public interface MemberService {
	// 승준
	// 로그인 서비스(select)
	Member loginMember(Member m);
	
	// 회원가입 서비스(insert)
	int insertMember(Member m);
	// 메일인증
	void sendMail(Cert cert);
	
	boolean validate(Cert cert);
	
	//혜진
	//예정된 예약 리스트 조회
	ArrayList<Book> selectScheduled(int memNo);
	
	//지난 예약 리스트 조회
	ArrayList<Book> selectLast(int memNo);
	
	//취소된 예약 리스트 조회
	ArrayList<Book> selectCancelled(int memNo);
	
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
	int planAddMem(Plan p);
	
	//일정 추가 
	int insertPlan(Plan p);
	
	//일정 수정 전 조회
	Plan selectPlan(int planNo);
	
	//일정 수정
	int updatePlan(Plan p);
	
	//일정 삭제 
	int deletePlan(int planNo);
	
	//가계부 페이지
	Expense expenseView(int planNo);
	

	
}

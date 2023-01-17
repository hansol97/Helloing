package com.jl.helloing.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jl.helloing.common.model.vo.Cert;
import com.jl.helloing.member.model.dao.MemberDao;
import com.jl.helloing.member.model.vo.AccommWish;
import com.jl.helloing.member.model.vo.ActivityWish;
import com.jl.helloing.member.model.vo.Book;
import com.jl.helloing.member.model.vo.Expense;
import com.jl.helloing.member.model.vo.Member;
import com.jl.helloing.member.model.vo.Plan;
import com.jl.helloing.member.model.vo.Planner;
import com.jl.helloing.member.model.vo.PlannerMem;
import com.jl.helloing.member.model.vo.QNA;
import com.jl.helloing.product.model.vo.AccommReview;
import com.jl.helloing.product.model.vo.ActivityReview;
import com.jl.helloing.product.model.vo.RoomPayment;
import com.jl.helloing.product.model.vo.TicketPayment;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 승준
	// 로그인
	@Override
	public Member loginMember(Member m) {
		return memberDao.loginMember(m, sqlSession);
	}
	
	// 회원가입
	@Override
	public int insertMember(Member m) {
		return memberDao.insertMember(m, sqlSession);
	}
	
	// 메일인증번호 보내기
	
	@Override
	public void sendMail(Cert cert) {
		memberDao.insertSecret(sqlSession, cert);
		
	}
	// 메일인증번호 인증하기
	@Override
	public boolean validate(Cert cert) {
		return memberDao.validate(sqlSession, cert) ;
	}
	// 아이디 중복확인
	@Override
	public int idCheck(String checkId) {
		return memberDao.idCheck(sqlSession, checkId);
	}
	
	@Override
	public Member findId(Member m) {
		
		return memberDao.findId(sqlSession, m);
	}

	@Override
	public Member findPwd(Member m) {
		return memberDao.findPwd(sqlSession, m);
	}
	
	// 임시 비밀번호 암호화 (DB로 보내기)
	@Override
	public void updatePwd(Member m) {
		memberDao.updatePwd(sqlSession, m);

	}
	// 승준 ----- 1:1 문의 부분 -------- 
	// 1:1문의 등록
	@Override
	public int insertQna(QNA qna) {
		
		return memberDao.insertQna(sqlSession, qna);
	}
	@Override
	public ArrayList<QNA> selectQna(int memNo) {
		return memberDao.selectQna(sqlSession, memNo);
	}
	
	//---------------------------------------------------------------------
	
	//혜진
	
	//마이페이지 메인 == 숙소 예약 리스트 
	@Override
	public ArrayList<RoomPayment> accommBook(int memNo) {
		return memberDao.accommBook(memNo, sqlSession);
	}
	
	//액티비티 예약 리스트 
	@Override
	public ArrayList<TicketPayment> activityBook(int memNo) {
		return memberDao.activityBook(memNo, sqlSession);
	}
	
	//숙소예약디테일
	@Override
	public RoomPayment accommBookDetail(int orderNo) {
		return memberDao.accommBookDetail(orderNo, sqlSession);
	}
	//액티비티예약디테일
	@Override
	public TicketPayment activityBookDetail(int orderNo) {
		return memberDao.activityBookDetail(orderNo, sqlSession);
	}
	//숙소예약취소
	@Override
	public int accommBookDelete(int orderNo) {
		// TODO Auto-generated method stub
		return 0;
	}
	//숙소 리뷰 조회
	@Override
	public AccommReview selectAcommReview(int orderNo) {
		return memberDao.selectAccommReview(orderNo, sqlSession);
	}
	//액티비티 리뷰조회
	@Override
	public ActivityReview selectActivityReview(int orderNo) {
		return memberDao.selectActivityReview(orderNo, sqlSession);
	}
	//숙소 리뷰작성
	@Override
	public int insertAccommReview(AccommReview review) {
		// TODO Auto-generated method stub
		return 0;
	}

	//액티비티 리뷰작성
	@Override
	public int insertActivityReview(ActivityReview review) {
		// TODO Auto-generated method stub
		return 0;
	}

	//숙소리뷰삭제
	@Override
	public int deleteAccommReview(int reviewNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	//액티비티 리뷰 삭제
	@Override
	public int deleteActivityReview(int reviewNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
	
	
	
	
	//비밀번호 체크
	@Override
	public String checkPwd(Member m) {
		return memberDao.checkPwd(m, sqlSession);
	}
	
	//비밀번호 변경
	@Override
	public int memberUpdatePwd(Member m) {
		return memberDao.memberUpdatePwd(m, sqlSession);
	}

	//회원 정보 수정
	@Override
	public int memberUpdate(Member m) {
		return memberDao.memberUpdate(m, sqlSession);
	}

	//회원탈퇴
	@Override
	public int memberDelete(int memNo) {
		return memberDao.memberDelete(memNo, sqlSession);
	}
	
	//찜한 숙소 리스트 조회
	@Override
	public ArrayList<AccommWish> wishAccommList(int memNo) {
		return memberDao.wishAccommList(memNo, sqlSession);
	}

	//찜한 숙소 삭제
	@Override
	public int deleteWishAccomm(AccommWish aw) {
		return memberDao.deleteWishAccomm(aw, sqlSession);
	}

	//찜한 액티비티
	@Override
	public ArrayList<ActivityWish> wishActivityList(int memNo) {
		return memberDao.wishActivityList(memNo, sqlSession);
	}
	//찜한 액티비티 삭제
	@Override
	public int deleteWishActivity(ActivityWish aw) {
		return memberDao.deleteWishActivity(aw, sqlSession);
	}
	
	//플래너 리스트 조회
	@Override
	public ArrayList<Planner> plannerList(int memNo) {
		return memberDao.plannerList(memNo, sqlSession);
	}

	//플래너 생성
	@Override
	public int insertPlanner(Planner pl) {
		return memberDao.insertPlanner(pl, sqlSession);
	}
	
	//플래너 멤버 추가
	@Override
	public int insertPlannerMem(int memNo) {
		return memberDao.insertPlannerMem(memNo, sqlSession);
	}
	
	//플래너 수정 전 조회
	@Override
	public Planner selectPlanner(Planner pl) {
		return memberDao.selectPlanner(pl, sqlSession);
	}
	
	
	//플래너 수정
	@Override
	public int updatePlanner(Planner pl) {
		return memberDao.updatePlanner(pl, sqlSession);
	}
	
	//플래너 속 플랜 삭제
	@Override
	public int deletePlan(Planner pl) {
		// TODO Auto-generated method stub
		return 0;
	}

	//플래너 삭제
	@Override
	public int deletePlanner(Planner pl) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	//플래너 상세페이지
	@Override
	public ArrayList<Plan> planDetailView(int plannerNo) {
		return memberDao.planDetailView(plannerNo, sqlSession);
	}
	
	//일행이 중복되는 지 판단
	@Override
	public int planMemSelect(PlannerMem pm) {
		return memberDao.planMemSelect(pm, sqlSession);
	}

	//일행과 함께 여행가기
	@Override
	public int planAddMem(PlannerMem pm) {
		return memberDao.planAddMem(pm, sqlSession);
	}
	
	//일정 추가 
	@Override
	public int insertPlan(Plan p) {
		return memberDao.insertPlan(p, sqlSession);
	}

	//일정 수정 전 조회
	@Override
	public Plan selectPlan(int planNo) {
		return memberDao.selectPlan(planNo, sqlSession);
	}
	
	//일정 수정
	@Override
	public int updatePlan(Plan p) {
		return memberDao.updatePlan(p, sqlSession);
	}
	
	//일정 삭제 
	@Override
	public int deletePlan(int planNo) {
		return memberDao.deletePlan(planNo, sqlSession);
	}
	
	//가계부 상세페이지
	@Override
	public ArrayList<Expense> expenseView(int planNo) {
		return memberDao.expenseView(planNo, sqlSession);
	}
	
	//1/n
	@Override
	public Expense dutchTreat(int plannerNo) {
		return memberDao.dutchTreat(plannerNo, sqlSession);
	}
	
	//가계부 결제 내역 추가 
	@Override
	public int insertExpense(Expense ex) {
		return memberDao.insertExpense(ex, sqlSession);
	}
	
	//가계부 결제 내역 삭제
	@Override
	public int deleteExpense(Expense ex) {
		return memberDao.deleteExpense(ex, sqlSession);
	}
	@Override
	public int addActWish(ActivityWish aw) {
		return memberDao.addActWish(sqlSession, aw);
	}

	@Override
	public int removeActWish(ActivityWish aw) {
		return memberDao.removeActWish(sqlSession, aw);
	}

	@Override
	public int addAcWish(AccommWish aw) {
		return memberDao.addAcWish(sqlSession, aw);
	}

	@Override
	public int removeAcWish(AccommWish aw) {
		return memberDao.removeAcWish(sqlSession, aw);
	}































}

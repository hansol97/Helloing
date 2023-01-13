package com.jl.helloing.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jl.helloing.common.model.vo.Cert;
import com.jl.helloing.member.model.vo.AccommWish;
import com.jl.helloing.member.model.vo.ActivityWish;
import com.jl.helloing.member.model.vo.Expense;
import com.jl.helloing.member.model.vo.Member;
import com.jl.helloing.member.model.vo.Plan;
import com.jl.helloing.member.model.vo.Planner;
import com.jl.helloing.member.model.vo.PlannerMem;

@Repository
public class MemberDao {
	
	// 승준
	public Member loginMember(Member m, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	public int insertMember(Member m, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	public void insertSecret(SqlSessionTemplate sqlSession, Cert cert) {
		sqlSession.insert("memberMapper.insertSecret", cert);
	}
	public boolean validate(SqlSessionTemplate sqlSession, Cert cert) {
		
		
		Cert result = sqlSession.selectOne("memberMapper.validate", cert);
		// 값이 들어왔으면 DB에서 날려야 한다.
		if(result != null) {
			sqlSession.delete("memberMapper.remove", cert);
		}
		
		return result != null;// true, false를 돌려준다 , null이 아니면 true, null이면 false
	}
	
	public int idCheck(SqlSession sqlSession, String checkId) {
		return sqlSession.selectOne("memberMapper.")
	}
	
	//혜진
	public String checkPwd(Member m, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.checkPwd", m);
	}

	public int memberUpdatePwd(Member m, SqlSessionTemplate sqlSession) {
		return sqlSession.update("memberMapper.memberUpdatePwd", m);
	}

	public int memberUpdate(Member m, SqlSessionTemplate sqlSession) {
		return sqlSession.update("memberMapper.memberUpdate", m);
	}
	
	public ArrayList<AccommWish> wishAccommList(int memNo, SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("memberMapper.wishAccommList", memNo);
	}
	
	public int deleteWishAccomm(AccommWish aw, SqlSessionTemplate sqlSession) {
		return sqlSession.delete("memberMapper.deleteWishAccomm", aw);
	}

	public ArrayList<ActivityWish> wishActivityList(int memNo, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.wishActivityList", memNo);
	}

	public int deleteWishActivity(ActivityWish aw, SqlSessionTemplate sqlSession) {
		return sqlSession.delete("memberMapper.deleteWishActivity", aw);
	}

	public ArrayList<Planner> plannerList(int memNo, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.plannerList", memNo);
	}

	public int insertPlanner(Planner pl, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("memberMapper.insertPlanner", pl);
	}
	
	public int insertPlannerMem(int memNo, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("memberMapper.insertPlannerMem", memNo);
	}

	public Planner selectPlanner(Planner pl, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectPlanner", pl);
	}

	public int updatePlanner(Planner pl, SqlSessionTemplate sqlSession) {
		return sqlSession.update("memberMapper.updatePlanner", pl);
	}

	public ArrayList<Plan> planDetailView(int plannerNo, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.planDetailView", plannerNo);
	}

	public int planAddMem(PlannerMem pm, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("memberMapper.planAddMem", pm);
	}

	public int planMemSelect(PlannerMem pm, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.planMemSelect", pm);
	}

	public int insertPlan(Plan p, SqlSessionTemplate sqlSession) {
		System.out.println(p);
		return sqlSession.insert("memberMapper.insertPlan", p);
	}
	
	public Plan selectPlan(int planNo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectPlan", planNo);
	}
	
	public int updatePlan(Plan p, SqlSessionTemplate sqlSession) {
		return sqlSession.update("memberMapper.updatePlan", p);
	}
	
	public int deletePlan(int planNo, SqlSessionTemplate sqlSession) {
		return sqlSession.delete("memberMapper.deletePlan", planNo);
	}
	
	public ArrayList<Expense> expenseView(int planNo, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.expenseView", planNo);
	}
	
	public Expense dutchTreat(int plannerNo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.dutchTreat", plannerNo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//혜진 끝

	public int addActWish(SqlSessionTemplate sqlSession, ActivityWish aw) {
		return sqlSession.insert("memberMapper.addActWish", aw);
	}
	
	public int removeActWish(SqlSessionTemplate sqlSession, ActivityWish aw) {
		return sqlSession.delete("memberMapper.removeActWish", aw);
	}






}

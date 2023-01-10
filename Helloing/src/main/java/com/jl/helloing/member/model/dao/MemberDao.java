package com.jl.helloing.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jl.helloing.member.model.vo.AccommWish;
import com.jl.helloing.member.model.vo.ActivityWish;
import com.jl.helloing.member.model.vo.Member;

@Repository
public class MemberDao {

	public Member loginMember(Member m, SqlSessionTemplate sqlSession) {
		Member loginUser = sqlSession.selectOne("memberMapper.loginMember", m);
		System.out.println(loginUser);
		return loginUser;
	}
	
	public int insertMember(Member m, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("memberMapper.insertMember", m);
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
}

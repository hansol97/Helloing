package com.jl.helloing.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
}

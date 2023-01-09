package com.jl.helloing.admin.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jl.helloing.admin.model.vo.Chatbot;

@Repository
public class AdminDao {
	
	public int selectChatbotQ(SqlSessionTemplate sqlSession, Chatbot c) {
		return sqlSession.selectOne("adminMapper.selectChatbotQ", c);
	}
	
	public int insertChatbot(SqlSessionTemplate sqlSession, Chatbot c) {
		return sqlSession.insert("adminMapper.insertChatbot", c);
	}

}

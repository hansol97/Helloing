package com.jl.helloing.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jl.helloing.admin.model.vo.Chatbot;
import com.jl.helloing.common.model.vo.PageInfo;

@Repository
public class AdminDao {
	
	public int selectChatbotQ(SqlSessionTemplate sqlSession, Chatbot c) {
		return sqlSession.selectOne("adminMapper.selectChatbotQ", c);
	}
	
	public int insertChatbot(SqlSessionTemplate sqlSession, Chatbot c) {
		return sqlSession.insert("adminMapper.insertChatbot", c);
	}
	
	public int selecChatbottListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selecChatbottListCount");
	}
	
	public ArrayList<Chatbot> selectChatbotList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectChatbotList", null, rowBounds);
	}
	
	public Chatbot chatbotUpdateForm(SqlSessionTemplate sqlSession, String originChatbotQ) {
		return sqlSession.selectOne("adminMapper.chatbotUpdateForm", originChatbotQ);
	}

}

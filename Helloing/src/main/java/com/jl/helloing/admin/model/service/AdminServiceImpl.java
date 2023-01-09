package com.jl.helloing.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jl.helloing.admin.model.dao.AdminDao;
import com.jl.helloing.admin.model.vo.Chatbot;
import com.jl.helloing.common.model.vo.PageInfo;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertChatbot(Chatbot c) {
		
		int comResult = adminDao.selectChatbotQ(sqlSession, c);
		
		if(comResult < 1) {
			int result = adminDao.insertChatbot(sqlSession, c);
			return result;
		} else {
			return 0;
		}
	}
	
	@Override
	public int selectChatbotListCount() {
		return adminDao.selecChatbottListCount(sqlSession);
	}

	@Override
	public ArrayList<Chatbot> selectChatbotList(PageInfo pi) {
		return adminDao.selectChatbotList(sqlSession, pi);
	}

	@Override
	public Chatbot chatbotUpdateForm(String originChatbotQ) {
		return adminDao.chatbotUpdateForm(sqlSession, originChatbotQ);
	}

	@Override
	public int updateChatbot(Chatbot c) {
		return 0;
	}

	@Override
	public int deleteChatbot(String chatbotQ) {
		return 0;
	}


	

}

package com.jl.helloing.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jl.helloing.admin.model.dao.AdminDao;
import com.jl.helloing.admin.model.vo.Chatbot;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertChatbot(Chatbot c) {
		return 0;
	}

	@Override
	public ArrayList<Chatbot> selectChatbotList() {
		return null;
	}

	@Override
	public Chatbot updateFormChatbot(String chatbotQ) {
		return null;
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

package com.jl.helloing.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public int updateChatbot(Chatbot c) {
		int comResult = adminDao.selectChatbotQUpdate(sqlSession, c);
		
		if(comResult < 1) {
			int result = adminDao.updateChatbot(sqlSession, c);
			return result;
		} else {
			return 0;
		}
	}

	@Override
	@Transactional
	public int deleteChatbot(List<String> cbox) {
		
		int result = 1;
		
		for(int i = 0; i < cbox.size(); i++) {
			result *= adminDao.deleteChatbot(sqlSession, cbox.get(i));
		}
		
		return result;
	}
	
	@Override
	public int selectSearchChatbotCount(HashMap map) {
		return adminDao.selectSearchChatbotCount(sqlSession, map);
	}

	@Override
	public ArrayList<Chatbot> searchChatbot(HashMap map) {
		return adminDao.searchChatbot(sqlSession, map);
	}

	

	
	

}

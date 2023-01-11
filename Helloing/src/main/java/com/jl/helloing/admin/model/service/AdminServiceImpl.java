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
import com.jl.helloing.member.model.vo.Member;

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
	public ArrayList<Chatbot> searchChatbot(PageInfo pi, HashMap<String, String> map) {
		return adminDao.searchChatbot(sqlSession, pi, map);
	}

	@Override
	public ArrayList<Chatbot> selectChatbotA(HashMap<String, Object> map) {
		return adminDao.selectChatbotA(sqlSession, map);
	}
	
	@Override
	public int selectMemListCount() {
		return adminDao.selectMembListCount(sqlSession);
	}

	@Override
	public ArrayList<Member> selectMemberList(PageInfo pi) {
		return adminDao.selectMemberList(sqlSession, pi);
	}

	@Override
	public int deleteMember(int memNo) {
		return 0;
	}

	

	

	
	

}

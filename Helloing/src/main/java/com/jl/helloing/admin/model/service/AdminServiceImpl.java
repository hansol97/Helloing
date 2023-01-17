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
import com.jl.helloing.business.model.vo.Business;
import com.jl.helloing.business.model.vo.BusinessPayment;
import com.jl.helloing.common.model.vo.PageInfo;
import com.jl.helloing.member.model.vo.Member;
import com.jl.helloing.product.model.vo.RoomPayment;
import com.jl.helloing.product.model.vo.Ticket;
import com.jl.helloing.product.model.vo.TicketPayment;

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
		return adminDao.deleteMember(sqlSession, memNo);
	}

	@Override
	public int selectBusiListCount() {
		return adminDao.selectBusiListCount(sqlSession);
	}

	@Override
	public ArrayList<Business> selectBusinessList(PageInfo pi) {
		return adminDao.selectBusinessList(sqlSession, pi);
	}

	@Override
	public int selectSearchMemListCount(HashMap map) {
		return adminDao.selectSearchMemListCount(sqlSession, map);
	}

	@Override
	public ArrayList<Member> searchMemList(PageInfo pi, HashMap map) {
		return adminDao.searchMemList(sqlSession, pi, map);
	}

	@Override
	public int selectBusiPayListCount() {
		return adminDao.selectBusiPayListCount(sqlSession);
	}

	@Override
	public ArrayList<BusinessPayment> selectBusiPayList(PageInfo pi) {
		return adminDao.selectBusiPayList(sqlSession, pi);
	}

	@Override
	public int searchBusiPayListCount(String keyword) {
		return adminDao.searchBusiPayListCount(sqlSession, keyword);
	}

	@Override
	public ArrayList<BusinessPayment> searchBusiPayList(PageInfo pi, String keyword) {
		return adminDao.searchBusiPayList(sqlSession, pi, keyword);
	}

	@Override
	public int selectRoomPayListCount() {
		return adminDao.selectRoomPayListCount(sqlSession);
	}

	@Override
	public ArrayList<RoomPayment> selectRoomPayList(PageInfo pi) {
		return adminDao.selectRoomPayList(sqlSession, pi);
	}

	@Override
	public int searchRoomPayListCount(String keyword) {
		return adminDao.searchRoomPayListCount(sqlSession, keyword);
	}

	@Override
	public ArrayList<RoomPayment> searchRoomPayList(PageInfo pi, String keyword) {
		return adminDao.searchRoomPayList(sqlSession, pi, keyword);
	}

	@Override
	public int selectActPayListCount() {
		return adminDao.selectActPayListCount(sqlSession);
	}

	@Override
	public ArrayList<TicketPayment> selectActPaymentList(PageInfo pi) {
		return adminDao.selectActPaymentList(sqlSession, pi);
	}

	@Override
	public ArrayList<Ticket> selectTicketList(int orderNo) {
		return adminDao.selectTicketList(sqlSession, orderNo);
	}

	@Override
	public int searchBusiListCount(HashMap map) {
		return adminDao.searchBusiListCount(sqlSession, map);
	}

	@Override
	public ArrayList<Business> searchBusinessList(PageInfo pi, HashMap map) {
		return adminDao.searchBusinessList(sqlSession, pi, map);
	}

	

	
	

	

	
	

}

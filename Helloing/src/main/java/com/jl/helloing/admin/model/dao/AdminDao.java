package com.jl.helloing.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jl.helloing.admin.model.vo.Chatbot;
import com.jl.helloing.business.model.vo.Business;
import com.jl.helloing.business.model.vo.BusinessPayment;
import com.jl.helloing.common.model.vo.PageInfo;
import com.jl.helloing.member.model.vo.Member;
import com.jl.helloing.product.model.vo.RoomPayment;
import com.jl.helloing.product.model.vo.Ticket;
import com.jl.helloing.product.model.vo.TicketPayment;

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
	
	public int selectChatbotQUpdate(SqlSessionTemplate sqlSession, Chatbot c) {
		return sqlSession.selectOne("adminMapper.selectChatbotQUpdate", c);
	}
	
	public int updateChatbot(SqlSessionTemplate sqlSession, Chatbot c) {
		return sqlSession.update("adminMapper.updateChatbot", c);
	}
	
	public int deleteChatbot(SqlSessionTemplate sqlSession, String chatbotQ) {
		return sqlSession.delete("adminMapper.deleteChatbot", chatbotQ);
	}
	
	public int selectSearchChatbotCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminMapper.selectSearchChatbotCount", map);
	}
	
	public ArrayList<Chatbot> searchChatbot(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map){
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.searchChatbot", map, rowBounds);
	}
	
	public ArrayList<Chatbot> selectChatbotA(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectChatbotA", map);
	}

	public int selectMembListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectMemListCount");
	}
	
	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession, PageInfo pi){
			int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectMemberList", null, rowBounds);
	}
	
	public int deleteMember(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.update("adminMapper.deleteMember", memNo);
	}

	public int selectBusiListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectBusiListCount");
	}

	public ArrayList<Business> selectBusinessList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectBusinessList", null, rowBounds);
	}

	
	public int selectSearchMemListCount(SqlSessionTemplate sqlSession, HashMap map) {
		return sqlSession.selectOne("adminMapper.selectSearchMemListCount", map);
	}

	public ArrayList<Member> searchMemList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap map) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.searchMemList", map, rowBounds);
	}

	public int selectBusiPayListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectBusiPayListCount");
	}

	public ArrayList<BusinessPayment> selectBusiPayList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectBusiPayList");
	}

	public int searchBusiPayListCount(SqlSessionTemplate sqlSession, String keyword) {
		return sqlSession.selectOne("adminMapper.searchBusiPayListCount", keyword);
	}
	
	public ArrayList<BusinessPayment> searchBusiPayList(SqlSessionTemplate sqlSession, PageInfo pi, String keyword){
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.searchBusiPayList", keyword, rowBounds);
	}

	public int selectRoomPayListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectRoomPayListCount");
	}

	public ArrayList<RoomPayment> selectRoomPayList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectRoomPayList", null, rowBounds);
	}

	public int searchRoomPayListCount(SqlSessionTemplate sqlSession, String keyword) {
		return sqlSession.selectOne("adminMapper.searchRoomPayListCount", keyword);
	}

	public ArrayList<RoomPayment> searchRoomPayList(SqlSessionTemplate sqlSession, PageInfo pi, String keyword) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.searchRoomPayList", keyword, rowBounds);
	}

	public int selectActPayListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectActPayListCount");
	}

	public ArrayList<TicketPayment> selectActPaymentList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectActPaymentList", null, rowBounds);
	}

	public ArrayList<Ticket> selectTicketList(SqlSessionTemplate sqlSession, int orderNo) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectTicketList", orderNo);
	}

	public int searchBusiListCount(SqlSessionTemplate sqlSession, HashMap map) {
		return sqlSession.selectOne("adminMapper.searchBusiListCount", map);
	}

	public ArrayList<Business> searchBusinessList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap map) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.searchBusinessList", map, rowBounds);
	}


}

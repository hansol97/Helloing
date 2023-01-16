package com.jl.helloing.business.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jl.helloing.business.model.dao.BusinessDao;
import com.jl.helloing.business.model.vo.Business;
import com.jl.helloing.business.model.vo.BusinessPayment;
import com.jl.helloing.common.model.vo.Attachment;
import com.jl.helloing.product.model.vo.Accomm;
import com.jl.helloing.product.model.vo.Activity;
import com.jl.helloing.product.model.vo.Room;
import com.jl.helloing.product.model.vo.RoomPayment;
import com.jl.helloing.product.model.vo.Ticket;

@Service
public class BusinessServiceImpl implements BusinessService {
	
	@Autowired
	private BusinessDao businessDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 승준
	// 파트너 기업 등록
	@Override
	public int insertCompany(Business b) {
		return businessDao.insertCompany(b, sqlSession);
	}
	
	// 파트너 기업 로그인
	@Override
	public Business loginCompany(int memNo) {
		return businessDao.loginCompany(memNo, sqlSession);
	}

	
	
	
	
	
	//인호 --------------------------------------------------------------------------------------------
	// 인서트 숙소 세트 
	@Override
	public int insertAccom(Accomm acc) {
		return businessDao.insertAccom(acc, sqlSession);
	}

	@Override
	public int insertAccomPhoto(ArrayList<Attachment> list) {
		return businessDao.insertAccomPhoto(list, sqlSession);
	}

	// 인서트 액티비티 세트
	@Override
	public int InsertAct(Activity act) {
		return businessDao.insertAct(act, sqlSession);
	}

	@Override
	public int InsertActPhoto(ArrayList<Attachment> list) {
		return businessDao.insertActPhoto(list, sqlSession);
	}

	@Override
	public int InsertRoom(Room room) {
		return businessDao.insertRoom(room, sqlSession);
	}

	@Override
	public int InsertRoomPhoto(ArrayList<Attachment> list) {
		return businessDao.insertRoomPhoto(list, sqlSession);
	}
	// 티켓 등록
	@Override
	public int insertTicket(Ticket t) {
		return businessDao.insertTicket(t, sqlSession);
	}

	@Override
	public int updateBusinessMember(Business loginCompany) {
		return businessDao.updateBusinessMember(sqlSession, loginCompany);
	}

	// 숙소리스트 조회
	@Override
	public ArrayList<Accomm> selectAccommList(String businessNo) {
		return businessDao.selectAccommList(sqlSession, businessNo);
	}
	// 숙소에 딸린 방 리스트 조회
	@Override
	public ArrayList<Room> selectRoomList(int accommNo) {
		return businessDao.selectRoomList(sqlSession, accommNo);
	}

	@Override
	public ArrayList<Activity> selectActivityList(String businessNo) {
		return businessDao.selectActivityList(sqlSession, businessNo);
	}

	@Override
	public ArrayList<Ticket> selectTicketList(int activityNo) {
		return businessDao.selectTicketList(sqlSession, activityNo);
	}
	
	@Override
	public int updateBusinessPayment(BusinessPayment bp) {
		return businessDao.updateBusinessPayment(sqlSession, bp);
	}
	
	@Override
	public int updateAccommEndDate(int accommNo) {
		return businessDao.updateAccommEndDate(sqlSession, accommNo);
	}
	
	@Override
	public int updateActivityEndDate(int activityNo) {
		return businessDao.updateActivityEndDate(sqlSession, activityNo);
	}
	
	@Override
	public int deleteAccomm(int accommNo) {
		return businessDao.deleteAccomm(sqlSession, accommNo);
	}
	
	
	
	
	
	
	
	
	
	//---------------------------------------------------------------
	@Override
	public ArrayList<RoomPayment> checkBookDate(int roomNo) {
		return businessDao.checkBookDate(sqlSession, roomNo);
	}

	@Override
	public RoomPayment selectBookInfo(RoomPayment rp) {
		return businessDao.selectBookInfo(sqlSession, rp);
	}








	
	
	
	
	
	
}
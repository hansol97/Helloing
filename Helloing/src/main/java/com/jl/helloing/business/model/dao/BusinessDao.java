package com.jl.helloing.business.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jl.helloing.business.model.vo.Business;
import com.jl.helloing.business.model.vo.BusinessPayment;
import com.jl.helloing.common.model.vo.Attachment;
import com.jl.helloing.product.model.vo.Accomm;
import com.jl.helloing.product.model.vo.Activity;
import com.jl.helloing.product.model.vo.Room;
import com.jl.helloing.product.model.vo.RoomPayment;
import com.jl.helloing.product.model.vo.Ticket;

@Repository
public class BusinessDao {

	public int insertCompany(Business b, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("businessMapper.insertCompany", b);
	}

	
	// 숙소 등록ih
	public int insertAccom(Accomm acc,  SqlSessionTemplate sqlSession) {
		return sqlSession.insert("productMapper.insertAccom", acc);
	}
	// 숙소 사진 등록ih
	public int insertAccomPhoto(ArrayList<Attachment> list, SqlSessionTemplate sqlSession) {

		return sqlSession.insert("productMapper.insertAccomPhoto", list);
	}
	// 승준이의 기업회원로그인
	public Business loginCompany(int memNo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("businessMapper.loginCompany", memNo);
	}

	// 액티비티 등록
	public int insertAct(Activity act, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("productMapper.insertAct", act);
	}


	public int insertActPhoto(ArrayList<Attachment> list, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("productMapper.insertActPhoto", list);
	}


	public int insertRoom(Room room, SqlSessionTemplate sqlSession) {
		System.out.println(room);
		return sqlSession.insert("productMapper.insertRoom", room);
	}


	public int insertRoomPhoto(ArrayList<Attachment> list, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("productMapper.insertRoomPhoto", list);
	}


	public int updateBusinessMember(SqlSessionTemplate sqlSession, Business loginCompany) {
		return sqlSession.update("businessMapper.updateBusinessMember", loginCompany);
	}


	public int insertTicket(Ticket t, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("productMapper.insertTicket", t);
	}

	// 숙소 리스트 뽑아오기
	public ArrayList<Accomm> selectAccommList(SqlSessionTemplate sqlSession, String businessNo) {
		return (ArrayList)sqlSession.selectList("productMapper.selectAccommListBu", businessNo);
	}

	// 숙소에 딸린 방 리스트 뽑아오기
	public ArrayList<Room> selectRoomList(SqlSessionTemplate sqlSession, int accommNo) {
		ArrayList<Room> rl = (ArrayList)sqlSession.selectList("productMapper.selectRoomListBu", accommNo);
		System.out.println("Dao 구역에서 몹은 룸리스트 : " +rl);
		return rl;
	}
	
	// 액티비티 리스트 뽑아오기
	public ArrayList<Activity> selectActivityList(SqlSessionTemplate sqlSession, String businessNo) {
		return (ArrayList)sqlSession.selectList("productMapper.selectActivityListBu", businessNo);
	}

	// 액티비티에 딸린 티켓 리스트 뽑아오기
	public ArrayList<Ticket> selectTicketList(SqlSessionTemplate sqlSession, int activityNo) {
		return (ArrayList)sqlSession.selectList("productMapper.selectTicketListBu", activityNo);
	}

	// bp 보내서  BUSINESS_PAYMENT테이블 INSERT	- 반환값 int  / ACCOMM/ACTIVITY 같이쓴다.
	public int updateBusinessPayment(SqlSessionTemplate sqlSession, BusinessPayment bp) {
		return sqlSession.update("businessMapper.updateBusinessPayment", bp);
	}

	// accommNo 보내서 ACCOMM 테이블의 만료일자 업데이트 (END_DATE + 1년) - UPDATE - 반환값 int
	public int updateAccommEndDate(SqlSessionTemplate sqlSession, int accommNo) {
		return sqlSession.update("businessMapper.updateAccommEndDate", accommNo);
	}
	// activityNo 보내서 ACTIVITY 테이블의 만료일자 업데이트 (END_DATE + 1년) - UPDATE - 반환값 int
	public int updateActivityEndDate(SqlSessionTemplate sqlSession, int activityNo) {
		return sqlSession.update("businessMapper.updateActivityEndDate", activityNo);
	}

	// 숙소 지우기 status = n
	public int deleteAccomm(SqlSessionTemplate sqlSession, int accommNo) {
		return sqlSession.update("businessMapper.deleteAccomm", accommNo);
	}


	
	
	
	
	
	
	
	public ArrayList<RoomPayment> checkBookDate(SqlSessionTemplate sqlSession, int roomNo) {
		return (ArrayList)sqlSession.selectList("businessMapper.checkBookDate", roomNo);
	}


	public RoomPayment selectBookInfo(SqlSessionTemplate sqlSession, RoomPayment rp) {
		return sqlSession.selectOne("businessMapper.selectBookInfo", rp);
	}







	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

package com.jl.helloing.business.model.service;

import java.util.ArrayList;

import com.jl.helloing.business.model.vo.Business;
import com.jl.helloing.business.model.vo.BusinessPayment;
import com.jl.helloing.common.model.vo.Attachment;
import com.jl.helloing.product.model.vo.Accomm;
import com.jl.helloing.product.model.vo.Activity;
import com.jl.helloing.product.model.vo.Room;
import com.jl.helloing.product.model.vo.RoomPayment;
import com.jl.helloing.product.model.vo.Ticket;

public interface BusinessService {
	// 파트너 기업 등록
	int insertCompany(Business b);
	
	Business loginCompany(int memNo);
	


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//인호 ---------------------------------------------------------------------------
	// 숙소 등록
	
	int insertAccom(Accomm acc);

	int insertAccomPhoto(ArrayList<Attachment> list);

	int InsertAct(Activity act);

	int InsertActPhoto(ArrayList<Attachment> list);


	int InsertRoom(Room room);

	int InsertRoomPhoto(ArrayList<Attachment> list);

	int updateBusinessMember(Business loginCompany);

	int insertTicket(Ticket t);

	ArrayList<Accomm> selectAccommList(String businessNo);

	ArrayList<Room> selectRoomList(int accommNo);

	ArrayList<Activity> selectActivityList(String businessNo);

	ArrayList<Ticket> selectTicketList(int activityNo);
	
	int updateBusinessPayment(BusinessPayment bp);

	int updateAccommEndDate(int accommNo);
	
	int updateActivityEndDate(int activityNo);
	
	int deleteAccomm(int accommNo);
	
	int deleteActivity(int activityNo);
	
	int deleteRoom(int roomNo);
	
	int deleteTicket(int ticketNo);
	
	int deleteRoomA(int accommNo);
	
	
	

	//인호 ---------------------------------------------------------------------------

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// ---------------------------------------------
	ArrayList<RoomPayment> checkBookDate(int roomNo);

	RoomPayment selectBookInfo(RoomPayment rp);











	
	

}

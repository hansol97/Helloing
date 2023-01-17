package com.jl.helloing.product.model.service;

import java.util.ArrayList;
import java.util.List;

import com.jl.helloing.common.model.vo.Attachment;
import com.jl.helloing.member.model.vo.AccommWish;
import com.jl.helloing.member.model.vo.ActivityWish;
import com.jl.helloing.product.model.vo.Accomm;
import com.jl.helloing.product.model.vo.AccommReview;
import com.jl.helloing.product.model.vo.Activity;
import com.jl.helloing.product.model.vo.ActivityReview;
import com.jl.helloing.product.model.vo.Room;
import com.jl.helloing.product.model.vo.RoomPayment;
import com.jl.helloing.product.model.vo.Ticket;
import com.jl.helloing.product.model.vo.TicketPayment;

public interface ProductService {
	
	// 액티비티 전체 조회(메인페이지)
	ArrayList<Activity> selectActList();
	
	// 액티비티 상세 조회
	Activity selectActDetail(int activityNo);
	// 티켓 조회
	ArrayList<Ticket> selectTicketList(int activityNo);
	// 액티비티에 달린 리뷰 조회
	ArrayList<ActivityReview> selectReviewList(int activityNo);
	// 회원이 액티비티 위시리스트에 추가한지 확인
	ActivityWish checkActWish(ActivityWish aw);
	
	// 티켓 구매하기
	int insertTicketPayment(List<TicketPayment> list);
	
	// 숙소 전체 조회(메인페이지)
	ArrayList<Accomm> selectAcList();
	
	// 숙소 상세 조회
	Accomm selectAcDetail(int accommNo);
	// 첨부파일들 조회
	ArrayList<Attachment> selectPhotoList(int accommNo);
	// 객실 조회
	ArrayList<Room> selectRoomList(int accommNo);
	// 숙소에 달린 리뷰 조회
	ArrayList<AccommReview> selectAcReviewList(int accommNo);
	// 회원이 숙소 위시에 추가한지 확인
	AccommWish checkAcWish(AccommWish aw);
	
	// 숙소 결제하기
	int insertRoomPayment(RoomPayment rp);
	
	
	// 숙소 검색
	ArrayList<Accomm> searchAccomm(Accomm ac);
	
	// 액티비티 검색
	ArrayList<Activity> searchActivity(String keyword);
	
	// 숙소 첨부파일들 조회
	ArrayList<Attachment> selectActPhotoList(int activityNo);

}
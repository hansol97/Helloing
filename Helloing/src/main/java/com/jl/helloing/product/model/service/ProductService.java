package com.jl.helloing.product.model.service;

import java.util.ArrayList;

import com.jl.helloing.product.model.vo.Activity;
import com.jl.helloing.product.model.vo.ActivityReview;
import com.jl.helloing.product.model.vo.Ticket;

public interface ProductService {
	
	// 액티비티 전체 조회(메인페이지)
	ArrayList<Activity> selectActList();
	// 전체 조회할 때 필요한 해당 액티비티 티켓 최저가
	int actTicketRowPrice(int activityNo); 
	
	// 액티비티 상세 조회
	Activity selectActDetail(int activityNo);
	// 티켓 조회
	ArrayList<Ticket> selectTicketList(int activityNo);
	// 액티비티에 달린 리뷰 조회
	ArrayList<ActivityReview> selectReviewList(int activityNo);
}

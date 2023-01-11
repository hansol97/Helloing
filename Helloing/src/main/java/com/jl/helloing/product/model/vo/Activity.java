package com.jl.helloing.product.model.vo;

import lombok.Data;

@Data
public class Activity {

	private int activityNo;
	private String activityName;
	private String businessNo;
	private String activityContent;
	private String endDate;
	
	private double avg; // 별점 평균
	private int reviewCount; // 리뷰 갯수
	private int rowPrice; // 가장 낮은 티켓 가격  
	
	// 별점의 각 개수들
	private int star1;
	private int star2;
	private int star3;
	private int star4;
	private int star5;
}

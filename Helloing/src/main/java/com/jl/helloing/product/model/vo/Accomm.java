package com.jl.helloing.product.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class Accomm {

	private int accommNo;
	private String businessNo;
	private String accommName;
	private String address;
	private String lat;
	private String lng;
	private int grade;
	private String refund;
	private String checkInout;
	private String endDate;
	private String accommContent;
	private String category;
	private String status;
	
	private double avg; // 별점 평균
	private int reviewCount; // 리뷰 개수
	private int rowPrice; // 가장 낮은 객실 가격
	
	// 별점 각 개수들
	private int star1;
	private int star2;
	private int star3;
	private int star4;
	private int star5;

	// 객실리스트를 추가하기 위한 변수
	private ArrayList<Room> roomList;
	
	//첨부파일
	private String attachment;
	private String checkIn;
	private String checkOut;
	private String filePath;

}

//ACCOMM_NO	NUMBER
//BUSINESS_NO	NUMBER
//ACCOMM_NAME	VARCHAR2(100 BYTE)
//ADDRESS	 VARCHAR2(500 BYTE)
//LAT 	VARCHAR2(30 BYTE)
//LNG	VARCHAR2(30 BYTE)
//GRADE	 NUMBER
//REFUND	VARCHAR2(1000 BYTE)
//CHECKINOUT	VARCHAR2(500 BYTE)
//END_DATE	DATE
//ACCOMM_CONTENT	VARCHAR2(2000 BYTE)
//CATEGORY	VARCHAR2(20 BYTE)
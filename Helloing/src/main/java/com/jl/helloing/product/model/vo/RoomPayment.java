package com.jl.helloing.product.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class RoomPayment {
	
	private int orderNo; // "ORDER_NO"	NUMBER		PRIMARY KEY,
	private int memNo; // "MEM_NO"	NUMBER		NOT NULL,
	private String startDate; // "START_DATE"	DATE		NOT NULL,
	private String endDate; // "END_DATE"	DATE		NOT NULL,
	private int headCount; // "HEAD_COUNT"	NUMBER		NOT NULL,
	private int price; // "PLACE"	NUMBER		NOT NULL,
	private int accommNo; // "ACCOMM_NO"	NUMBER		NOT NULL,
	private int roomNo; // "ROOM_NO"	NUMBER		NOT NULL,
    private String paymentDate; // "PAYMENT_DATE" DATE DEFAULT SYSDATE,
    private String chooseDate; 
    private String accName; // 숙소이름
    private String roomName; // 객실이름
    private String memName;
    private String category;
    private String status;
    private String filePath;
    
    private String checkIn;
    private String checkOut;
    private int day; // 숙박일
}

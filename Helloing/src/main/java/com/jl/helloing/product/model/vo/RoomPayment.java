package com.jl.helloing.product.model.vo;

import lombok.Data;

@Data
public class RoomPayment {
	
	private int orderNo; // "ORDER_NO"	NUMBER		PRIMARY KEY,
	private int memNo; // "MEM_NO"	NUMBER		NOT NULL,
	private String startDate; // "START_DATE"	DATE		NOT NULL,
	private String endDate; // "END_DATE"	DATE		NOT NULL,
	private int headCount; // "HEAD_COUNT"	NUMBER		NOT NULL,
	private int place; // "PLACE"	NUMBER		NOT NULL,
	private int accommNo; // "ACCOMM_NO"	NUMBER		NOT NULL,
	private int roomNo; // "ROOM_NO"	NUMBER		NOT NULL,
    private String paymentDate; // "PAYMENT_DATE" DATE DEFAULT SYSDATE,
}

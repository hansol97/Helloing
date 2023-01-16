package com.jl.helloing.product.model.vo;

import lombok.Data;

@Data
public class Ticket {

	private int ticketNo;
	private int activityNo;
	private String ticketName;
	private int capacity;
	private int price;
	private String startDate;
	private String endDate;
	private int count;
}
//TICKET_NO	NUMBER
//ACTIVITY_NO	NUMBER
//TICKET_NAME	VARCHAR2(1000 BYTE)
//CAPACITY	NUMBER
//PRICE	NUMBER
//START_DATE	DATE
//END_DATE	DATE
//count => 사용자가 결제한 티멧 수량 
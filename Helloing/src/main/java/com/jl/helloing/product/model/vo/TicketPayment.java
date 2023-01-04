package com.jl.helloing.product.model.vo;

public class TicketPayment {
	
	private int memNo; // "MEM_NO"	NUMBER		NOT NULL,
	private int ticketNo; // "TICKET_NO"	NUMBER		NOT NULL,
	private int paymentAmount; // "PAYMENT_AMOUNT"	NUMBER		NOT NULL,
	private String status; // "STATUS"	VARCHAR2(1)	DEFAULT 'N'	NOT NULL,
	private String payment; // "PAYMENT_DATE"	DATE	DEFAULT SYSDATE,
	
}

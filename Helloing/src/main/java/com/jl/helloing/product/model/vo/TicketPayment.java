package com.jl.helloing.product.model.vo;

import lombok.Data;

@Data
public class TicketPayment {
	
	private int memNo; // "MEM_NO"	NUMBER		NOT NULL,
	private int ticketNo; // "TICKET_NO"	NUMBER		NOT NULL,
	private int paymentAmount; // "PAYMENT_AMOUNT"	NUMBER		NOT NULL,
	private String paymentDate;
	private int orderNo;
	private int count;
}
  
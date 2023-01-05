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
}

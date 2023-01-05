package com.jl.helloing.business.model.vo;

import lombok.Data;

@Data
public class BusinessPayment {

	private int paymentNo; //PAYMENT_NO	NUMBER
	private int businessNo; //BUSINESS_NO	NUMBER
	private int paymentAmount; //PAYMENT_AMOUNT	NUMBER
	private int accommNo; //ACCOMM_NO	NUMBER
	private int activityNo; //ACTIVITY_NO	NUMBER
}

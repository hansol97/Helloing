package com.jl.helloing.business.model.vo;


import lombok.Data;

@Data
public class BusinessPayment {

	private int paymentNo; //PAYMENT_NO	NUMBER
	private String businessNo; //BUSINESS_NO	NUMBER
	private int paymentAmount; //PAYMENT_AMOUNT	NUMBER
	private int accommNo; //ACCOMM_NO	NUMBER
	private int activityNo; //ACTIVITY_NO	NUMBER
	private String accommName;
	private String activityName;
	private String actEndDate; // 액티비티 만료일자
	private String accEndDate; // 숙소 만료일자
}

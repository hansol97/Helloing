package com.jl.helloing.business.model.vo;


import lombok.Data;

@Data
public class Business {

	private String businessNo; //BUSINESS_NO	NUMBER
	private int memNo; //MEM_NO	NUMBER
	private String businessName; //BUSINESS_NAME	VARCHAR2(100 BYTE)
	private String address; //ADDRESS	VARCHAR2(1000 BYTE)
	private String businessEnrollDate; //BUSINESS_ENROLLDATE	DATE
	private String phone;
}

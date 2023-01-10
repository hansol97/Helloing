package com.jl.helloing.product.model.vo;

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
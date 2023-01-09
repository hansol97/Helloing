package com.jl.helloing.product.model.vo;

import lombok.Data;

@Data
public class AccommReview {

	private int reviewNo; //REVIEW_NO	NUMBER
	private int accommNo; //ACCOMM_NO	NUMBER
	private int memNo; //MEM_NO	NUMBER
	private int roomNo; //ROOM_NO	NUMBER
	private String reviewContent; //REVIEW_CONTENT	VARCHAR2(1000 BYTE)
	private String createDate; //CREATE_DATE	DATE
	private String tag; //TAG	VARCHAR2(1000 BYTE)
	private int Star; //STAR	NUMBER
}

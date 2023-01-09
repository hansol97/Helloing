package com.jl.helloing.product.model.vo;

import lombok.Data;

@Data
public class Accomm {

	private int accommNo;
	private int businessNo;
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

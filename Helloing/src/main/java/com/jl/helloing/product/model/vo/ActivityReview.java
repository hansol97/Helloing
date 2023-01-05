package com.jl.helloing.product.model.vo;

import lombok.Data;

@Data
public class ActivityReview {

	private int reviewNo;
	private int activityNo;
	private int ticketNo;
	private int memNo;
	private String reviewContent;
	private String createDate;
	private String tag;
	private int star;
}

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
	
	private String memName; // 리뷰 작성자 적어둘 필드 필요
	private String ticketName;
	private double avg;
	private String activityName;
	
	
	// 첨부파일
	private String originName; // 원본파일 이름
	private String filePath; // filePath + changeName 
	
	private String[] tagArr;
	private int orderNo;

}

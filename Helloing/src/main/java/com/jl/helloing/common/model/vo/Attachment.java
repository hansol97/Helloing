package com.jl.helloing.common.model.vo;

import lombok.Data;

@Data
public class Attachment {

	//참조 테이블 식별자
	private int activityNo;
	private int roomNo;
	private int accommNo;
	private int boardNo;
	
	
	//공통
	private int fileNo;
	private String originName;
	private String changeName;
	private String filePath;
	private String uploadDate;
}

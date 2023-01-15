package com.jl.helloing.common.model.vo;

import lombok.Data;

@Data
public class Attachment {

	//참조 테이블 식별자
	private int activityNo;
	private int roomNo;
	private int accommNo;
	
	
	private int boardNo; // 없어진 보드.. 이걸 과연 쓰게 될까?
	
	
	//공통
	private int fileNo;
	private String originName;
	private String changeName;
	private String filePath;
	private String uploadDate;
	
	private String attachment;
}
//FILE_NO	NUMBER
//ROOM_NO	NUMBER
//ORIGIN_NAME	VARCHAR2(100 BYTE)
//CHANGE_NAME	VARCHAR2(100 BYTE)
//FILE_PATH	VARCHAR2(1000 BYTE)
//UPLOAD_DATE	DATE
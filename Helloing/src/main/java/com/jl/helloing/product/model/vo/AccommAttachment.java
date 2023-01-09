package com.jl.helloing.product.model.vo;

import lombok.Data;

@Data
public class AccommAttachment {

	private int fileNo;	//	FILE_NO	NUMBER
	private int accommNo;	//	ACCOMM_NO	NUMBER
	private String originName;	//	ORIGIN_NAME	VARCHAR2(100 BYTE)
	private String changeName;	//	CHANGE_NAME	VARCHAR2(100 BYTE)
	private String filePath;	//	FILE_PATH	VARCHAR2(1000 BYTE)
	private String uploadDate;	//	UPLOAD_DATE	DATE
}

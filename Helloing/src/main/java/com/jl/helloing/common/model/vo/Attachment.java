package com.jl.helloing.common.model.vo;

import lombok.Data;

@Data
public class Attachment {

	private int fileNo;
	private int accommNo;
	private String originName;
	private String changeName;
	private String filePath;
	private String uploadDate;
}

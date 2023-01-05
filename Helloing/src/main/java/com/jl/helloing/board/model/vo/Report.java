package com.jl.helloing.board.model.vo;

import lombok.Data;

@Data
public class Report {

	private int reportNo; //REPORT_NO	NUMBER
	private int memNo; //MEM_NO	NUMBER
	private int reportBoard; //REPORT_BOARD	NUMBER
	private String reportReason; //REPORT_REASON	VARCHAR2(1000 BYTE)
	private String reportDate; //REPORT_DATE	DATE
	private String reportCode; //REPORT_CODE	VARCHAR2(20 BYTE)
	private String reportResult; //REPORT_RESULT	VARCHAR2(1 BYTE)
	private String reportPlus; //REPORT_PLUS	VARCHAR2(500 BYTE)
}

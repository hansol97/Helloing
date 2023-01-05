package com.jl.helloing.board.model.vo;

import lombok.Data;

@Data
public class TripBoard {

	private int boardNo; //BOARD_NO	NUMBER
	private int memNo; //MEM_NO	NUMBER
	private String boardTitle; //BOARD_TITLE	VARCHAR2(100 BYTE)
	private String boardContent; //BOARD_CONTENT	VARCHAR2(1000 BYTE)
	private String uploadDate; //UPLOAD_DATE	DATE
	private int count; //COUNT	NUMBER
	private int boardLike; //BOARD_LIKE	NUMBER
}

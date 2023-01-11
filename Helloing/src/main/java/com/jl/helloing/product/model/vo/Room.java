package com.jl.helloing.product.model.vo;

import lombok.Data;

@Data
public class Room {

 	 private int roomNo; //ROOM_NO	NUMBER SEQ_RMNO
     private int accommNo;  //ACCOMM_NO	NUMBER
	 private String roomName; //ROOM_NAME	VARCHAR2(1000 BYTE)
	 private int capacity;//CAPACITY	NUMBER
	 private int price;//PRICE	NUMBER
	
}

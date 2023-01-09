package com.jl.helloing.product.model.vo;

import java.util.List;

import lombok.Data;

@Data
public class TicketCommand {
	private List<TicketPayment> ticketPayment;
	
}

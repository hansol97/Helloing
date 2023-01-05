package com.jl.helloing.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@RequestMapping("page.ad")
	public String adminPage() {
		return "admin/menubar_admin";
	}
	
	@RequestMapping("actPay.ad")
	public String activityPaymentViewList() {
		return "temp/activityPaymentListView";
	}
	
	@RequestMapping("businessList.ad")
	public String adminBusinessListView() {
		return "temp/adminBusinessListView";
	}
	
	@RequestMapping("boardList.ad")
	public String adminBoardListView() {
		return "temp/adminBoardListView";
	}
	
	@RequestMapping("memList.ad")
	public String adminMemberListView() {
		return "temp/adminMemberListView";
	}
	
	@RequestMapping("replyList.ad")
	public String adminReplyListView() {
		return "temp/adminReplyListView";
	}

	@RequestMapping("businessPayList.ad")
	public String businessPaymentListView() {
		return "temp/businessPaymentListView";
	}
	
	@RequestMapping("chatBotList.ad")
	public String chatBotListView() {
		return "temp/chatBotListView";
	}
	
	@RequestMapping("reportList.ad")
	public String reportListView() {
		return "temp/reportListView";
	}
	
	@RequestMapping("roomPay.ad")
	public String roomPaymentListView() {
		return "temp/roomPaymentListView";
	}

}

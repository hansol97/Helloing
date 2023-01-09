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
		return "admin/activityPaymentListView";
	}
	
	@RequestMapping("businessList.ad")
	public String adminBusinessListView() {
		return "admin/adminBusinessListView";
	}
	
	@RequestMapping("boardList.ad")
	public String adminBoardListView() {
		return "admin/adminBoardListView";
	}
	
	@RequestMapping("memList.ad")
	public String adminMemberListView() {
		return "admin/adminMemberListView";
	}
	
	@RequestMapping("replyList.ad")
	public String adminReplyListView() {
		return "admin/adminReplyListView";
	}

	@RequestMapping("businessPayList.ad")
	public String businessPaymentListView() {
		return "admin/businessPaymentListView";
	}
	
	@RequestMapping("chatBotList.ad")
	public String chatBotListView() {
		return "admin/chatBotListView";
	}
	
	@RequestMapping("reportList.ad")
	public String reportListView() {
		return "admin/reportListView";
	}
	
	@RequestMapping("roomPay.ad")
	public String roomPaymentListView() {
		return "admin/roomPaymentListView";
	}
	
	@RequestMapping("QAList.ad")
	public String adminQAListView() {
		return "admin/adminQAListView";
	}

}

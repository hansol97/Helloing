package com.jl.helloing.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jl.helloing.admin.model.service.AdminService;
import com.jl.helloing.admin.model.vo.Chatbot;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
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
	
	@RequestMapping("chatbotList.ad")
	public String chatBotListView() {
		return "admin/chatbotListView";
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
	
	//---------------- 챗봇 ----------------
	
	// 챗봇 등록
	@RequestMapping("insert.qa")
	public String insertChatbot(Chatbot c, Model m) {
		
		int result = adminService.insertChatbot(c);

		if(result > 0) {
			return "redirect:/chatbotList.ad";
		}else {
			m.addAttribute("alertMsg", "키워드 등록에 실패했습니다");
			return "admin/chatbotListView";
		}
	}

}

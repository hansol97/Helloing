package com.jl.helloing.admin.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.jl.helloing.admin.model.service.AdminService;
import com.jl.helloing.admin.model.vo.Chatbot;
import com.jl.helloing.business.model.vo.Business;
import com.jl.helloing.business.model.vo.BusinessPayment;
import com.jl.helloing.common.model.vo.PageInfo;
import com.jl.helloing.common.template.Pagination;
import com.jl.helloing.member.model.vo.Member;

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
	@RequestMapping("insertChatbot.ad")
	public String insertChatbot(Chatbot c, HttpSession session) {
		
		int result = adminService.insertChatbot(c);

		if(result > 0) {
			return "redirect:/chatbotList.ad";
		}else {
			session.setAttribute("adminAlertMsg", "키워드 등록에 실패했습니다");
			return "redirect:/chatbotList.ad";
		}
	}
	
	// 챗봇 리스트 조회
	@RequestMapping("chatbotList.ad")
	public ModelAndView chatbotListView(@RequestParam(value="cpage", defaultValue="1") int currentPage
								 ,ModelAndView mv) {
		
		PageInfo pi = Pagination.getPageInfo(adminService.selectChatbotListCount(), currentPage, 10, 5);

		mv.addObject("list", adminService.selectChatbotList(pi))
		  .addObject("pi", pi)
		  .setViewName("admin/chatbotListView");
		
		return mv;
	}
	
	// 챗봇 키워드 수정
	@RequestMapping("updateChatbot.ad")
	public String updateChatbot(Chatbot c, HttpSession session) {
		
		int result = adminService.updateChatbot(c);
		
		if(result > 0) {
			return "redirect:/chatbotList.ad";
		}else {
			session.setAttribute("adminAlertMsg", "키워드 등록에 실패했습니다");
			return "redirect:/chatbotList.ad";
		}
	}
	
	// 챗봇 키워드 삭제
	@ResponseBody
	@RequestMapping("deleteChatbot.ad")
	public int deleteChatbot(@RequestParam(value="cbox[]")List<String> cbox, Model m) {
		return adminService.deleteChatbot(cbox);
	}
	
	// 챗봇 검색
	@RequestMapping("searchChatbot.ad")
	public ModelAndView searchChatbot(@RequestParam(value="cpage", defaultValue="1") int currentPage
									 ,String condition, String keyword, ModelAndView mv) {
		
		
		HashMap<String, String> map = new HashMap();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		PageInfo pi = Pagination.getPageInfo(adminService.selectSearchChatbotCount(map), currentPage, 10, 5);
		
		ArrayList<Chatbot> list = adminService.searchChatbot(pi, map);
		
		mv.addObject("list", list)
		  .addObject("map", map)
		  .setViewName("admin/chatbotListView");
		
		return mv;
	}
	
	//------------------------ 챗봇(메뉴바) ------------------------
	
	@ResponseBody
	@RequestMapping(value="adminInfo.ch", produces="application/json; charset=UTF-8")
	public String selectadminInfo(String chatbotKeyword) {
		String[] keywords = chatbotKeyword.split("\\s");
		
		List list = Arrays.asList(keywords);
		
		HashMap<String, Object> map = new HashMap();
		map.put("List", list);
		
		ArrayList<Chatbot> cList = adminService.selectChatbotA(map);

		return new Gson().toJson(cList);
	}
	
	//---------------------- 회원관리 ----------------------
	
	
	// 일반회원 리스트 조회
	@RequestMapping("memList.ad")
	public String selectMemberList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model m) {
		
		PageInfo pi = Pagination.getPageInfo(adminService.selectMemListCount(), currentPage, 10, 5);
		
		ArrayList<Member> list = adminService.selectMemberList(pi);
		
		m.addAttribute("list", list);
		m.addAttribute("pi", pi);
		
		return "admin/adminMemberListView";
	}
	
	// 일반회원 정지
	@ResponseBody
	@RequestMapping(value="deleteMem.ad", produces="text/html; charset=UTF-8")
	public String deleteMember(int memNo) {
		
		String result;
		if(adminService.deleteMember(memNo) > 0) {
			result = "YYYY";
		}else {
			result = "NNNN";
		}
		return result;
	}
	
	// 일반회원 검색
	@RequestMapping("memListSearch.ad")
	public ModelAndView searchMemList(@RequestParam(value="cpage", defaultValue="1")int currentPage
								,String condition, String keyword, ModelAndView mv) {
		HashMap map = new HashMap();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		PageInfo pi = Pagination.getPageInfo(adminService.selectSearchMemListCount(map), currentPage, 10, 5);
		ArrayList<Member> list = adminService.searchMemList(pi, map);
		
		mv.addObject("list", list)
		  .addObject("pi", pi)
		  .addObject("map", map)
		  .setViewName("admin/adminMemberListView");
		
		return mv;
	}
	
	// 사업자 리스트 조회
	@RequestMapping("businessList.ad")
	public String selectBusinessList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model m) {
		PageInfo pi = Pagination.getPageInfo(adminService.selectBusiListCount(), currentPage, 10, 5);

		ArrayList<Business> list = adminService.selectBusinessList(pi);
		m.addAttribute("list", list);
		m.addAttribute("pi", pi);
		
		return "admin/adminBusinessListView";
	}
	
	//--------------------- 결제관리 ---------------------
	@RequestMapping("businessPayList.ad")
	public String selectBusiPayList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model m) {
		PageInfo pi = Pagination.getPageInfo(adminService.selectBusiPayListCount(), currentPage, 10, 5);
		
		ArrayList<BusinessPayment> list = adminService.selectBusiPayList(pi);
		m.addAttribute("list", list);
		
		return "admin/businessPaymentListView";
	}
	
	
	

}

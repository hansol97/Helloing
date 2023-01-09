package com.jl.helloing.product.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jl.helloing.member.model.vo.Member;
import com.jl.helloing.product.model.service.ProductService;
import com.jl.helloing.product.model.vo.Activity;
import com.jl.helloing.product.model.vo.Ticket;
import com.jl.helloing.product.model.vo.TicketCommand;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;

	// 숙소 메인
	@RequestMapping("accomm")
	public String accommMain() {
		return "product/accommMain";
	}
	
	// 숙소 검색
	@RequestMapping("search.accomm")
	public String searchAccomm() {
		return "product/accommSearch";
	}
	
	// 숙소 상세 페이지
	@RequestMapping("detail.accomm")
	public String DetailAccomm() {
		return "product/accommDetail";
	}
	
	// 숙소 예약(결제) 페이지
	@RequestMapping("reserve.accomm")
	public String reserveAccomm() {
		return "product/accommReserve";
	}
	
	// 숙소 결제 완료
	@RequestMapping("pay.accomm")
	public String payAccomm() {
		return "product/paySuccess";
	}
	
	// 액티비티 메인
	@RequestMapping("activity")
	public ModelAndView activityMain(ModelAndView mv) {
		
		mv.addObject("activityList", productService.selectActList());
		
		System.out.println(productService.selectActList()); // 메인 화면에 별점과 후기도 필요
		
		//mv.addObject("ticketList", productService.selectTicketList());
		mv.setViewName("product/activityMain");
		
		return mv;
	}
	
	// 액티비티 검색
	@RequestMapping("search.activity")
	public String searchActivity() {
		return "product/activitySearch";
	}
	
	// 액티비티 상세 페이지
	@RequestMapping("detail.activity")
	public ModelAndView DetailActivity(ModelAndView mv, int activityNo) {
		
		Activity act = productService.selectActDetail(activityNo);
		ArrayList<Ticket> ticketList = productService.selectTicketList(activityNo);
		
		mv.addObject("act", act).addObject("ticketList", ticketList);
		mv.setViewName("product/activityDetail");
		
		return mv;
	}
	
	// 액티비티 결제 페이지
	@RequestMapping("reserve.activity")
	public String reserveActivity(HttpSession session, TicketCommand tk) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		// System.out.println(tk.getTicketPayment());
		// count가 0 이상인 것만 DB에 insert
		
		
		if(loginUser != null) {
			int memNo = loginUser.getMemNo();
			return "product/activityReserve";
		} else { // 로그인이 되어있지 않을 경우 로그인 폼으로 이동
			session.setAttribute("alertMsg", "로그인이 필요한 서비스입니다.");
			return "redirect:loginForm.me";
		}
	}
	
	// 액티비티 결제 완료
	@RequestMapping("pay.ticket")
	public String payActivity() {
		return "product/paySuccess";
	}
}


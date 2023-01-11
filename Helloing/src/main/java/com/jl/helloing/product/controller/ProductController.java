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
import com.jl.helloing.product.model.vo.ActivityReview;
import com.jl.helloing.product.model.vo.TicketCommand;
import com.jl.helloing.product.model.vo.TicketPayment;

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
		
		ArrayList<Activity> actList = productService.selectActList();
		
		/*
		// 메인 화면에 가격과 후기 갯수도 필요
		// 후기 갯수, 각 액티비티의 티켓 중 제일 낮은 가격
		for(int i = 0; i< actList.size(); i++) {
			// 리뷰 갯수
			ArrayList<ActivityReview> actReviewList = productService.selectReviewList(actList.get(i).getActivityNo());
			actList.get(i).setReviewCount(actReviewList.size());
			
			// 가장 낮은 가격
			int price = productService.actTicketRowPrice(actList.get(i).getActivityNo());
			actList.get(i).setRowPrice(price);
		}
		*/
		
		mv.addObject("actList", actList)
		  .setViewName("product/activityMain");
		
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
		ArrayList<ActivityReview> actReviewList = productService.selectReviewList(activityNo);
		
		mv.addObject("act", act)
		  .addObject("ticketList", productService.selectTicketList(activityNo))
		  .addObject("actReviewList", actReviewList)
		  .setViewName("product/activityDetail");
		
		return mv;
	}
	
	// 액티비티 결제 페이지
	@RequestMapping("reserve.activity")
	public String reserveActivity(HttpSession session, TicketCommand tk, TicketPayment tp) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser != null) { // 로그인 되어있는 유저만 결제 페이지 넘어가기
			int memNo = loginUser.getMemNo();
			
			System.out.println("리스트 사이즈 : " + tk.getTicketPayment().size());
			System.out.println("삭제전 : " + tk.getTicketPayment());
			
			for(int i = 0; i < tk.getTicketPayment().size(); i++) {
				System.out.println(i + "번째 : " + tk.getTicketPayment());
				
				if(tk.getTicketPayment().get(i).getCount() == 0) {
					tk.getTicketPayment().remove(i);
				}
			}
			System.out.println("삭제후 : " + tk.getTicketPayment());
			
			
			
			
			
			
			return "product/activityReserve";
		} else {
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


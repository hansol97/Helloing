package com.jl.helloing.product.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jl.helloing.member.model.vo.ActivityWish;
import com.jl.helloing.member.model.vo.Member;
import com.jl.helloing.product.model.service.ProductService;
import com.jl.helloing.product.model.vo.Accomm;
import com.jl.helloing.product.model.vo.Activity;
import com.jl.helloing.product.model.vo.ActivityReview;
import com.jl.helloing.product.model.vo.TicketCommand;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
/*
	<option value='hotel'>호텔</option>
    <option value='pension'>펜션</option>
    <option value='motel'>모텔</option>
    <option value='house'>민박</option>
    <option value='guestHouse'>게스트하우스</option>
*/	
	// 숙소 메인
	@RequestMapping("accomm")
	public ModelAndView accommMain(ModelAndView mv) {

		mv.addObject("acList", productService.selectAcList())
		  .setViewName("product/accommMain");
		
		return mv;
	}
	
	// 숙소 검색
	@RequestMapping("search.accomm")
	public String searchAccomm() {
		return "product/accommSearch";
	}
	
	// 숙소 상세 페이지
	@RequestMapping("detail.accomm")
	public ModelAndView DetailAccomm(int accommNo, ModelAndView mv) {
		
		mv.addObject("ac", productService.selectAcDetail(accommNo))
		  .addObject("roomList", productService.selectRoomList(accommNo))
		  .addObject("acReviewList", productService.selectAcReviewList(accommNo))
		  .setViewName("product/accommDetail");
		
		return mv;
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
		
		mv.addObject("actList", productService.selectActList())
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
	public ModelAndView DetailActivity(ModelAndView mv, HttpSession session, int activityNo, ActivityWish aw) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser != null) { // 로그인이 되어있을때만 위시리스트 확인하기
			aw.setMemNo(loginUser.getMemNo());
			
			mv.addObject("checkWish", productService.checkActWish(aw));
		}
		
		mv.addObject("act", productService.selectActDetail(activityNo))
		  .addObject("ticketList", productService.selectTicketList(activityNo))
		  .addObject("actReviewList", productService.selectReviewList(activityNo))
		  .setViewName("product/activityDetail");
		
		return mv;
	}
	
	// 액티비티 결제 페이지
	@RequestMapping("reserve.activity")
	public ModelAndView reserveActivity(HttpSession session,
								  		TicketCommand tk,
								  		Activity act,
								  		ModelAndView mv) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser != null) { // 로그인 되어있는 유저만 결제 페이지 넘어가기
			
			for(int i = 0; i < tk.getTicketPayment().size(); i++) {
				
				if(tk.getTicketPayment().get(i).getCount() == 0) { // 티켓 수량이 0이면 리스트에서 제거하기
					tk.getTicketPayment().remove(i);
					tk.getTicketPayment().get(i).setMemNo(loginUser.getMemNo());
					i--;
					continue;
				}
			}
			
			mv.addObject("ticketList", tk.getTicketPayment())
			  .addObject("act", act)
			  .setViewName("product/activityReserve");
			
		} else {
			session.setAttribute("alertMsg", "로그인이 필요한 서비스입니다.");
			mv.setViewName("redirect:loginForm.me");
		}
		
		return mv;
	}
	
	// 액티비티 결제 완료
	@RequestMapping("pay.ticket")
	public String payActivity(HttpSession session,
						      TicketCommand tk,
						      ModelAndView mv) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		System.out.println(tk.getTicketPayment());
		
		for(int i = 0; i < tk.getTicketPayment().size(); i++) {
			tk.getTicketPayment().get(i).setMemNo(loginUser.getMemNo());
		}
		
		int result = productService.insertTicketPayment(tk.getTicketPayment());
		
		System.out.println(result);
		
		return "product/paySuccess";
	}
}


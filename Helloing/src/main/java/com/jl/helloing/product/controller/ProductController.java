package com.jl.helloing.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {

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
	
	// 액티비티 메인
	@RequestMapping("activity")
	public String activityMain() {
		return "product/activityMain";
	}
	
	// 액티비티 검색
	@RequestMapping("search.activity")
	public String searchActivity() {
		return "product/activitySearch";
	}
	
	// 액티비티 상세 페이지
	@RequestMapping("detail.activity")
	public String DetailActivity() {
		return "product/activityDetail";
	}
	
	// 액티비티 결제 페이지
	@RequestMapping("reserve.activity")
	public String reserveActivity() {
		return "product/activityReserve";
	}
}


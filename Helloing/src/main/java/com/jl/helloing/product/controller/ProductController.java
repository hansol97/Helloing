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
	
	// 액티비티 메인
	@RequestMapping("activity")
	public String activityMain() {
		return "product/activityMain";
	}
}

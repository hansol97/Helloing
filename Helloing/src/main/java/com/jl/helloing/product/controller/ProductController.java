package com.jl.helloing.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {

	@RequestMapping("accomm")
	public String accommMain() {
		return "product/accommMain";
	}
}

package com.jl.helloing.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@RequestMapping("page.ad")
	public String adminPage() {
		return "admin/menubar_admin";
	}

}

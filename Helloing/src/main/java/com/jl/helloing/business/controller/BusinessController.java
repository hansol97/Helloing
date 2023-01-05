package com.jl.helloing.business.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BusinessController {
	
	@RequestMapping("accommList.bu")
	public String goSelectAccom() {
		
		return "business/accommList";
	}

}

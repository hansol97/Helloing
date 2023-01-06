package com.jl.helloing.business.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BusinessController {
	
	@RequestMapping("accommList.bu")
	public String goSelectAccom() {
		
		return "business/accommList";
	}
	
	@RequestMapping("activityList.bu")
	public String selectActivity() {
		
		return "business/activityList";
	}

	@RequestMapping("goInsertAccom.bu")
	public String goInsertAccom() {
		return "business/insertAccomm";
	}
	
	@RequestMapping("goInsertAct.bu")
	public String goInsertAct() {
		return "business/insertActivity";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

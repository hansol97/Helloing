package com.jl.helloing.product.model.service;

import java.util.ArrayList;

import com.jl.helloing.product.model.vo.Activity;

public interface ProductService {
	
	// 액티비티 전체 조회(메인페이지)
	ArrayList<Activity> selectActList();
}

package com.jl.helloing.business.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jl.helloing.business.model.vo.Business;

@Service
public class BusinessServiceImpl implements BusinessService {
	
	@Autowired
	private BusinessDao businessDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 승준
	// 파트너 기업 등록
	@Override
	public int insertCompany(Business b) {
		return 0;
	}

}

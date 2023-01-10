package com.jl.helloing.business.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jl.helloing.business.model.dao.BusinessDao;
import com.jl.helloing.business.model.vo.Business;
import com.jl.helloing.common.model.vo.Attachment;

import com.jl.helloing.product.model.vo.Accomm;

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
		return businessDao.insertCompany(b, sqlSession);
	}
	
	// 파트너 기업 로그인
	@Override
	public Business loginCompany(int memNo) {
		return businessDao.loginCompany(memNo, sqlSession);
	}


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//인호
	// 인서트 숙소 세트 
	@Override
	public int insertAccom(Accomm acc) {
		return businessDao.insertAccom(acc, sqlSession);
	}

	@Override
	public int insertAccomPhoto(ArrayList<Attachment> list) {
		return businessDao.insertAccomPhoto(list, sqlSession);
	}

}

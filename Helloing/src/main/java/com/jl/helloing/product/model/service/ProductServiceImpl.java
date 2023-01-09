package com.jl.helloing.product.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jl.helloing.product.model.dao.ProductDao;
import com.jl.helloing.product.model.vo.Activity;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDao productDao;
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Activity> selectActList() {
		return productDao.selectActList(sqlSession);
	}

}

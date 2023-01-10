package com.jl.helloing.business.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jl.helloing.business.model.vo.Business;

@Repository
public class BusinessDao {

	public int insertCompany(Business b, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("businessMapper.insertCompany", b);
	}
	
	public Business loginCompany(Business b, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("businessMapper.loginCompany", b);
	}
}

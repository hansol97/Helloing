package com.jl.helloing.business.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jl.helloing.business.model.vo.Business;
import com.jl.helloing.common.model.vo.Attachment;
import com.jl.helloing.product.model.vo.Accomm;
import com.jl.helloing.product.model.vo.Activity;

@Repository
public class BusinessDao {

	public int insertCompany(Business b, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("businessMapper.insertCompany", b);
	}

	
	// 숙소 등록ih
	public int insertAccom(Accomm acc,  SqlSessionTemplate sqlSession) {
		return sqlSession.insert("productMapper.insertAccom", acc);
	}
	// 숙소 사진 등록ih
	public int insertAccomPhoto(ArrayList<Attachment> list, SqlSessionTemplate sqlSession) {

		return sqlSession.insert("productMapper.insertAccomPhoto", list);
	}
	// 승준이의 기업회원로그인
	public Business loginCompany(int memNo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("businessMapper.loginCompany", memNo);
	}

	// 액티비티 등록
	public int insertAct(Activity act, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("productMapper.insertAct", act);
	}


	public int insertActPhoto(ArrayList<Attachment> list, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("productMapper.insertActPhoto", list);
	}
}

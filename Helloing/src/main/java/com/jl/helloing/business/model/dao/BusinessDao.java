package com.jl.helloing.business.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jl.helloing.business.model.vo.Business;
import com.jl.helloing.common.model.vo.Attachment;
import com.jl.helloing.product.model.vo.Accomm;

@Repository
public class BusinessDao {

	public int insertCompany(Business b, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("businessMapper.insertCompany", b);
	}

	
	// 숙소 등록
	public int insertAccom(Accomm acc,  SqlSessionTemplate sqlSession) {
		return sqlSession.insert("businessMapper.insertAccom", acc);
	}
	// 숙소 사진 등록
	public int insertAccomPhoto(ArrayList<Attachment> list, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("product-mapper.insertAccomPhoto", list);
	}
	
	public Business loginCompany(int memNo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("businessMapper.loginCompany", memNo);
	}
}

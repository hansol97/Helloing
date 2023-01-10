package com.jl.helloing.business.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jl.helloing.business.model.vo.Business;
import com.jl.helloing.common.model.vo.Attachment;
import com.jl.helloing.product.model.vo.Accomm;

@Repository
public class BusinessDao {

	public int insertCompany(Business b, SqlSessionTemplate sqlSession) {
		System.out.println("sd");
		return sqlSession.insert("businessMapper.insertCompany", b);
	}

	
	// 숙소 등록ih
	public int insertAccom(Accomm acc,  SqlSessionTemplate sqlSession) {
		return sqlSession.insert("productMapper.insertAccom", acc);
	}
	// 숙소 사진 등록ih
	public int insertAccomPhoto(ArrayList<Attachment> list, SqlSessionTemplate sqlSession) {
		
//		HashMap<String, Object> map = new HashMap();
//		map.put("List", list);
		System.out.println("숙소사진등록 DAO list :  " + list );
		return sqlSession.insert("productMapper.insertAccomPhoto", list);
	}
	
	public Business loginCompany(int memNo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("businessMapper.loginCompany", memNo);
	}
}

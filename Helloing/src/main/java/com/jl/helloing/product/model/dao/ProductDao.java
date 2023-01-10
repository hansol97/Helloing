package com.jl.helloing.product.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jl.helloing.product.model.vo.Activity;
import com.jl.helloing.product.model.vo.Ticket;

@Repository
public class ProductDao {

	public ArrayList<Activity> selectActList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("productMapper.selectActList");
	}
	
	public Activity selectActDetail(SqlSessionTemplate sqlSession, int activityNo) {
		return sqlSession.selectOne("productMapper.selectActDetail", activityNo);
	}
	
	public ArrayList<Ticket> selectTicketList(SqlSessionTemplate sqlSession, int activityNo){
		return (ArrayList)sqlSession.selectList("productMapper.selectTicketList", activityNo);
	}
}

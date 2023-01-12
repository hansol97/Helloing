package com.jl.helloing.product.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jl.helloing.member.model.vo.ActivityWish;
import com.jl.helloing.product.model.vo.Activity;
import com.jl.helloing.product.model.vo.ActivityReview;
import com.jl.helloing.product.model.vo.Ticket;
import com.jl.helloing.product.model.vo.TicketPayment;

@Repository
public class ProductDao {

	public ArrayList<Activity> selectActList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("productMapper.selectActList");
	}
	
	public int actTicketRowPrice(SqlSessionTemplate sqlSession, int activityNo) {
		return sqlSession.selectOne("productMapper.actTicketRowPrice", activityNo);
	}
	
	public Activity selectActDetail(SqlSessionTemplate sqlSession, int activityNo) {
		return sqlSession.selectOne("productMapper.selectActDetail", activityNo);
	}
	
	public ArrayList<Ticket> selectTicketList(SqlSessionTemplate sqlSession, int activityNo){
		return (ArrayList)sqlSession.selectList("productMapper.selectTicketList", activityNo);
	}
	
	public ArrayList<ActivityReview> selectReviewList(SqlSessionTemplate sqlSession, int activityNo){
		return (ArrayList)sqlSession.selectList("productMapper.selectReviewList", activityNo);
	}
	
	public int insertTicketPayment(SqlSessionTemplate sqlSession, List<TicketPayment> list) {
		return sqlSession.insert("productMapper.insertTicketPayment", list);
	}
	
	public ActivityWish checkActWish(SqlSessionTemplate sqlSession, ActivityWish aw) {
		return sqlSession.selectOne("productMapper.checkActWish", aw);
	}
}

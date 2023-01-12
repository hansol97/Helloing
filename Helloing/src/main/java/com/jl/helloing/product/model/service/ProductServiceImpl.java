package com.jl.helloing.product.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jl.helloing.member.model.vo.ActivityWish;
import com.jl.helloing.product.model.dao.ProductDao;
import com.jl.helloing.product.model.vo.Activity;
import com.jl.helloing.product.model.vo.ActivityReview;
import com.jl.helloing.product.model.vo.Ticket;
import com.jl.helloing.product.model.vo.TicketPayment;

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

	@Override
	public Activity selectActDetail(int activityNo) {
		return productDao.selectActDetail(sqlSession, activityNo);
	}

	@Override
	public ArrayList<Ticket> selectTicketList(int activityNo) {
		return productDao.selectTicketList(sqlSession, activityNo);
	}

	@Override
	public ArrayList<ActivityReview> selectReviewList(int activityNo) {
		return productDao.selectReviewList(sqlSession, activityNo);
	}

	@Override
	public int insertTicketPayment(List<TicketPayment> list) {
		return productDao.insertTicketPayment(sqlSession, list);
	}

	@Override
	public ActivityWish checkActWish(ActivityWish aw) {
		return productDao.checkActWish(sqlSession, aw);
	}

	

}

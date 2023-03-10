package com.jl.helloing.product.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jl.helloing.common.model.vo.Attachment;
import com.jl.helloing.member.model.vo.AccommWish;
import com.jl.helloing.member.model.vo.ActivityWish;
import com.jl.helloing.product.model.dao.ProductDao;
import com.jl.helloing.product.model.vo.Accomm;
import com.jl.helloing.product.model.vo.AccommReview;
import com.jl.helloing.product.model.vo.Activity;
import com.jl.helloing.product.model.vo.ActivityReview;
import com.jl.helloing.product.model.vo.Room;
import com.jl.helloing.product.model.vo.RoomPayment;
import com.jl.helloing.product.model.vo.Ticket;
import com.jl.helloing.product.model.vo.TicketPayment;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDao productDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Accomm> hotAccomm(){
		return productDao.hotAccomm(sqlSession);
	}
	
	@Override
	public ArrayList<Activity> hotActivity(){
		return productDao.hotActivity(sqlSession);
	}

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

	@Transactional
	@Override
	public int insertTicketPayment(List<TicketPayment> list) {
		return productDao.insertTicketPayment(sqlSession, list) * productDao.decreaseCount(sqlSession, list);
	}
	
	@Override
	public ActivityWish checkActWish(ActivityWish aw) {
		return productDao.checkActWish(sqlSession, aw);
	}

	@Override
	public ArrayList<Accomm> selectAcList() {
		return productDao.selectAcList(sqlSession);
	}

	@Override
	public Accomm selectAcDetail(int accommNo) {
		return productDao.selectAcDetail(sqlSession, accommNo);
	}

	@Override
	public ArrayList<Room> selectRoomList(int accommNo) {
		return productDao.selectRoomList(sqlSession, accommNo);
	}

	@Override
	public ArrayList<AccommReview> selectAcReviewList(int accommNo) {
		return productDao.selectAcReviewList(sqlSession, accommNo);
	}

	@Override
	public ArrayList<Attachment> selectPhotoList(int accommNo) {
		return productDao.selectPhotoList(sqlSession, accommNo);
	}

	@Override
	public AccommWish checkAcWish(AccommWish aw) {
		return productDao.checkAcWish(sqlSession, aw);
	}

	@Override
	public int insertRoomPayment(RoomPayment rp) {
		return productDao.insertRoomPayment(sqlSession, rp);
	}

	@Override
	public ArrayList<Accomm> searchAccomm(Accomm ac) {
		return productDao.searchAccomm(sqlSession, ac);
	}

	@Override
	public ArrayList<Activity> searchActivity(String keyword) {
		return productDao.searchActivity(sqlSession, keyword);
	}

	@Override
	public ArrayList<Attachment> selectActPhotoList(int activityNo) {
		return productDao.selectActPhotoList(sqlSession, activityNo);
	}

	@Override
	public ArrayList<Attachment> selectRoomPhotoList(int roomNo) {
		return productDao.selectRoomPhotoList(sqlSession, roomNo);
	}

	@Override
	public ArrayList<Attachment> selectAccommAttachmentList(int accommNo) {
		return productDao.selectAccommAttachmentList(sqlSession, accommNo);
	}
	
	

	

}

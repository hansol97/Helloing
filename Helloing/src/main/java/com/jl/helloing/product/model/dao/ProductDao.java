package com.jl.helloing.product.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jl.helloing.common.model.vo.Attachment;
import com.jl.helloing.member.model.vo.AccommWish;
import com.jl.helloing.member.model.vo.ActivityWish;
import com.jl.helloing.product.model.vo.Accomm;
import com.jl.helloing.product.model.vo.AccommReview;
import com.jl.helloing.product.model.vo.Activity;
import com.jl.helloing.product.model.vo.ActivityReview;
import com.jl.helloing.product.model.vo.Room;
import com.jl.helloing.product.model.vo.Ticket;
import com.jl.helloing.product.model.vo.TicketPayment;

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
	
	public ArrayList<ActivityReview> selectReviewList(SqlSessionTemplate sqlSession, int activityNo){
		return (ArrayList)sqlSession.selectList("productMapper.selectReviewList", activityNo);
	}
	
	public int insertTicketPayment(SqlSessionTemplate sqlSession, List<TicketPayment> list) {
		return sqlSession.insert("productMapper.insertTicketPayment", list);
	}
	
	public ActivityWish checkActWish(SqlSessionTemplate sqlSession, ActivityWish aw) {
		return sqlSession.selectOne("productMapper.checkActWish", aw);
	}
	
	public ArrayList<Accomm> selectAcList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("productMapper.selectAcList");
	}
	
	public Accomm selectAcDetail(SqlSessionTemplate sqlSession, int accommNo) {
		return sqlSession.selectOne("productMapper.selectAcDetail", accommNo);
	}
	
	public ArrayList<Room> selectRoomList(SqlSessionTemplate sqlSession, int accommNo){
		return (ArrayList)sqlSession.selectList("productMapper.selectRoomList", accommNo);
	}
	
	public ArrayList<AccommReview> selectAcReviewList(SqlSessionTemplate sqlSession, int accommNo){
		return (ArrayList)sqlSession.selectList("productMapper.selectAcReviewList", accommNo);
	}
	
	public ArrayList<Attachment> selectPhotoList(SqlSessionTemplate sqlSession, int accommNo){
		return (ArrayList)sqlSession.selectList("productMapper.selectPhotoList", accommNo);
	}
	
	public AccommWish checkAcWish(SqlSessionTemplate sqlSession, AccommWish aw) {
		return sqlSession.selectOne("productMapper.checkAcWish", aw);
	}
}

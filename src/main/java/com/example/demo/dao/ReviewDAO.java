package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.ReviewVO;

@Repository
public class ReviewDAO {

	public List<ReviewVO> findAll(){
		return DBManager.findAllReview();
	}
	
	public List<ReviewVO> findAllRate(int pro_no){
		return DBManager.findAllReviewRate(pro_no);
	}
	
	public List<ReviewVO> findMyReview(HashMap map){
		return DBManager.findMyReview(map);
	}
	
	public ReviewVO findAllDetail(int no){
		return DBManager.findAllReviewDetail(no);
	}
	
	public ReviewVO findReviewByProno(int no){
		return DBManager.findReviewByProno(no);
	}
	
	public int insert(ReviewVO r) {
		return DBManager.insertReview(r);
	}
	
	public int update(ReviewVO r) {
		return DBManager.updateReview(r);
	}
	
	public int delete(int no) {
		return DBManager.deleteReview(no);
	}
	
	public void updateHit(int no) {
		DBManager.updateReviewHit(no);
	}
}

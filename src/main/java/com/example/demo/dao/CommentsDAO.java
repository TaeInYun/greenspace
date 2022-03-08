package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.CommentsVO;

@Repository
public class CommentsDAO {
	public int insertComments(HashMap map){
		return DBManager.insertComments(map);
	}
	/*
	public int updateComments(HashMap map){
		return DBManager.updateComments(map);
	}
	*/
	public List<CommentsVO> findAllCommentByCommu_no(int no) {
		return DBManager.findAllCommentByCommu_no(no);
	}
	public List<CommentsVO> findAllCommentByCer_no(int no) {
		return DBManager.findAllCommentByCer_no(no);
	}
	public List<CommentsVO> findAllCommentByEts_no(int no) {
		return DBManager.findAllCommentByEts_no(no);
	}
	
	/*
	public int deleteComments(HashMap map){
		return DBManager.deleteComments(map);
	*/
	}


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
	public List<CommentsVO> findAllCommentByCommu_no(int no) {
		return DBManager.findAllCommentByCommu_no(no);
	}
	public List<CommentsVO> findAllCommentByCer_no(int no) {
		return DBManager.findAllCommentByCer_no(no);
	}
	public List<CommentsVO> findAllCommentByEts_no(int no) {
		return DBManager.findAllCommentByEts_no(no);
	}
	public List<CommentsVO> findAllCommentByPro_qna_no(int no) {
		return DBManager.findAllCommentByPro_qna_no(no);
	}
	
	public List<CommentsVO> findAllCommentByOne_no(int no) {
		return DBManager.findAllCommentByOne_no(no);
	}
	
	public List<CommentsVO> findAllCommentByRe_no(int no) {
		return DBManager.findAllCommentByRe_no(no);
	}
	 
	public int deleteComments(HashMap map){
		return DBManager.deleteComments(map);
	}
	public int updateComments(HashMap map){
		return DBManager.updateComments(map);
	}
	
	
	
	public List<CommentsVO> findAllCommentByMemberAndRe(int no){
		return DBManager.findAllCommentByMemberAndRe(no);
	}
	
	public List<CommentsVO> findAllCommentByMemberAndOne(int no){
		return DBManager.findAllCommentByMemberAndOne(no);
	}
	
	public List<CommentsVO> findAllCommentByMemberAndPro_no(int no){
		return DBManager.findAllCommentByMemberAndPro_no(no);
	}
	 
	
	public List<CommentsVO> findAllCommentByMemberAndcommnu(int no){
		return DBManager.findAllCommentByMemberAndcommnu(no);
	}
	 
	
	public List<CommentsVO> findAllCommentByMember_no(int no){
		return DBManager.findAllCommentByMember_no(no);
	}
	
	public List<CommentsVO> findAllCommentByMemberAndCer(int no){
		return DBManager.findAllCommentByMemberAndCer(no);
	}
	
	public List<CommentsVO> findAllCommentByMemberAndEco(int no){
		return DBManager.findAllCommentByMemberAndEco(no);
	}
	public List<CommentsVO> findAllCommentByMemberAndETS(int no){
		return DBManager.findAllCommentByMemberAndETS(no);
	}
	 
	 
}

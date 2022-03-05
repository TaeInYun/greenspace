package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.CommunityVO;

@Repository
public class CommunityDAO {
	
	// 커뮤니티 게시판 목록
	public List<CommunityVO> findCommunity(){
		return DBManager.findCommunity();
	}
	
	//My 커뮤니티게시판 목록
	public List<CommunityVO> findCommuByMember(int member_no){
		return DBManager.findCommuByMember(member_no);
	}
	
	//커뮤니티게시판 등록
	public int insert(CommunityVO c) {
		return DBManager.insertCommunity(c);
	}
	
	//커뮤니티게시판 상세
	public CommunityVO getCommunity(int no) {
		return DBManager.getCommunity(no);
	}

	//커뮤니티게시판 수정
	public int updateCommunity(CommunityVO c) {		
		return DBManager.updateCommunity(c);
	}

	//커뮤니티게시판 삭제
	public int deleteCommunity(int no) {
		return DBManager.deleteCommunity(no);
	}
	
	public void updateHitCommu(int no) {
		DBManager.updateHitCommu(no);
	}
}

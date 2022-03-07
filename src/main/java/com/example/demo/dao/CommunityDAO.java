package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.CommunityVO;
import com.example.demo.vo.NoticeVO;

@Repository
public class CommunityDAO {
	
	   public static int pageSIZE = 10;    //한 화면에 보여줄 레코드의 수
	    public static int totalRecord;      //전체 레코드 수
	    public static int totalPage;        //전체 페이지

	
	// 커뮤니티 게시판 목록
	    //페이지로 나누기
	    public List<CommunityVO> findAllCommunity(HashMap map){
	        totalRecord = DBManager.getTotalRecord();
	        totalPage = (int)Math.ceil(totalRecord/(double)pageSIZE);
	        return DBManager.findAllCommunity(map);
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

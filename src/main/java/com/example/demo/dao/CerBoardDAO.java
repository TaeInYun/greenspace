package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.CerBoardVO;

@Repository
public class CerBoardDAO {
	
	//오늘 쓴글 체크
	public int checkTodayCer(int member_no) {
		return DBManager.checkTodayCer(member_no);
	}
	
	// 인증게시판 목록
	public List<CerBoardVO> findCerBoard(){
		return DBManager.findCerBoard();
	}
	
	//My 인증게시판 목록
	public List<CerBoardVO> findAllByMember(int member_no){
		return DBManager.findCerByMember(member_no);
	}
	
	//인증게시판 등록
	public int insert(CerBoardVO c) {
		return DBManager.insertCerBoard(c);
	}
	
	//인증게시판 상세
	public CerBoardVO getCerBoard(int no) {
		return DBManager.getCerBoard(no);
	}

	//인증게시판 수정
	public int updateCerBoard(CerBoardVO c) {		
		return DBManager.updateCerBoard(c);
	}

	//인증게시판 삭제
	public int deleteCerBoard(int no) {
		return DBManager.deleteCerBoard(no);
	}
	
	public void updateHitCer(int no) {
		DBManager.updateHitCer(no);
	}
	

}

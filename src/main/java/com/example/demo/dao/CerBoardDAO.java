package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.CerBoardVO;

@Repository
public class CerBoardDAO {
    public static int pageSIZE = 10;    //한 화면에 보여줄 레코드의 수
    public static int totalRecord;      //전체 레코드 수
    public static int totalPage;        //전체 페이지
	
	//오늘 쓴글 체크
	public int checkTodayCer(int member_no) {
		return DBManager.checkTodayCer(member_no);
	}
	
	// 인증게시판 목록
	public List<CerBoardVO> findCerBoard(HashMap map){
		 totalRecord = DBManager.getTotalRecordCer();
	     totalPage = (int)Math.ceil(totalRecord/(double)pageSIZE);
		return DBManager.findCerBoard(map);
	}
	
	//My 인증게시판 목록
	public List<CerBoardVO> findAllByMember(HashMap map){
		 totalRecord = DBManager.getTotalRecordMyCer(map);
	     totalPage = (int)Math.ceil(totalRecord/(double)pageSIZE);
		return DBManager.findCerByMember(map);
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

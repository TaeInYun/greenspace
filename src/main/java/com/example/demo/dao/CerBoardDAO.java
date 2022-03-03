package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.CerBoardVO;

@Repository
public class CerBoardDAO {
	
	//마이페이지 인증게시판 목록
	public List<CerBoardVO> findCerBoard(){
		return DBManager.findCerBoard();
	}
	
	//인증게시판 등록
	public int insert(CerBoardVO c) {
		return DBManager.insertCerBoard(c);
	}

}

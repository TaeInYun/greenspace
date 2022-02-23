package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.ChallengeVO;
import com.example.demo.vo.ProductVO;

@Repository
public class ChallengeDAO {

	public List<ChallengeVO> findAll(){
		return DBManager.findAllChg();	
	}	
	
	public ChallengeVO findByNo(int no) {
		return DBManager.findChgByNo(no);
	}
	
	public int insert(ChallengeVO c) {
		return DBManager.insertChg(c);
	}

	public int update(ChallengeVO c) {
		return DBManager.updateChg(c);
	}

	public int delete(int no) {
		return DBManager.deleteChg(no);
	}
	
	public List<ChallengeVO> selectChgRandom(){
		return DBManager.selectChgRandom();	
	}
	
	
}

package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.ChallengeListVO;
import com.example.demo.vo.ChallengeVO;

@Repository
public class ChallengeListDAO {
	
	public int insertChglist(HashMap map) {
		return DBManager.insertChglist(map);
	}
	
	public List<ChallengeListVO> todayChgList(){
		return DBManager.todayChgList();	
	}	
	
	public List<ChallengeListVO> tomorrowChgList(){
		return DBManager.tomorrowChgList();	
	}	
	
	public List<ChallengeListVO> yesterdayChgList(){
		return DBManager.yesterdayChgList();	
	}		
}

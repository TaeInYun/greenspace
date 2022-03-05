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
	
	/* 회원 챌린지 리스트*/
	public List<ChallengeListVO> memberChgList(int member_no){
		return DBManager.findChglist(member_no);	
	}	
	
	
	/*도전하기버튼 클릭시 챌린지 상태 수정*/
	public int updateChgStatus(ChallengeListVO c) {
		return DBManager.updateChgStatus(c);
	}

	
	/*오늘 챌린지 완료시 ING->STA 챌린지 상태 수정*/
	public int updateChgStatusSTA(int member_no) {
		return DBManager.updateChgStatusSTA(member_no);
	}
	
	public int checkEndstatus(int member_no) {
		return DBManager.checkEndstatus(member_no);
	}
	
}

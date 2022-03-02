package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.ChallengeListVO;
import com.example.demo.vo.ChallengeUserVO;

@Repository
public class ChallengeUserDAO {

	public int insertEndChg(int member_no) {
		return DBManager.insertEndChg(member_no);
	}
	
	public List<ChallengeUserVO> listChgUserByMemberNO(int member_no){
		return DBManager.listChgUserByMemberNO(member_no);
	}

}

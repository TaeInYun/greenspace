package com.example.demo.dao;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.MemberVO;

@Repository
public class MemberDAO {
	public int insert(MemberVO m) {
		return DBManager.insertMember(m);
	}
	
	public MemberVO findById(String id) {
		return DBManager.findById(id);
	}
	
	public int checkId(String id) {
		return DBManager.checkId(id);
	}
	
	public String findIdByEmail(String email) {
		return DBManager.findIdByEmail(email);
	}
}
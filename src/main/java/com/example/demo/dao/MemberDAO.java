package com.example.demo.dao;

import java.util.HashMap;

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
	
	public String findIdByEmail(HashMap<String,String> m) {
		return DBManager.findIdByEmail(m);
	}
	
	public String findIdByPhone(HashMap<String,String> m) {
		return DBManager.findIdByPhone(m);
	}
	
	public int findPwdByEmail(HashMap<String,String> m) {
		return DBManager.findPwdByEmail(m);
	}
	
	public int findPwdByPhone(HashMap<String,String> m) {
		return DBManager.findPwdByPhone(m);
	}
	
	
	
}
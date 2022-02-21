package com.example.demo.dao;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.MemberVO;

@Repository
public class MemberDAO {
	//회원가입
	public int insert(MemberVO m) {
		return DBManager.insertMember(m);
	}
	
	//아이디중복체크
	public int checkId(String id) {
		return DBManager.checkId(id);
	}
	
	//닉네임 중복체크
	public int checkNicname(String nickname) {
		return DBManager.checkNickname(nickname);
	}
	
	//이메일 중복체크
	public int checkEmail(String email) {
		return DBManager.checkEmail(email);
	}	

	//로그인
	public MemberVO findById(String id) {
		return DBManager.findById(id);
	}
	
}
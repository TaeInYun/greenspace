package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

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
	
	//회원목록
	public List<MemberVO> findAllMember(){
		return DBManager.findAllMember();
	}
	
}
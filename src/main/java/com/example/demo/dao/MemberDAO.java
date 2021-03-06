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
	public int checkNickname(String nickname) {
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

	public MemberVO orderInfo(int id) {
		return DBManager.orderInfo(id);
	}
	
	//이메일 아이디 찾기
	public String findIdByEmail(HashMap<String,String> m) {
		return DBManager.findIdByEmail(m);
	}
	
	//핸드폰 아이디 찾기
	public String findIdByPhone(HashMap<String,String> m) {
		return DBManager.findIdByPhone(m);
	}
	
	//이메일로 비밀번호 찾기
	public int findPwdByEmail(HashMap<String,String> m) {
		return DBManager.findPwdByEmail(m);
	}
	
	//핸드폰으로 비밀번호 찾기
	public int findPwdByPhone(HashMap<String,String> m) {
		return DBManager.findPwdByPhone(m);
	}
	

	//새비밀번호 설정
	public int updatePwd(HashMap<String, String> m) {
		return DBManager.updatePwd(m);
	}

	public int buyProduct(HashMap map) {
		return DBManager.buyProduct(map);
	}
	
	public int insertBoardPoint(HashMap map) {
		return DBManager.insertBoardPoint(map);
	}


	public List<MemberVO> findAllMember(){
		return DBManager.findAllMember();
	}

	//마이페이지 - 회원 정보 변경 
	public MemberVO getMemberInfo(int member_no){
		return DBManager.getMemberInfo(member_no);
	}
	
	public int updateEmail(HashMap map){
		return DBManager.updateEmail(map);
	}
	
	public int updateNickName(HashMap map){
		return DBManager.updateNickName(map);
	}
	
	public int updatePhone(HashMap map){
		return DBManager.updatePhone(map);
	}
	
	public int updateAccount(HashMap map){
		return DBManager.updateAccount(map);
	}
}
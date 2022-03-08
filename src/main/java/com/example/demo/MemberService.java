package com.example.demo;

import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.demo.dao.MemberDAO;
import com.example.demo.vo.MemberVO;

import lombok.Setter;

@Service
@Setter
public class MemberService implements UserDetailsService{
	
	@Autowired
	private MemberDAO dao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		
		System.out.println("로그인할때 loadUserByUsername이 자동으로 동작합니다.");
		
		//매개변수로 전달받은 username(아이디)에 해당하는 회원의 정보를 db로부터 갖고온다.
		MemberVO m = dao.findById(username);
		
		//만약 존재하지 않은 아이디라면 예외발생
		if(m==null) {
			throw new UsernameNotFoundException(username);
		}
		
		//db로부터 읽어온 회원의 정보를 UserDetails객체로 생성하여 반환한다.
		UserDetails details = User.builder()
				.username(username)
				.password(m.getPwd())
				.roles(Integer.toString(m.getMem_type())).build();
		
		return details;
	}
	

	public String findId(HttpServletResponse response, String email, String name, String phone ) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		HashMap<String, String> map = new HashMap<String, String>();
		PrintWriter out = response.getWriter();
		map.put("name", name);
		map.put("phone", phone);
		map.put("email", email);
		
		if ( !phone.equals( "null")) {		
			String id = dao.findIdByPhone(map);
			System.out.println("findIdByPhone이 실행중입니다.");
			if (id == null) {
				out.println("<script>");
				out.println("alert('가입된 아이디가 없습니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				return null;
			} else {
				return id;
				
			}
				
		} else{
			String id = dao.findIdByEmail(map);
			if (id == null) {
				out.println("<script>");
				out.println("alert('가입된 아이디가 없습니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				return null;
			} else {
				return id;
				
			}
			
		}

	}
			
	public int resetPwd(HttpServletResponse response, String id, String email,  String phone, HttpSession session){
		//회원인지 아닌지 판별할 변수 re
		//re가 1이면 회원 0이면 비회원
		int re;	
		HashMap<String, String> map = new HashMap<String, String>();
		
		//hashMap에 변수들 저장
		map.put("id", id);
		map.put("phone", phone);
		map.put("email", email);
		
		//사용자가 입력한 핸드폰 값이 null이 아니면 findPwdPhon메서드를 실행하여 회원인지 판별
		if (!phone.equals( "null")) {		
			re = dao.findPwdByPhone(map);
			System.out.println("findPwdByPhone가 실행중");
		} else {
			re = dao.findPwdByEmail(map);
			System.out.println("findPwdByEmail가 실행중");
		}
		
		//만약 회원일 경우 세션에 해당 정보를 입력함.
		if(re == 1) {
			session.setAttribute("id", id);
		}
		
		return re;

	}
	

	public int updatePwd(String id, String pwd) {
		HashMap<String, String> map = new HashMap<String, String>();

		map.put("id", id);
		map.put("pwd", pwd);
		
		int re = dao.updatePwd(map);
		
		
		return re;
	}


	
	
	

}
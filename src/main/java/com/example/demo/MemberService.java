package com.example.demo;

import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

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
		
		if (email == null) {		
			map.put("phone", phone);
			map.put("name", name);
			
			String id = dao.findIdByPhone(map);
			
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
				
		} else {
			map.put("email", email);
			map.put("name", name);
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
	
	
	
	public String resetPwd(HttpServletResponse response, String email, String id, String phone  ) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		HashMap<String, String> map = new HashMap<String, String>();
		PrintWriter out = response.getWriter();
		map.put("id", id);
		
		
		if (email == null) {		
			map.put("phone", phone);
			int re = dao.findPwdByPhone(map);
			
			if (re == 1) {
				return "resetId";
			} else {
				out.println("<script>");
				out.println("alert('가입된 아이디가 없습니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				return null;
			}
				
		} else {
			map.put("email", email);
			int re = dao.findPwdByPhone(map);
			if (id == null) {
				return "resetId";
			} else {
				out.println("<script>");
				out.println("alert('가입된 아이디가 없습니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				return null;

			}
			
		}
			
		
	}
	
	

}
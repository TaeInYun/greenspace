package com.example.demo.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.MemberService;
import com.example.demo.dao.MemberDAO;
import com.example.demo.vo.MemberVO;

import lombok.Setter;

@Controller
@Setter
public class MemberController {

	@Autowired
	private MemberDAO dao;
	
	@Autowired
	private MemberService ms;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	
	//회원가입----------------------------
	@RequestMapping(value = "/join",method = RequestMethod.GET)
	public void join_form() {	
	}
	
	@RequestMapping(value="/join", method = RequestMethod.POST)
	public ModelAndView insert_submit(MemberVO m) {
		ModelAndView mav = new ModelAndView("joinOK");
		
		m.setPwd(   passwordEncoder.encode(  m.getPwd()   ) );
		int re = dao.insert(m);
		
		if(re==1) {
			mav.addObject("msg", "회원가입에 성공했습니다.");
		}else {
			mav.addObject("msg", "회원가입에 실패했습니다.");
		}
		
		return mav;
	}
	
	//아이디 체크  : 0이면 사용가능 1이면 중복
	@ResponseBody
	@RequestMapping(value="/checkId", method = RequestMethod.GET)
	public int checkId(@RequestParam(value="id") String id,Model model) {
			
		return dao.checkId(id);
	}
	
	
	//로그인----------------------------
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void login() {
	}
	
	
	//로그인확인----------------------------
	@RequestMapping("/loginOK")  //시큐리티 환경설정파일에서 로그인을 성공하여 여기로 오도록 설정하였습니다.
	public void loginOK(HttpSession session) {
		//로그인한 회원의 정보를 브라우저를 닫기 전까지(로그아웃 하기 전까지)유지하기 위하여 session을 매개변수로 설정합니다.
		
		//로그인한 회원의 정보를 파악하기 위해서는 다음과 같이 시큐리티에게 요청합니다.
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		User user= (User)authentication.getPrincipal();//시큐리티가 인증한(로그인한) 사용자의 정보를 읽어 옵니다.
		
		//인증된 User객체의 id를 뽑아옵니다.		
		String id = user.getUsername();
		
		//만약 로그인한 회원의 다른 정보도 필요하다면 db을 통해 갖고 옵니다.
		MemberVO m =dao.findById(id);
		
		//db로 부터 읽어온 회원객체를 세션에 상태유지합니다.
		//세션에 상태유지를 하면 브라우저를 닫기 전까지(로그아웃 하기 전까지) 상태유지 할 수 있습니다.
		session.setAttribute("m", m);	
	}
	
	//이메일로 아이디 찾기 --------------------------------------------------
	@RequestMapping(value = "/findIdByEmail", method = RequestMethod.GET)
	public void findIdByEmail_form() {
	}
	
	// 아이디 찾기
		@RequestMapping(value = "/findId", method = RequestMethod.POST)
		public String find_id(HttpServletResponse response, @RequestParam("email") String email, Model md) throws Exception{
			md.addAttribute("id", ms.findIdByEmail(response, email));
			return "findId";
		}
	
	
}
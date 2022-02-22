package com.example.demo.controller;

import java.util.Random;

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

import kr.co.youiwe.webservice.BitSms;
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
	@RequestMapping(value="/checkId", method = RequestMethod.GET)
	@ResponseBody
	public int checkId(@RequestParam(value="id") String id,Model model) {
			
		return dao.checkId(id);
	}
	
	//닉네임 체크  : 0이면 사용가능 1이면 중복
	@ResponseBody
	@RequestMapping(value="/checkNickname", method = RequestMethod.GET)
	public int checkNickname(@RequestParam("nickname") String nickname,Model model) {
		System.out.println(nickname);
		return dao.checkNicname(nickname);
	}	
	
	//이메일 체크  : 0이면 사용가능 1이면 중복
	@ResponseBody
	@RequestMapping(value="/checkEmail", method = RequestMethod.GET)
	public int checkEmail(@RequestParam("email") String email,Model model) {
		System.out.println(email);
		return dao.checkEmail(email);
	}	
	
	
	//인증번호
	@RequestMapping("/checkVerification")
	@ResponseBody
	public String checkPhone(String from, String phone, String msg) {
		
		System.out.println("phone:"+phone);	
		String code = "";
		
		Random r = new Random();
		int a = r.nextInt(10);
		int b = r.nextInt(10);
		int c = r.nextInt(10);
		int d = r.nextInt(10);
		code = a+""+b+""+c+""+d;
		System.out.println(code);
		
		BitSms sms = new BitSms();
		sms.sendMsg("01025598279", phone, code);
		
		return code;
	}
	
	
	//로그인----------------------------
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void login() {

	}
	
	//로그인----------------------------
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	public void loginAction() {
		
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
	
	//이메일 아이디 찾기 
	@RequestMapping(value = "/findIdByEmail", method = RequestMethod.GET)
	public void findIdByEmailForm() {
	}
	
	//핸드폰 아이디 찾기
	@RequestMapping(value = "/findIdByPhone", method = RequestMethod.GET)
	public void findIdByPhoneForm() {
	}
	
	//아이디 찾기
	@RequestMapping(value = "/findIdOK", method = RequestMethod.POST)
	public String findIdOk(HttpServletResponse response, @RequestParam String email, @RequestParam String name,@RequestParam String phone, Model md) throws Exception{
		md.addAttribute("id", ms.findId(response, email, name, phone));
		return "findIdOK";
	}
	


	//이메일 비밀번호 찾기
	@RequestMapping(value="/findPwdByEmail", method = RequestMethod.GET )
	public void findPwdByEmail() {
	}
	
	//핸드폰 비밀번호 찾기
	@RequestMapping(value="/findPwdByPhone", method = RequestMethod.GET )
	public void findPwdByPhone() {
	}
	
	
	@RequestMapping(value="/resetPwd", method = RequestMethod.GET)
	public void resetPwdForm() throws Exception{
		
	}
	
	@RequestMapping(value="/resetPwd", method = RequestMethod.POST)
	public String resetPwd(HttpServletResponse response, @RequestParam String id, @RequestParam String email, @RequestParam String phone, Model md) throws Exception{
		md.addAttribute("checkPwd", ms.resetPwd(response, id, email, phone));
		return "resetPwd" ;
	}

	
}
package com.example.demo.controller;

import java.io.PrintWriter;
import java.net.http.HttpRequest;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.MemberService;
import com.example.demo.dao.MemberDAO;
import com.example.demo.vo.MemberVO;

import lombok.Setter;

@Controller
@Setter
public class MyPageController {
	
	@Autowired
	private MemberDAO dao;
	
	@Autowired
	private MemberService ms;

	@Autowired
	private PasswordEncoder passwordEncoder;

	
	@GetMapping("/mypage/memberInfo")
	public void memberInfo(HttpSession session){
		MemberVO m = (MemberVO)session.getAttribute("m");
	}
	
	@PostMapping("/mypage/memberInfo")
	public ModelAndView memberInfo(HttpServletResponse response, HttpSession session, @RequestParam String email){
		ModelAndView mav = new ModelAndView("redirect:/mypage/memberInfo");
		MemberVO member = (MemberVO)session.getAttribute("m");
		int no = member.getNo();
		
		HashMap map = new HashMap();
		map.put("email", email );
		map.put("no", no);
		
		int re = dao.updateEmail(map);
        if(re != 1) {
            mav.setViewName("error");
            mav.addObject("msg", "이메일 변경에 실패하였습니다.");
        }else {
            try{
        		String id = member.getId(); 		
        		MemberVO m = dao.findById(id);
        		session.setAttribute("m", m);
                response.setContentType("text/html;charset=utf-8");
                PrintWriter out = response.getWriter();
                out.println("<script>");
                out.println("alert('이메일 변경이 완료되었습니다');");
                out.println("history.go(-1);");
                out.println("</script>");
                out.close();
            }catch (Exception e){
                System.out.println("예외발생" + e.getMessage());
            }
        }
        
        	return mav;
	}
	
	
    
    
    @PostMapping("/mypage/updateNickName")
    public ModelAndView updateNickName(HttpServletResponse response, HttpSession session, @RequestParam String nickName){
    	ModelAndView mav = new ModelAndView("redirect:/mypage/memberInfo");
		MemberVO member = (MemberVO)session.getAttribute("m");
		int no = member.getNo();
		
		HashMap map = new HashMap();
		map.put("nickName", nickName );
		map.put("no", no);
		
		int re = dao.updateNickName(map);
        if(re != 1) {
            mav.setViewName("error");
            mav.addObject("msg", "변경에 실패하였습니다.");
        }else {
            try{
        		String id = member.getId(); 		
        		MemberVO m = dao.findById(id);
        		session.setAttribute("m", m);
                response.setContentType("text/html;charset=utf-8");
                PrintWriter out = response.getWriter();
                out.println("<script>");
                out.println("alert('변경에 성공하였습니다.');");
                out.println("history.go(-1);");
                out.println("</script>");
                out.close();
            }catch (Exception e){
                System.out.println("예외발생" + e.getMessage());
            }
        }
        
        	return mav;
    	
    }
    
    @PostMapping("/mypage/updateAccount")
    public ModelAndView updateAccount(HttpServletResponse response, HttpSession session, @RequestParam String accountNumber,@RequestParam String bank){
    	ModelAndView mav = new ModelAndView("redirect:/mypage/memberInfo");
		MemberVO member = (MemberVO)session.getAttribute("m");
		int no = member.getNo();
		
		HashMap map = new HashMap();
		map.put("account_number", accountNumber );
		map.put("account_bank", bank);
		map.put("no", no);
		
	      int re = dao.updateAccount(map);
	        if(re != 1) {
	            mav.setViewName("error");
	            mav.addObject("msg", "변경에 실패하였습니다.");
	        }else {
	            try{
	              String id = member.getId();       
	              MemberVO m = dao.findById(id);
	              session.setAttribute("m", m);
	                response.setContentType("text/html;charset=utf-8");
	                PrintWriter out = response.getWriter();
	                out.println("<script>");
	                out.println("alert('변경에 성공하였습니다.');");
	                out.println("history.go(-1);");
	                out.println("</script>");
	                out.close();
	            }catch (Exception e){
	                System.out.println("예외발생" + e.getMessage());
	            }
	        }
		
        
        	return mav;
    	
    }
    
    @PostMapping("/mypage/updatePhone")
    public ModelAndView updatePhone(HttpSession session, HttpServletResponse response,@RequestParam String phone){
    	ModelAndView mav = new ModelAndView("redirect:/mypage/memberInfo");
    	MemberVO member = (MemberVO)session.getAttribute("m");
		int no = member.getNo();
		HashMap map = new HashMap();
		map.put("phone", phone);
		map.put("no", no);
		
		int re = dao.updatePhone(map);
    	 try{
     		String id = member.getId(); 		
     		MemberVO m = dao.findById(id);
     		session.setAttribute("m", m);
             response.setContentType("text/html;charset=utf-8");
             PrintWriter out = response.getWriter();
             out.println("<script>");
             out.println("alert('핸드폰 번호 변경에 성공하였습니다.');");
             out.println("history.go(-1);");
             out.println("</script>");
             out.close();
         }catch (Exception e){
             System.out.println("예외발생" + e.getMessage());
         }
    	
    	return mav;
    	
    }
    
  
    
    
    @PostMapping("/mypage/updatePwd2")
	public ModelAndView updatePwdOK(HttpServletResponse response, HttpSession session, @RequestParam String newPwd, Model model) {
    	ModelAndView mav = new ModelAndView("redirect:/mypage/memberInfo");
    	MemberVO member = (MemberVO)session.getAttribute("m");
		String encodePwd = passwordEncoder.encode(newPwd);
		String id = member.getId();
		
		int re = ms.updatePwd(id, encodePwd);
		
		 try{	
	     		MemberVO m = dao.findById(id);
	     		session.setAttribute("m", m);
	             response.setContentType("text/html;charset=utf-8");
	             PrintWriter out = response.getWriter();
	             out.println("<script>");
	             out.println("alert('비밀번호 변경에 성공하였습니다.');");
	             out.println("history.go(-1);");
	             out.println("</script>");
	             out.close();
	         }catch (Exception e){
	             System.out.println("예외발생" + e.getMessage());
	         }
		
		
		
		
		return mav;
	}
    
}
	
	
	
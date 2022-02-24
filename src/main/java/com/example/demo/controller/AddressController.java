package com.example.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.dao.AddressDAO;
import com.example.demo.dao.MemberDAO;
import com.example.demo.vo.MemberVO;

import lombok.Setter;

@Controller
@Setter
public class AddressController {

	@Autowired
	private AddressDAO dao;
	
	
	
	@RequestMapping("/admin/mainAddress")
	public void detail( Model model,HttpSession session) {	
		int member_no = ((MemberVO)session.getAttribute("m")).getNo();
		model.addAttribute("a", dao.allMainAddress(member_no));
		model.addAttribute("a2", dao.allSubAddress(member_no));
	} 
}

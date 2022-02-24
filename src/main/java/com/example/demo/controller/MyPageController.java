package com.example.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.MemberService;
import com.example.demo.dao.MemberDAO;

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
	public void memberInfo() {
	}
}

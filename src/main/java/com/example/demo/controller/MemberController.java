package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.dao.MemberDAO;

import lombok.Setter;

@Controller
@Setter
public class MemberController {

	@Autowired
	private MemberDAO dao;
	
	@RequestMapping("mypage/listmember")
	public void findAll() {
		dao.findAll();
	}
}

package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JspTest {

	
	@RequestMapping("/Index")
	public void index() {	
		
	}
	

	
	@RequestMapping("/mainpage/member")
	public void member() {	
		
	}
	
	
	@RequestMapping("/mainpage/nonmember")
	public void nonmember() {	
		
	}
}

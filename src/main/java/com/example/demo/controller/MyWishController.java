package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.dao.MyWishDAO;

import lombok.Setter;

@Controller
@Setter
public class MyWishController {
	
	@Autowired
	private MyWishDAO dao;
	
	@RequestMapping("/myWishList")
	public void myWishList() {
		dao.findByMember();
	}
}

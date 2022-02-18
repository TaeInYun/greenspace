package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.example.demo.dao.ProductDAO;

import lombok.Setter;

@Controller
@Setter
public class ProductController {
	@Autowired
	private ProductDAO dao;
	
}

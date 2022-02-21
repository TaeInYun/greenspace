package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.CartDAO;
import com.example.demo.vo.CartVO;

import lombok.Setter;

@Controller
@Setter
public class CartController {
	
	@Autowired
	private CartDAO dao;
	
	@RequestMapping("/shop/insertCart")
	public ModelAndView insertCart(CartVO c) {
		ModelAndView mav = new ModelAndView("redirect:/shop/cart");
		dao.insert(c);
		return mav;
	}
}

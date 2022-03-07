package com.example.demo.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.CartDAO;
import com.example.demo.dao.MyWishDAO;
import com.example.demo.vo.CartVO;
import com.example.demo.vo.MemberVO;

import lombok.Setter;

@Controller
@Setter
public class CartController {
	
	@Autowired
	private CartDAO dao;
	
	
	@RequestMapping("/shop/insertCart")
	@ResponseBody
	public String insertCart(HttpSession session,CartVO c) {
		MemberVO m = (MemberVO)session.getAttribute("m");
		c.setMember_no(m.getNo());
		
		String msg = "장바구니에 추가하지 못했습니다.";
		int re = dao.insert(c);

		if(re == 1) {
			msg = "장바구니에 추가 되었습니다.";
		}
		return msg;
	}

	@RequestMapping("/shop/isCart")
	@ResponseBody
	public int isCart(HttpSession session,CartVO c) {
		MemberVO m = (MemberVO)session.getAttribute("m");
		c.setMember_no(m.getNo());
		
		int re = dao.isCart(c);
		return re;
	}
	
	@RequestMapping("/shop/deleteCart")
	@ResponseBody
	public String deleteCart(@RequestParam(value="data[]") List<String> arr) {
		String msg = "";
		 
		for(String no : arr) { int re = dao.delete(Integer.parseInt(no)); }
		return msg;
	}
	
	@RequestMapping("/shop/updateQty")
	@ResponseBody
	public String updateQty(HttpSession session,CartVO c) {
		MemberVO m = (MemberVO)session.getAttribute("m");
		c.setMember_no(m.getNo());
		
		String msg = "변경 실패";
		
		
		int re = dao.updateQty(c);
		
		if(re == 1) {
			msg = "변경";
		}
		
		return msg;
	}
}

package com.example.demo.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.CartDAO;
import com.example.demo.dao.MyWishDAO;
import com.example.demo.vo.CartVO;

import lombok.Setter;

@Controller
@Setter
public class CartController {
	
	@Autowired
	private CartDAO dao;
	
	@RequestMapping("/shop/insertCart")
	@ResponseBody
	public String insertCart(CartVO c) {
		String msg = "장바구니에 추가하지 못했습니다.";
		int re = dao.insert(c);

		if(re == 1) {
			msg = "장바구니에 추가 되었습니다.";
		}
		return msg;
	}

	@RequestMapping("/shop/isCart")
	@ResponseBody
	public int isCart(CartVO c) {
		HashMap map = new HashMap();
		map.put("pro_no", c.getPro_no());
		map.put("cart_option", c.getCart_option());
		map.put("cart_option_detail", c.getCart_option_detail());
		map.put("member_no", 1);
		
		int re = dao.isCart(map);
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
	public String updateQty(CartVO c) {
		String msg = "변경 실패";
		System.out.println(c.getCart_qty());
		System.out.println(c.getNo());
		
		HashMap map = new HashMap<>();
		map.put("cart_qty", c.getCart_qty());
		map.put("no", c.getNo());
		map.put("member_no", 1);
		
		int re = dao.updateQty(map);
		
		if(re == 1) {
			msg = "변경";
		}
		
		return msg;
	}
}

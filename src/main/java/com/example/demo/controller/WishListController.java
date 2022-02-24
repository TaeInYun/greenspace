package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dao.WishListDAO;
import com.example.demo.vo.WishListVO;

import lombok.Setter;

@Controller
@Setter
public class WishListController {
	
	@Autowired
	private WishListDAO dao;
	
	@RequestMapping("shop/wishList")
	public void findByMemberWish(Model model) {
		int member_no = 1;
		
		model.addAttribute("list", dao.findByMemberWish(member_no) );
		model.addAttribute("cnt", dao.cntOfWishList(member_no) );
	}
	
	@RequestMapping("shop/deleteWishList")
	@ResponseBody
	public String deleteWishList(@RequestParam(value="data[]") List<String> arr) {
		String msg = "";
		 
		for(String no : arr) { 
			int re = dao.deleteWishList(Integer.parseInt(no)); 
		}
		
		return msg;
	}

	@RequestMapping("shop/insertWishList")
	@ResponseBody
	public int insertWishList(WishListVO w) {
		String msg = "위시리스트에 추가하지 못했습니다.";
		int re = dao.insert(w);
		return re;
	}
}

package com.example.demo.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dao.Pro_add_optionDAO;
import com.example.demo.dao.WishListDAO;
import com.example.demo.vo.WishListVO;

import lombok.Setter;

@Controller
@Setter
public class WishListController {
	
	@Autowired
	private WishListDAO dao;
	
	@Autowired
	private Pro_add_optionDAO proAddOptionDAO;
	
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
		w.setMember_no(1);
		if( w.getCart_option() != null) {
			HashMap map = new HashMap();
			map.put("pro_option_detail_name", w.getCart_option_detail());
			map.put("pro_option_name", w.getCart_option());
			map.put("pro_no", w.getPro_no());
			w.setPro_add_option_no(proAddOptionDAO.findProAddOptionNoForWishList(map));
		};
		
		int re = dao.insert(w);
		
		if(re==1) {
			msg = "위시리스트에 추가하였습니다.";
		}
		
		return re;
	}
	
	@RequestMapping("shop/isWishList")
	@ResponseBody
	public int isWishList(WishListVO w) {
		w.setMember_no(1);
		
		int cnt = dao.isWishList(w);
		
		return cnt;
	}
}

package com.example.demo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.dao.AddressDAO;
import com.example.demo.dao.MyWishDAO;
import com.example.demo.vo.MyWishVO;

import lombok.Setter;

@Controller
@Setter
public class MyWishController {
	
	@Autowired
	private MyWishDAO dao_mywish;
	
	@Autowired
	private AddressDAO dao_addr;
	
	
	
	@RequestMapping("/shop/cart")
	public void myWishList(Model model) {
		int member_no = 1;
		
		List<MyWishVO> list = dao_mywish.findByMember(member_no);
		model.addAttribute("list", list);
		model.addAttribute("cnt", dao_mywish.cntOfCart(member_no));
		model.addAttribute("addr", dao_addr.getMainAddress(member_no));
	}

}

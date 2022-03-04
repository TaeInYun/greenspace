package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.dao.OrderListDAO;

import lombok.Setter;

@Controller
@Setter
public class OrderListController {
	
	@Autowired
	private OrderListDAO dao;
	
	@RequestMapping("/mypage/myOrder")
	public void myOrderList(Model model) {
		int member_no = 1;
		model.addAttribute("list", dao.findAllOrderListByMemberNo(member_no));
	}
}

package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
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
	
	@RequestMapping("/shop/detailOrderList")
	public void detailOrderList(Model model, HttpServletRequest request,String id, String day) {
		HttpSession session= request.getSession();
		
		session.setAttribute("id", id);
		session.setAttribute("day", day);
		model.addAttribute("list", dao.findOrderListByOrdId(id));
	}
	
}

package com.example.demo.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.OrderListDAO;
import com.example.demo.vo.OrderListVO;

import lombok.Setter;

@Controller
@Setter
public class nonMemberController {
	
	@Autowired
	private OrderListDAO dao;
	
	//주문조회 로그인
	@RequestMapping(value="/loginByOrderId",method=RequestMethod.GET)
	public void loginByOrderId_form() {
	}
	
	//주문조회 로그인
	@RequestMapping(value = "/loginByOrderId",method = RequestMethod.POST)
	@ResponseBody
	public String loginByOrderId_submit(@RequestParam("name") String name,@RequestParam("ord_id") String ord_id, HttpSession session) {
		
		System.out.println(name+ord_id);
		String data="fail";
		
		OrderListVO order = dao.LoginByOrderId(name,ord_id);//이름,주문번호,전화번호
		
		if(order!=null) {
			data="success";
			session.setAttribute("order", order);
		}else {
			data="fail";
		}
		System.out.println(data);
		return data;
	}	
	
	
	//주문조회 로그인
	@RequestMapping("/loginByOrderIdOK")
	public void loginByOrderIdOK() {
	
	}
	
	
}

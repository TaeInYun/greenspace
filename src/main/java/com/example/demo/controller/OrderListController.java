package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.dao.AddressDAO;
import com.example.demo.dao.MemberDAO;
import com.example.demo.dao.OrderListDAO;
import com.example.demo.dao.OrdersDAO;
import com.example.demo.dao.ReceiverDAO;
import com.example.demo.vo.OrdersVO;

import lombok.Setter;

@Controller
@Setter
public class OrderListController {
	
	@Autowired
	private OrderListDAO orderListDao;
	
	@Autowired
	private AddressDAO addressDAO;
	
	@Autowired
	private MemberDAO memberDao;

	@Autowired
	private ReceiverDAO receiverDao;
	
	@Autowired
	private OrdersDAO ordersDao;
	
	@RequestMapping("/mypage/myOrder")
	public void myOrderList(Model model) {
		int member_no = 1;
		model.addAttribute("list", orderListDao.findAllOrderListByMemberNo(member_no));
	}
	
	@RequestMapping("/shop/detailOrderList")
	public void detailOrderList(Model model, HttpServletRequest request,String id, String day) {
		HttpSession session= request.getSession();
		int member_no = 1;
		String ord_id = id;
		
		OrdersVO o = ordersDao.receiverInfoByOrdId(ord_id);
		
		int addr_no = 0;
		int receiver_no = 0;
		
		addr_no = o.getAddress_no();
		receiver_no = o.getReceiver_no();
		
		if(addr_no != 0) {
			model.addAttribute("addr", addressDAO.findAddressInfoByNo(addr_no));
		}else if(receiver_no != 0) {
			model.addAttribute("addr", receiverDao.findByNo(receiver_no));
		}
		
		session.setAttribute("id", id);
		session.setAttribute("day", day);
		model.addAttribute("list", orderListDao.findOrderListByOrdId(id));
		model.addAttribute("member", memberDao.orderInfo(member_no));
		model.addAttribute("ord", o);
	}
	
}

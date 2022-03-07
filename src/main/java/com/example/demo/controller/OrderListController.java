package com.example.demo.controller;

import java.util.HashMap;

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
import com.example.demo.vo.MemberVO;
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
	public void myOrderList(HttpSession session,Model model) {
		MemberVO m = (MemberVO)session.getAttribute("m");
		int member_no = m.getNo();
		
		String fristDate = null;
		String lastDate = null;
		
		HashMap map = new HashMap();
		map.put("member_no", member_no);
		map.put("fristDate", member_no);
		map.put("lastDate", member_no);
		
		
		model.addAttribute("list", orderListDao.findAllOrderListByMemberNo(map));
	}
	
	@RequestMapping("/shop/detailOrderList")
	public void detailOrderList(Model model, HttpSession session,String id, String day) {
		MemberVO m = (MemberVO)session.getAttribute("m");
		int member_no = m.getNo();
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

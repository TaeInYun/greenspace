package com.example.demo.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dao.AddressDAO;
import com.example.demo.dao.MemberDAO;
import com.example.demo.dao.OrderListDAO;
import com.example.demo.dao.OrdersDAO;
import com.example.demo.dao.ReceiverDAO;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.OrderListVO;
import com.example.demo.vo.OrdersVO;
import com.example.demo.vo.PagingOrderListVO;
import com.example.demo.vo.SearchVO;

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
    
	private int PAGESIZE = 2;    //한 화면에 보여줄 레코드의 수
    private int totalRecord;      //전체 레코드 수
    private int totalPage;        //전체 페이지

	@RequestMapping("/mypage/findOrderListByDate")
	@ResponseBody
	public PagingOrderListVO myOrderListBydate(HttpServletRequest request,HttpSession session,SearchVO s, Model model ) {
		MemberVO m = (MemberVO)session.getAttribute("m");
		//int member_no = m.getNo();
		int member_no = 42;
		int start=s.getStart();//페이지번호
		
		HttpSession httpSession	  = request.getSession();
		
		if(start==0) {
			start=1;
		}
		
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("member_no", member_no);
		map.put("day", s.getDay());
		map.put("fristDate", s.getFristDate());
		map.put("lastDate", s.getLastDate());
		map.put("month", s.getMonth());
		
		
		totalRecord = orderListDao.cntByMember(map);
		totalPage = (int)Math.ceil(totalRecord/(double)PAGESIZE);
		
		PagingOrderListVO po = new PagingOrderListVO();
		po.setOrd(orderListDao.findAllOrderListByMemberNo(map));
		po.setPeriod(s.getPeriod());
		po.setTotalPage(totalPage);
		/*
		session.setAttribute("period", s.getPeriod());
		session.setAttribute("totalPage", totalPage);
		*/
		return po;
	}
	
	@RequestMapping("/mypage/myOrder")
	public void myOrderList(HttpSession session,Model model) {
		MemberVO m = (MemberVO)session.getAttribute("m");
		int member_no = m.getNo();
		int pageNum = 1;
		
		HashMap map = new HashMap();
		map.put("member_no", member_no);
		map.put("start", pageNum);
		totalRecord = orderListDao.cntByMember(map);
		totalPage = (int)Math.ceil(totalRecord/(double)PAGESIZE);
		
		model.addAttribute("period", "allDay");
		model.addAttribute("list", orderListDao.findAllOrderListByMemberNo(map));
		model.addAttribute("totalPage", totalPage);
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

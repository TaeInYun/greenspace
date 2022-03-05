package com.example.demo.controller;

import java.awt.Point;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.CartDAO;
import com.example.demo.dao.MemberDAO;
import com.example.demo.dao.OrdersDAO;
import com.example.demo.dao.OrdersProductDAO;
import com.example.demo.dao.PointDAO;
import com.example.demo.dao.Pro_add_optionDAO;
import com.example.demo.dao.ProductDAO;
import com.example.demo.vo.ApplyOrderVO;
import com.example.demo.vo.CartVO;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.OrderBillVO;
import com.example.demo.vo.OrdersProductVO;
import com.example.demo.vo.OrdersVO;
import com.example.demo.vo.PointVO;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Setter;

@Controller
@Setter
public class OrdersController {
	
	@Autowired
	private OrdersDAO ordersDao;
	
	@Autowired
	private CartDAO cartDAO;
	
	@Autowired
	private OrdersProductDAO ordersProductDAO;
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private Pro_add_optionDAO proAddOptionDAO;
	
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private PointDAO pointDAO;
	
	
	@RequestMapping("/getCntOfToday")
	@ResponseBody
	public int getCntOfToday() {
		return ordersDao.getCntOfToday();
	}
	@RequestMapping(value = "/shop/resultOrder", method = RequestMethod.GET)
	public void OrderOK() {
		
	}
	
	@RequestMapping(value = "/shop/resultOrder", method = RequestMethod.POST)
	public void applyOrder(HttpServletRequest request,ApplyOrderVO data) {
		HttpSession session = request.getSession();
		
		int member_no = 1;
		
		String ord_id = data.getOrd_id();
		int ord_use_point = data.getOrd_use_point();
		int ord_price = data.getOrd_price();
		String payment_code = data.getPayment_code();
		String ord_status_code = data.getOrd_status_code();
		String apply_num = data.getApply_num();
		int address_no = data.getAddress_no();
		int receiver_no = data.getReceiver_no();
		int point_save = data.getPoint_save();
		String imp_uid = data.getImp_uid();
		
		PointVO savePoint = new PointVO(0, null, "적립", point_save, member_no, "BUY");
		PointVO usePoint = new PointVO(0, null, "사용", ord_use_point, member_no, null);
		pointDAO.insertPoint(savePoint);
		int re = pointDAO.insertPoint(usePoint);
		System.out.println("point:" + re);
		
		HashMap map = new HashMap();
		map.put("member_no", member_no);
		map.put("ord_id", ord_id);
		map.put("addr_no", address_no);
		map.put("receiver_no", receiver_no);
		System.out.println("address_no" + address_no);
		System.out.println("ord_id" + ord_id);
		System.out.println("receiver_no" + receiver_no);

		
		//주문내역 추가를 위한 변수
		OrdersVO o = new OrdersVO();
		o.setOrd_id(ord_id);
		o.setOrd_use_point(ord_use_point);
		o.setOrd_price(ord_price);
		o.setPayment_code(payment_code);
		o.setOrd_status_code(ord_status_code);
		o.setApply_num(apply_num);
		o.setImp_uid(imp_uid);
		o.setMember_no(member_no);
		o.setAddress_no(address_no);
		o.setReceiver_no(receiver_no);
		
		//주문내역 추가 ( 주문정보)
		ordersDao.insertOrders(o);
		
		//주문정보 상태유지
		OrderBillVO ob = ordersDao.billOfOrder(map);
		
		System.out.println("ob" + ob);
		
		//주문상품 상태유지를 위한 변수
		List<CartVO> proInfo = new ArrayList<>();
		
		for(String s : data.getArr_cartNo() ) {
			int no = Integer.parseInt(s);
			map.put("cart_no", no);
			
			CartVO c = cartDAO.findByCartNo(map);
			System.out.println("카트정보:" + c);
			//상태유지 변수에 추가
			proInfo.add(c);
			
			int pro_no = c.getPro_no();
			int ord_pro_qty = c.getCart_qty();
			map.put("pro_no", pro_no);
			
			int pro_add_option_no = proAddOptionDAO.findProAddPriceNo(map);
			System.out.println( "pro_no"+ pro_no + "pro_add_option_no" + pro_add_option_no);
			
			map.put("ord_pro_qty", ord_pro_qty);
			map.put("pro_add_option_no", pro_add_option_no);
			map.put("ord_pro_qty", ord_pro_qty);
			map.put("point_save", point_save);
			map.put("point_use", ord_use_point);
			
			System.out.println("map: " + map);
			
			int ord_pro_price = ordersDao.getTotalPay(map);
			map.put("ord_pro_price", ord_pro_price);
			
			//주문상품테이블추가
			ordersProductDAO.insertOrderProduct(map);
			//상품 재고 수정
			productDAO.updateStockcuzBuy(map);
			
			//회원 포인트정보 수정
			memberDAO.buyProduct(map);
			
			//카트테이블 주문상품 삭제
			//cartDAO.delete(no);
			
		}
		session.setAttribute("orderInfo", ob);
		session.setAttribute("proInfo", proInfo);
	}
}

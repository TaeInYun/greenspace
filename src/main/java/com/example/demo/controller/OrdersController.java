package com.example.demo.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dao.CartDAO;
import com.example.demo.dao.MemberDAO;
import com.example.demo.dao.OrdersDAO;
import com.example.demo.dao.OrdersProductDAO;
import com.example.demo.dao.Pro_add_optionDAO;
import com.example.demo.vo.ApplyOrderVO;
import com.example.demo.vo.CartVO;
import com.example.demo.vo.MemberVO;
import com.example.demo.vo.OrdersProductVO;
import com.example.demo.vo.OrdersVO;
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
	
	
	
	@RequestMapping("/getCntOfToday")
	@ResponseBody
	public int getCntOfToday() {
		return ordersDao.getCntOfToday();
	}
	
	@RequestMapping("/shop/resultOrder")
	public void applyOrder(Model model, ApplyOrderVO data) {
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
		
		HashMap map = new HashMap();
		map.put("member_no", member_no);
		
		//insert Orders
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
		
		int re = ordersDao.insertOrders(o);
		
		System.out.println("insertOrders : " + re);
		
		for(String s : data.getArr_cartNo() ) {
			int no = Integer.parseInt(s);
			map.put("cart_no", no);
			
			CartVO c = cartDAO.findByCartNo(map);

			int pro_no = c.getPro_no();
			int ord_pro_qty = c.getCart_qty();
			
			int pro_add_option_no = proAddOptionDAO.findProAddPriceNo(no);
			System.out.println( "pro_no"+ pro_no + "pro_add_option_no" + pro_add_option_no);
			
			map.put("pro_add_option_no", pro_add_option_no);
			map.put("pro_no", pro_no);
			map.put("ord_pro_qty", ord_pro_qty);
			map.put("point_save", point_save);
			map.put("ord_no", ord_id);
			map.put("point_use", ord_use_point);
			
			System.out.println("map: " + map);
			
			int ord_pro_price = ordersDao.getTotalPay(map);
			System.out.println("ord_pro_price" + ord_pro_price);
			map.put("ord_pro_price", ord_pro_price);
			
			
			int a = ordersProductDAO.insertOrderProduct(map);
			
			int b = memberDAO.buyProduct(map);
			//카트테이블 주문상품 삭제
			int cd = cartDAO.delete(no);
			
			
			 System.out.println("insertOrderProduct : " + a);
			 System.out.println("buyProduct : " + b); 
			 System.out.println("delete : " + cd);
			 
		}
	}
}

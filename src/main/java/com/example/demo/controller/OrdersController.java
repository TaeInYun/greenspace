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
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
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
import com.google.gson.Gson;

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
	@ResponseBody
	public String applyOrder(HttpServletRequest request, @RequestBody ApplyOrderVO data) {
		 Gson gson = new Gson(); String result =
		 gson.toJson(data.getOrders().getOrd_id());
		 
		
		HttpSession session = request.getSession();
		int member_no = 1;
		
		data.getOrders().setMember_no(member_no);
		OrdersVO o = data.getOrders();

		int point_save = data.getOrders().getPoint_save();
		int ord_use_point = data.getOrders().getOrd_use_point();
		
		PointVO savePoint = new PointVO(0, null, "적립", point_save, member_no, "BUY");
		PointVO usePoint = new PointVO(0, null, "사용", ord_use_point, member_no, null);
		
		pointDAO.insertPoint(savePoint);
		int re = pointDAO.insertPoint(usePoint);
		System.out.println("point:" + re);
		
		HashMap map = new HashMap();
		map.put("member_no", member_no);
		map.put("point_save", point_save);
		map.put("point_use", ord_use_point);
		
		//회원 포인트정보 수정
		memberDAO.buyProduct(map);
		
		ordersDao.insertOrders(o);
		//주문정보 상태유지
		OrderBillVO ob = ordersDao.billOfOrder(o);
		
		//주문상품 상태유지를 위한 변수
		List<CartVO> proInfo = new ArrayList<>();
		

		for(String s : data.getArr_cartNo() ) {
			
			int no = Integer.parseInt(s);
			map.put("cart_no", no);
			
			CartVO c = cartDAO.findByCartNo(map);
			
			int pro_no = c.getPro_no();
			int ord_pro_qty = c.getCart_qty();
			map.put("pro_no", pro_no);
			
			int pro_add_option_no = proAddOptionDAO.findProAddPriceNo(map);
			
			map.put("pro_add_option_no", pro_add_option_no);
			map.put("ord_pro_qty", ord_pro_qty);

			int ord_pro_price = ordersDao.getTotalPay(map);
			map.put("ord_pro_price", ord_pro_price);
			
			//주문상품테이블추가
			ordersProductDAO.insertOrderProduct(map);
			//상품 재고 수정
			productDAO.updateStockcuzBuy(map);
			
			//카트테이블 주문상품 삭제
			//cartDAO.delete(no);
			
			//상태유지 변수에 추가
			proInfo.add(c);
			
		}

		session.setAttribute("orderInfo", ob);
		session.setAttribute("proInfo", proInfo);
		
		return result;
	}
}

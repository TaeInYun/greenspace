package com.example.demo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dao.AddressDAO;
import com.example.demo.dao.MyWishDAO;
import com.example.demo.dao.OrderListDAO;
import com.example.demo.vo.MyWishVO;
import com.example.demo.vo.OrderListVO;

import lombok.Setter;

@Controller
@Setter
public class MyWishController {
	
	@Autowired
	private MyWishDAO dao_mywish;
	
	@Autowired
	private OrderListDAO dao_orderList;
	
	
	@RequestMapping("/shop/cart")
	public void myWishList(Model model) {
		int member_no = 1;
		
		List<MyWishVO> list = dao_mywish.findByMember(member_no);
		OrderListVO info = dao_orderList.initOrderInfo(member_no);

		if(info.getPro_saleprice() < 50000) {
			info.setDelivery_price(2500);
		}else {
			info.setDelivery_price(0);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("cnt", dao_mywish.cntOfCart(member_no));
		model.addAttribute("info", info);
	}

}

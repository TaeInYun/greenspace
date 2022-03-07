package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.OrderListVO;
import com.example.demo.vo.SearchVO;

@Repository
public class OrderListDAO {

	public OrderListVO LoginByOrderId(String name,String ord_id) {
		return DBManager.LoginByOrderId(name,ord_id);
	}
	
	public OrderListVO initOrderInfo(int member_no) {
		return DBManager.initOrderInfo(member_no);
	}
	public List<OrderListVO> findAllOrderListByMemberNo(HashMap map) {
		return DBManager.findAllOrderListByMemberNo(map);
	}
	public List<OrderListVO> findOrderListByOrdId(String id) {
		return DBManager.findOrderListByOrdId(id);
	}
	public int cntByMember(HashMap map) {
		return DBManager.cntByMember(map);
	}
}

package com.example.demo.dao;

import java.util.HashMap;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.OrderBillVO;
import com.example.demo.vo.OrdersVO;

@Repository
public class OrdersDAO {
	
	public int getCntOfToday() {
		return DBManager.getCntOfToday();
	}
	public int insertOrders(OrdersVO o) {
		return DBManager.insertOrders(o);
	}
	public int getTotalPay(HashMap map) {
		return DBManager.getTotalPay(map);
	}
	public OrderBillVO billOfOrder(HashMap map) {
		return DBManager.billOfOrder(map);
	}
	public OrdersVO receiverInfoByOrdId(String ord_id) {
		return DBManager.receiverInfoByOrdId(ord_id);
	}
}
